#!/bin/bash
# Use of gateway is mandatory to use mTLS
kubectl create -f ../istio-tutorial/istiofiles/gateway-customer.yml

# export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
# export INGRESS_HOST=$(minikube -p $profile  ip)
# export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
# curl http://${GATEWAY_URL}/
