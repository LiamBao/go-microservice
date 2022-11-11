# go-microservice


## GO-microservice Dev Env:

### Installation 

1. run `users.sql ` in postgres


2. cat `/etc/hosts` 

```
# End of section
127.0.0.1 front-end.info broker-service.info
```

3. in dir ./project

>kubectl apply -f postgres.yml
>kubectl apply -f ./k8s/
>kubectl apply -f ingress.yml
>minikube tunnel 



###  Kubernets and  `minikube ` `kubectl` tools

```
minikube start --nodes=2  //initialize the nodes on your computer

minikube stop 
minikube start 

kubectl apply -f k8s

kubectl get pods

kubectl get svc

kubectl get deployements

// test load balance way
kubectl delete svc broker-service

kubectl expose deployment broker-service --type=LoadBalancer --port=8080 --target-port=8080

kubectl get svc

minikube tunnel

// enable k8s loadbalance by ingress

minikube addons enable ingress
kubectl apply -f ingress.yml
kubectl get ingress
minikube tunnel
```

error ：

> minikube ssh docker pull mongo
//or
> minikube image pull mongo


