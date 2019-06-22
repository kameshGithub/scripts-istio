#!/bin/bash
# Ensure the correct namespace in the both of the below yaml
kubectl apply -f ../istio-tutorial/keycloak/Deployment.yml 
kubectl create -f ../istio-tutorial/keycloak/Service.yml 

kubectl patch service/keycloak -p '{"spec":{"type":"NodePort"}}'

echo "Open keycloak at: http://$(minikube -p $profile ip):$(kubectl get svc keycloak -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')/auth/admin/master/console/"
# If this step fails, please follow 
echo "Follow steps: https://redhat-developer-demos.github.io/istio-tutorial/istio-tutorial/1.0.x/8jwt.html"

open http://$(minikube -p $profile ip):$(kubectl get svc keycloak -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')/auth/admin/master/console/
