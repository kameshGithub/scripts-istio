#!/bin/bash

kubectl create -f ../istio-tutorial/istiofiles/authentication-enable-tls.yml 
kubectl create -f ../istio-tutorial/istiofiles/destination-rule-tls.yml 


