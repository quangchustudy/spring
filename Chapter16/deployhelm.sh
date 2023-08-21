#udpate dependencies i the components folder:
for f in kubernetes/helm/components/*; do helm dep up $f; done

#Next, we update the dependencies in the environments folder:
for f in kubernetes/helm/environments/*; do helm dep up $f; done

#Finally, we verify that the dependencies for the dev-env folder look good:
helm dep ls kubernetes/helm/environments/dev-env/

#Before using the Helm charts, render the templates using the helm template command to see what the manifests will look like:
helm template kubernetes/helm/environments/dev-env

#dry-run
helm install --dry-run --debug hands-on-dev-env \
 kubernetes/helm/environments/dev-env

#To initiate the deployment of the complete system landscape including creating the Namespace, hands-on, run the following command:
helm install hands-on-dev-env \
  kubernetes/helm/environments/dev-env \
  -n hands-on-c16 \
  --create-namespace

kubectl config set-context $(kubectl config current-context) --namespace=hands-on-c16

kubectl expose deployment zipkin-server  --type=LoadBalancer  --name=service-zipkin

kubectl get svc

#test
HOST=a78fa8cf2fdd24e8896d5c7accf9bd2e-485482072.ap-southeast-1.elb.amazonaws.com PORT=443 USE_K8S=true ./test-em-all.bash

#check each template file
cd $BOOK_HOME/Chapter16/kubernetes/helm
for f in components/*; do helm dependency update $f; done
helm dependency update environments/dev-env
helm template environments/dev-env -s templates/secrets.yaml

#check template file
cd $BOOK_HOME/Chapter16/kubernetes/helm/components/config-server
helm dependency update .
helm template . -s templates/configmap_from_file.yaml

for f in components/*; do print $f; done
