#!/bin/bash

export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export INGRESS_HOST=$(minikube -p $profile  ip)
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT


while true
do 
# use below url if there is no customer gateway installed 
 curl $(minikube -p $profile ip):$(kubectl get svc customer -n tutorial -o 'jsonpath={.spec.ports[0].nodePort}')

# use below url if there is a customer gateway installed . Must for mtls
# curl -H "Authorization: Bearer $token" http://${GATEWAY_URL}/

sleep .5
done
