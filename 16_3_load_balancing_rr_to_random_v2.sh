#!/bin/bash

command1="kubectl create -f ../istio-tutorial/istiofiles/destination-rule-recommendation_lb_policy_app.yml -n tutorial"
echo $command1
$command1
