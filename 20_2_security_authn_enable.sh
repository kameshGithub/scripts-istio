#!/bin/bash

# kubectl create -f ../istio-tutorial/istiofiles/enduser-authentication-jwt.yml

token=$(curl http://$(minikube -p $NAMESPACE ip):$(kubectl get svc keycloak -o 'jsonpath={.spec.ports[0].nodePort}')/auth/realms/istio/protocol/openid-connect/token -d 'username=demo&password=demo&grant_type=password&client_id=customer-tutorial'| python -c "import json,sys;obj=json.load(sys.stdin);print obj['access_token'];")

echo "got token $token"
curl -H "Authorization: Bearer $token" http://${GATEWAY_URL}/

