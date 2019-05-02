#!/bin/bash

kubectl delete -f ../istio-tutorial/istiofiles/authentication-enable-tls.yml 
kubectl delete -f ../istio-tutorial/istiofiles/destination-rule-tls.yml 
