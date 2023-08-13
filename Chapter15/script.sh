#change the namespace of the current context
kubectl config set-context $(kubectl config current-context) --namespace my-namespace

#create the namespace and change the default namespace of the context
kubectl create namespace first-attempts
kubectl config set-context $(kubectl config current-context) --namespace=first-attempts

#deploy
cd $BOOK_HOME/Chapter15
kubectl apply -f kubernetes/first-attempts/nginx-deployment.yaml

#watch the pod
kubectl get pod --watch

#delete the pod
kubectl delete pod --selector app=nginx-app

#To enable external communication with the web servers, create a Service using the kubernetes/first-attempts/nginx-service.yaml file:

kubectl delete deployment nginx-deploy

#https://repost.aws/knowledge-center/eks-kubernetes-services-cluster
