#!/bin/bash

kubectl delete -f ../istio-tutorial/istiofiles/enduser-authentication-jwt.yml
keycloak_host_port=$(minikube -p $profile ip):$(kubectl get svc keycloak -o 'jsonpath={.spec.ports[0].nodePort}')

echo "TODO: Update the keycloack URL $keycloak_host_port in enduser-authentication-jwt.yml"
