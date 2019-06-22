#!/bin/bash

command1="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-mobile-v2.yml -n $NAMESPACE"
echo $command1
$command1

