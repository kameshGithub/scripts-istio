#!/bin/bash
command1="kubectl create -f ../istio-tutorial/istiofiles/destination-rule-recommendation-v1-v2.yml -n $NAMESPACE"
echo $command1
$command1

command2="kubectl create -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1_and_v2_50_50.yml -n $NAMESPACE" 
echo $command2
$command2

echo "Add timeout to Recommendation"
echo "Siege it"
