#!/bin/bash

kubectl patch service/istio-ingressgateway -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/grafana -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/prometheus -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/jaeger-query -p '{"spec":{"type":"NodePort"}}' -n istio-system

#kubectl patch service/kiali -p '{"spec":{"type":"NodePort"}}' -n istio-system
#kubectl patch service/zipkin -p '{"spec":{"type":"NodePort"}}' -n istio-system


export GRAFANA_URL=http://$(minikube -p $profile ip):$(kubectl get svc grafana -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
export PROMETHEUS_URL=http://$(minikube -p $profile ip):$(kubectl get svc prometheus -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
export JAEGER_URL=http://$(minikube -p $profile ip):$(kubectl get svc jaeger-query -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')

