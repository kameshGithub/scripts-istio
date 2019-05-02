#!/bin/bash

kubectl create -f ../istio-tutorial/istiofiles/gateway-customer.yml

export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export INGRESS_HOST=$(minikube -p $NAMESPACE  ip)
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT
curl http://${GATEWAY_URL}/
