#!/bin/bash
command1="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1_and_v2_10_90.yml -n tutorial"
echo $command1
$command1
