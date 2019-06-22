#!/bin/bash

kubectl delete -f ../istio-tutorial/istiofiles/destination-rule-tls.yml 
kubectl delete -f ../istio-tutorial/istiofiles/enduser-authentication-jwt-mtls.yml
