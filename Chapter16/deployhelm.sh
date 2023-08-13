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
  -n hands-on \
  --create-namespace


#test
HOST=ad12e05c40aeb4a06a7f188391e91923-821040255.ap-southeast-1.elb.amazonaws.com PORT=443 USE_K8S=true ./test-em-all.bash
