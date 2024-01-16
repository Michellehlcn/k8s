# create simple application
python3 -m venv venv
source venv/bin/activate
python3 -m pip install -r requirements.txt

# containerize a simple application
# docker build 
docker build -t k8s-fast-api .
# run locally
docker run -p 8000:80 k8s-fast-api

# push to Container registry
# push to registry : dockerhub
docker build -t michellehlcn/kubernetes:0.0.1 .
# docker push 
docker push michellehlcn/kubernetes:0.0.1

# Create cluster on vivo 
#Create k8s resource definitions
# export kubeconfig
export KUBECONFIG="${PWD}/civo-kubeconfig"
kubectl get nodes 
#Apply resources
kubectl apply -f .
kubectl get pods
kubectl get pods -w
kubectl port-forward fast-api-xx-xxx 8080:80

#Add DNS records to cloudflare, add public IP to DNS 

#Validate port forward, browser

# Load balancing
# get into the container
k get namespaces
k get ingress
kubectl exec -it "namecontainer" --bash
>>echo $HOSTNAME
python3
os.environ



