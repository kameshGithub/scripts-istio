#!/bin/bash

# Wait only N seconds before giving up and failing. 
# TODO: Introduce some wait time in recommendation v2 by TODO:commenting the line that calls the timeout() method. 
# Update RecommendationResource.java making it a slow performer with a 3 second delay.
# recommendation/java/quarkus/src/main/java/com/redhat/developer/demos/recommendation/rest/RecommendationResource.java

# eval $(minikube -p istiok docker-env)

# cd ../istio-tutorial/recommendation/java/quarkus

# mvn clean package -DskipTests

# docker build -t example/recommendation:v2 .

# istioctl kube-inject -f ../../kubernetes/Deployment-v2.yml | kubectl apply -f - -n $NAMESPACE

# kubectl delete pod --force --grace-period=0 -l app=recommendation,version=v2 -n $NAMESPACE

# cd ../../../../scripts-istio

kubectl delete -f ../istio-tutorial/istiofiles/virtual-service-recommendation-timeout.yml -n $NAMESPACE

#  Observe  the load-balancing between v1 and v2 but with v2 taking a bit of time to respond
