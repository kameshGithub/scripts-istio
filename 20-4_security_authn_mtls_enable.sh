#!/bin/bash

kubectl create -f ../istio-tutorial/istiofiles/destination-rule-tls.yml 
kubectl create -f ../istio-tutorial/istiofiles/enduser-authentication-jwt-mtls.yml
