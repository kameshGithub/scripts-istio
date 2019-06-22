#!/bin/bash

export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
export INGRESS_HOST=$(minikube -p $profile  ip)
export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT

token=$(curl http://$(minikube -p $profile ip):$(kubectl get svc keycloak -o 'jsonpath={.spec.ports[0].nodePort}')/auth/realms/istio/protocol/openid-connect/token -d 'username=demo&password=demo&grant_type=password&client_id=customer-tutorial'| python -c "import json,sys;obj=json.load(sys.stdin);print obj['access_token'];")
# echo "got token $token"

while true
do 
# use below url if there is no customer gateway installed 
curl $K8S_HOST:$(kubectl get svc customer -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')
# curl  http://$GATEWAY_URL

sleep .5

# use below url if there is a customer gateway installed . Use of gateway Must for mtls and authz 
# curl -H "Authorization: Bearer $token" http://$GATEWAY_URL

sleep .5
done
