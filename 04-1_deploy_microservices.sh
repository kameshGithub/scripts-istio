#!/bin/bash


# Customer
cd ../istio-tutorial/customer/java/springboot

istioctl kube-inject -f ../../kubernetes/Deployment.yml | kubectl apply -f - -n $NAMESPACE
kubectl create -f ../../kubernetes/Service.yml -n $NAMESPACE

# for minikube, open a NodePort
 kubectl patch service/customer -p '{"spec":{"type":"NodePort"}}' -n $NAMESPACE



# Preference 
cd ../../../preference/java/springboot

istioctl kube-inject -f ../../kubernetes/Deployment.yml | kubectl apply -f - -n $NAMESPACE
kubectl create -f ../../kubernetes/Service.yml -n $NAMESPACE



# Recommendation
cp ./recommendation_v1/RecommendationController.java ../istio-tutorial/recommendation/java/springboot/src/main/java/com/redhat/developer/demos/recommendation

cd ../../../recommendation/java/springboot

istioctl kube-inject -f ../../kubernetes/Deployment.yml | kubectl apply -f - -n $NAMESPACE
kubectl create -f ../../kubernetes/Service.yml -n $NAMESPACE

cd ../../../../scripts-istio

