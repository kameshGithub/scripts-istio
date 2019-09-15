#!/bin/bash

# kubectl patch service/istio-ingressgateway -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/grafana -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/prometheus -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/jaeger-query -p '{"spec":{"type":"NodePort"}}' -n istio-system

#kubectl patch service/kiali -p '{"spec":{"type":"NodePort"}}' -n istio-system
#kubectl patch service/zipkin -p '{"spec":{"type":"NodePort"}}' -n istio-system


export GRAFANA_URL=http://$K8S_HOST:$(kubectl get svc grafana -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
export PROMETHEUS_URL=http://$K8S_HOST:$(kubectl get svc prometheus -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')
export JAEGER_URL=http://$K8S_HOST:$(kubectl get svc jaeger-query -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')

echo 'Exporting URLs'
echo '$GRAFANA_URL :' $GRAFANA_URL
echo '$PROMETHEUS_URL :' $PROMETHEUS_URL
echo '$JAEGER_URL :' $JAEGER_URL

open $GRAFANA_URL
open $PROMETHEUS_URL
open $JAEGER_URL
