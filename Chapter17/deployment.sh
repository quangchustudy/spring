#First, we update the dependencies in the components folder
for f in kubernetes/helm/components/*; do helm dep up $f; done

#Next, we update the dependencies in the environments folder:
for f in kubernetes/helm/environments/*; do helm dep up $f; done

#dry-run
helm install --dry-run --debug hands-on-dev-env \
 kubernetes/helm/environments/dev-env

#Set the hands-on namespace as the default namespace for kubectl:
kubectl config set-context $(kubectl config current-context) --namespace=hands-on

#In a separate terminal window, run the following command to monitor how certificate objects are created by the cert-manager:
kubectl get certificates -w --output-watch-events

#Deploy the system landscape using Helm and wait for all deployments to complete:
helm install hands-on-dev-env \
  kubernetes/helm/environments/dev-env \
  -n hands-on \
  --create-namespace \
  --wait


kubectl get pods --watch

zipkin-server

kubectl expose deployment zipkin-server  --type=LoadBalancer  --name=nginx-service-zipkin
