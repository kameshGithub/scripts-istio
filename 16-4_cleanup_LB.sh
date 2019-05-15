#!/bin/bash

kubectl delete -f istiofiles/destination-rule-recommendation_lb_policy_app.yml -n tutorial

kubectl delete virtualservice/recommendation -n tutorial
kubectl delete destinationrule/recommendation -n tutorial

kubectl scale deployment recommendation-v2 --replicas=1 -n tutorial
