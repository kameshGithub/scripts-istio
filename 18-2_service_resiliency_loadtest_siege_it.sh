#!/bin/bash

siege -r 2 -c 20 -v $(minikube -p $profile ip):$(kubectl get svc customer -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')
