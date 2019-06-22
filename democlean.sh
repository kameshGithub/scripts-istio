#!/bin/bash

kubectl delete deployment/recommendation-v2 -n $NAMESPACE
kubectl delete pod -l app=recommendation,version=v2 -n $NAMESPACE
kubectl delete destinationrule recommendation -n $NAMESPACE
kubectl delete virtualservice recommendation -n $NAMESPACE

docker rmi example/recommendation:v2
cp RecommendationVerticle.java ../istio-tutorial/recommendation/java/vertx/src/main/java/com/redhat/developer/demos/recommendation/

