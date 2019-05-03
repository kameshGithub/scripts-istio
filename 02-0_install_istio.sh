#!/bin/bash
cd ..

curl -L https://git.io/getLatestIstio | ISTIO_VERSION=$ISTIO_VERSION sh -

cd $ISTIO_HOME

kubectl create namespace istio-system

helm template install/kubernetes/helm/istio-init --name istio-init --namespace istio-system | kubectl apply -f -

kubectl get crds | grep 'istio.io\|certmanager.k8s.io' | wc -l

helm template install/kubernetes/helm/istio --name istio --namespace istio-system \
    --values install/kubernetes/helm/istio/values-istio-demo.yaml | kubectl apply -f -



