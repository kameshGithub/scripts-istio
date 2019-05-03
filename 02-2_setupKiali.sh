#!/bin/bash

# TODO: Update configmap with GRAFANA_URL url
# Installs Kiali's configmap
# kubectl apply  -n istio-system -f kiali-configmap.yaml

echo "apiVersion: v1
kind: ConfigMap
metadata:
  name: kiali
  namespace: istio-system
  labels:
    app: kiali
    chart: kiali
    heritage: Tiller
    release: istio
data:
  config.yaml: |
    istio_namespace: istio-system
    server:
      port: 20001
    external_services:
      istio:
        url_service_version: http://istio-pilot:8080/version
      jaeger:
        url: $JAEGER_URL
      grafana:
        url:  $GRAFANA_URL"| kubectl apply -f -; kubectl delete pod -l app=kiali -n istio-system



kubectl patch service/kiali -p '{"spec":{"type":"NodePort"}}' -n istio-system

export KIALI_URL=http://$(minikube -p $profile ip):$(kubectl get svc kiali -n istio-system -o 'jsonpath={.spec.ports[0].nodePort}')/kiali/console

# kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=kiali -o jsonpath='{.items[0].metadata.name}') 20001:20001
