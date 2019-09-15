#!/bin/bash

export INGRESS_HOST=$K8S_HOST
export SVC_HOST=customer  #account-orchestrator
export GATWAY=N
if [ $GATWAY = N ]
   then
        
        export GATEWAY_URL=$INGRESS_HOST:$(kubectl get svc $SVC_HOST -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')
    else
        export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].port}')        
        export GATEWAY_URL=$INGRESS_HOST:$INGRESS_PORT      
fi

# token=$(curl http://$(minikube -p $profile ip):$(kubectl get svc keycloak -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')/auth/realms/istio/protocol/openid-connect/token -d 'username=demo&password=demo&grant_type=password&client_id=customer-tutorial'| python -c "import json,sys;obj=json.load(sys.stdin);print obj['access_token'];")
# echo "got token $token"
# export HEADER="Authorization: Bearer $token"

# use below url if there is no customer gateway installed 
# curl $K8S_HOST:$(kubectl get svc account-orchestrator -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')

FULL_URL=$GATEWAY_URL
echo $FULL_URL
while true
do 
# curl -H "Authorization: Bearer $token" http://$GATEWAY_URL

curl -A Safari  http://$GATEWAY_URL/
curl -A Firefox http://$GATEWAY_URL/
curl -A Chrome http://$GATEWAY_URL/
curl '-A Mozilla/5.0 (iPhone; U; CPU iPhone OS 4(KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5'  http://$GATEWAY_URL/
echo ""
sleep 3s
done
