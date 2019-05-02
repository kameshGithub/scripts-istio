#!/bin/bash

kubectl patch service/istio-ingressgateway -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/grafana -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/prometheus -p '{"spec":{"type":"NodePort"}}' -n istio-system
kubectl patch service/jaeger-query -p '{"spec":{"type":"NodePort"}}' -n istio-system

#kubectl patch service/kiali -p '{"spec":{"type":"NodePort"}}' -n istio-system
#kubectl patch service/zipkin -p '{"spec":{"type":"NodePort"}}' -n istio-system


