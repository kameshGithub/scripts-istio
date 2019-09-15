#!/bin/bash

#  setup for istio canary

command1="kubectl apply -f ../istio-tutorial/istiofiles/destination-rule-recommendation-v1-v2.yml -n $NAMESPACE"
echo $command1
$command1

command2="kubectl apply -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1.yml -n $NAMESPACE" 
echo $command2
$command2
