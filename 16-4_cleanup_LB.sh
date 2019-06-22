#!/bin/bash

kubectl delete -f istiofiles/destination-rule-recommendation_lb_policy_app.yml -n $NAMESPACE

kubectl delete virtualservice/recommendation -n $NAMESPACE
kubectl delete destinationrule/recommendation -n $NAMESPACE

kubectl scale deployment recommendation-v2 --replicas=1 -n $NAMESPACE
