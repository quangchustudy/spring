#Recreate the Namespace, hands-on, and set it as the default Namespace:
kubectl delete namespace hands-on
kubectl apply -f kubernetes/hands-on-namespace.yml
kubectl config set-context $(kubectl config current-context) --namespace=hands-on

#Resolve the Helm chart dependencies with the following commands.
#First, we update the dependencies in the components folder:

for f in kubernetes/helm/components/*; do helm dep up $f; done

#Next, we update the dependencies in the environments folder:

for f in kubernetes/helm/environments/*; do helm dep up $f; done

#Deploy the system landscape using Helm and wait for all deployments to complete:
helm install hands-on-dev-env \
  kubernetes/helm/environments/dev-env \
  -n hands-on --wait
