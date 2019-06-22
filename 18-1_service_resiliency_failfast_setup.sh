#!/bin/bash

# Add virtual service and destination rule to divert trafic to both v1 and v2 50%

kubectl create -f ../istio-tutorial/istiofiles/destination-rule-recommendation-v1-v2.yml -n $NAMESPACE
kubectl create -f ../istio-tutorial/istiofiles/virtual-service-recommendation-v1_and_v2_50_50.yml -n $NAMESPACE
