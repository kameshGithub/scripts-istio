#!/bin/bash

kubectl delele -f ./Deployment-new-recommendation-v2.yml

cd ../istio-tutorial/recommendation/java/springboot
# mvn clean package

docker build -t example/recommendation:v2 .

istioctl kube-inject -f ../../kubernetes/Deployment-v2.yml | kubectl apply -f - -n tutorial

#kubectl apply -f <(istioctl kube-inject -f ../../kubernetes/Deployment-v2.yml) -n tutorial

cd ../../../../scripts-istio
