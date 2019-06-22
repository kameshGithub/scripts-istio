#!/bin/bash

echo 'correct usage is source 00_setenv.sh'
echo 'K8S Environment based on: '$k8s 
#export MINIKUBE_HOME=/usr/local/bin;
#export PATH=$MINIKUBE_HOME:$PATH
#export KUBECONFIG=/Users/kameshc/.kube/config:$MINIKUBE_HOME/.kube/config
export KUBE_EDITOR="code -w"

export ISTIO_VERSION="1.1.8"
export ISTIO_HOME=/Users/kameshc/KAMESH/WORK/CODE/istio/istio-$ISTIO_VERSION
export PATH=$ISTIO_HOME/bin:$PATH

export profile="istiok"
export NAMESPACE="demo"
export k8s=minikube  #valid values docker, minikube

if [ $k8s = minikube ]
   then
        echo 'Set docker environment by running: eval $(minikube --profile' $profile 'docker-env)'
        echo 'Using K8S Host as:' $(minikube -p $profile ip)
        eval $(minikube --profile $profile docker-env)
        export K8S_HOST=$(minikube -p $profile ip)
    else
        echo 'Using K8S Host as: localhost'

        export K8S_HOST='localhost'      
fi
