#!/bin/bash

kubectl apply -f ../istio-tutorial/keycloak/Deployment.yml 
kubectl create -f ../istio-tutorial/keycloak/Service.yml 

kubectl patch service/keycloak -p '{"spec":{"type":"NodePort"}}'

echo "open keycloak at: http://$(minikube -p $profile ip):$(kubectl get svc keycloak -n tutorial -o 'jsonpath={.spec.ports[0].nodePort}')"
open http://$(minikube -p $profile ip):$(kubectl get svc keycloak -n tutorial -o 'jsonpath={.spec.ports[0].nodePort}')
