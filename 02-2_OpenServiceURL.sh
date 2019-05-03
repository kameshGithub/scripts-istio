#!/bin/bash

export GRAFANA_URL=http://$(minikube -p $profile ip):$(kubectl get svc grafana -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
export PROMETHEUS_URL=http://$(minikube -p $profile ip):$(kubectl get svc prometheus -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
export JAEGER_URL=http://$(minikube -p $profile ip):$(kubectl get svc jaeger-query -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')

open $GRAFANA_URL
open $PROMETHEUS_URL
open $JAEGER_URL

#open http://$(minikube -p $profile ip):$(kubectl get svc zipkin -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
#open http://$(minikube -p $profile ip):$(kubectl get svc kiali -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')


