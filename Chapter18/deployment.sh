#Run a precheck to verify that the Kubernetes cluster is ready for installing Istio in it:
istioctl experimental precheck

#Install Istio using the demo profile with the following command:
istioctl install --skip-confirmation \
  --set profile=demo \
  --set meshConfig.accessLogFile=/dev/stdout \
  --set meshConfig.accessLogEncoding=JSON

#Wait for the Deployment objects and their Pods to be available with the following command:
kubectl -n istio-system wait --timeout=600s --for=condition=available deployment --all

#Next, install the extra components described in the Introducing Istio section – Kiali, Jaeger, Prometheus, and Grafana – with the commands:
istio_version=$(istioctl version --short --remote=false)
echo "Installing integrations for Istio v$istio_version"

kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/$istio_version/samples/addons/kiali.yaml

kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/$istio_version/samples/addons/jaeger.yaml

kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/$istio_version/samples/addons/prometheus.yaml

kubectl apply -n istio-system -f https://raw.githubusercontent.com/istio/istio/$istio_version/samples/addons/grafana.yaml


#Wait a second time for the extra components to be available with the following command:
kubectl -n istio-system wait --timeout=600s --for=condition=available deployment --all

#Finally, run the following command to see what we got installed:
kubectl -n istio-system get deploy

#Run the following command to apply the Helm chart:

helm upgrade --install istio-hands-on-addons kubernetes/helm/environments/istio-system -n istio-system --wait

#add host file
3.0.229.204 kiali.minikube.me
3.0.229.204 tracing.minikube.me
3.0.229.204 prometheus.minikube.me
3.0.229.204 grafana.minikube.me
3.0.229.204 minikube.me grafana.minikube.me kiali.minikube.me prometheus.minikube.me tracing.minikube.me kibana.minikube.me elasticsearch.minikube.me mail.minikube.me health.minikube.me

#Verify that Kiali, Jaeger, Grafana, and Prometheus can be reached through the tunnel with the following commands:
curl -o /dev/null -sk -L -w "%{http_code}\n" https://kiali.minikube.me/kiali/
curl -o /dev/null -sk -L -w "%{http_code}\n" https://tracing.minikube.me
curl -o /dev/null -sk -L -w "%{http_code}\n" https://grafana.minikube.me
curl -o /dev/null -sk -L -w "%{http_code}\n" https://prometheus.minikube.me/graph#/

#Recreate the hands-on Namespace, and set it as the default Namespace:
kubectl delete namespace hands-on
kubectl apply -f kubernetes/hands-on-namespace.yml
kubectl config set-context $(kubectl config current-context) --namespace=hands-on

#dry-run
helm install --dry-run --debug hands-on-dev-env \
 kubernetes/helm/environments/dev-env

#First, we update the dependencies in the components folder:
for f in kubernetes/helm/components/*; do helm dep up $f; done

#Next, we update the dependencies in the environments folder:
for f in kubernetes/helm/environments/*; do helm dep up $f; done

helm install hands-on-dev-env \
  kubernetes/helm/environments/dev-env \
  -n hands-on --wait


ACCESS_TOKEN=$(curl -k https://writer:secret@minikube.me:443/oauth2/token -d grant_type=client_credentials -s | jq .access_token -r)

echo ACCESS_TOKEN=$ACCESS_TOKEN

siege https://minikube.me/product-composite/1 -H "Authorization: Bearer $ACCESS_TOKEN" -c1 -d1 -v
