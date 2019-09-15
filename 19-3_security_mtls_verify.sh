#!/bin/bash

CUSTOMER_POD=$(kubectl get pod | grep cust | awk '{ print $1}' )
kubectl exec -it $CUSTOMER_POD -c istio-proxy /bin/bash
sudo tcpdump -vvvv 1500 -A -i eth0 '((dst port 8080) and (net 172.17.0.10))'

sudo stdbuf -oL -eL /usr/sbin/tcpdump -A -s 10240 "tcp port 8080 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)" | egrep -a --line-buffered ".+(GET |HTTP\/|POST )|^[A-Za-z0-9-]+: " | perl -nle 'BEGIN{$|=1} { s/.*?(GET |HTTP\/[0-9.]* |POST )/\n$1/g; print }'


