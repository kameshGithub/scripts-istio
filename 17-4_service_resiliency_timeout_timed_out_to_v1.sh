#!/bin/bash

# You will see it return to v1 after waiting about 1 second. You don’t see v2 anymore, 
# because the response from v2 expires after the timeout period and it is never returned.

kubectl create -f ../istio-tutorial/istiofiles/virtual-service-recommendation-timeout.yml -n $NAMESPACE
