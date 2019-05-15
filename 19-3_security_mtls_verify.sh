#!/bin/bash

CUSTOMER_POD=$(kubectl get pod | grep cust | awk '{ print $1}' )
kubectl exec -it $CUSTOMER_POD -c istio-proxy /bin/bash
sudo tcpdump -vvvv -A -i eth0 '((dst port 8080) and (net 172.17.0.10))'
