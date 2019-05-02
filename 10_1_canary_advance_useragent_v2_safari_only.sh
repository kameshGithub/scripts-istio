#!/bin/bash

command1="kubectl replace -f ../istio-tutorial/istiofiles/virtual-service-recommendation-safari-v2.yml -n tutorial"
echo $command1
$command1
