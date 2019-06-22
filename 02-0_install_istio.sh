#!/bin/bash
cd ..

# curl -L https://git.io/getLatestIstio | ISTIO_VERSION=$ISTIO_VERSION sh -

cd $ISTIO_HOME

kubectl create namespace istio-system

helm template install/kubernetes/helm/istio-init --name istio-init --namespace istio-system | kubectl apply -f -

kubectl get crds | grep 'istio.io\|certmanager.k8s.io' | wc -l

# Will install full custom profile demo+sds+auth and ingress gateway as nodeport  
helm template install/kubernetes/helm/istio --name istio --namespace istio-system \
    --values install/kubernetes/helm/istio/values-istio-demo.yaml | kubectl apply -f -

# If the istio ingress gateway was not installed as nodeport, patch the service as below
# kubectl patch service/istio-ingressgateway -p '{"spec":{"type":"NodePort"}}' -n istio-system

