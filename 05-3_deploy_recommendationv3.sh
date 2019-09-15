#!/bin/bash

# kubectl delele -f ./Deployment-new-recommendation-v2.yml
cp ./recommendation_v3/RecommendationController.java ../istio-tutorial/recommendation/java/springboot/src/main/java/com/redhat/developer/demos/recommendation
cd ../istio-tutorial/recommendation/java/springboot
mvn clean package
docker build -t example/recommendation:v3 .

istioctl kube-inject -f ../../kubernetes/Deployment-v3.yml | kubectl apply -f - -n $NAMESPACE

#kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment-v2.yml) -n $NAMESPACE

cd ../../../../scripts-istio
