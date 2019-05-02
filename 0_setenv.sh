#!/bin/bash

echo 'correct usage is source 0_setenv.sh'

#export MINIKUBE_HOME=/usr/local/bin;
#export PATH=$MINIKUBE_HOME:$PATH
#export KUBECONFIG=/Users/kameshc/.kube/config:$MINIKUBE_HOME/.kube/config
export KUBE_EDITOR="code -w"

export ISTIO_VERSION="1.1.3"
export ISTIO_HOME=/Users/kameshc/KAMESH/WORK/CODE/istio/istio-$ISTIO_VERSION
export PATH=$ISTIO_HOME/bin:$PATH
export NAMESPACE="istio"

eval $(minikube --profile $NAMESPACE docker-env)

echo 'the following after minikube as started'
echo 'eval $(minikube --profile istio docker-env)'
