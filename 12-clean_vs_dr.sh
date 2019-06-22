#!/bin/bash

kubectl delete virtualservice/recommendation -n $NAMESPACE
kubectl delete destinationrule/recommendation -n $NAMESPACE
