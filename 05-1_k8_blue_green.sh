#!/bin/bash

export V2='kubectl patch service/recommendation -p '{"spec":{"selector":{"app":"recommendation","version":"v2"}}}' -n $NAMESPACE'
export V1='kubectl patch service/recommendation -p '{"spec":{"selector":{"app":"recommendation","version":"v1"}}}' -n $NAMESPACE'
export V1V2='kubectl apply -f ../istio-tutorial/recommendation/kubernetes/Service.yml -n $NAMESPACE'

