#!/bin/bash

echo
command1="curl -A Safari $(minikube -p $profile ip):$(kubectl get svc customer -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')"
echo $command1
$command1
echo
command2="curl -A Firefox $(minikube -p $profile ip):$(kubectl get svc customer -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')"
echo $command2
$command2
echo

command3="curl -A Chrome $(minikube -p $profile ip):$(kubectl get svc customer -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')"
echo $command3
$command3
echo


command4="curl -A Mozilla/5.0 (iPhone; U; CPU iPhone OS 4(KHTML, like Gecko) Version/5.0.2 Mobile/8J2 Safari/6533.18.5 $(minikube -p $profile ip):$(kubectl get svc customer -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')"
echo $command4
curl -A "Mozilla/5.0 (iPhone; U; CPU iPhone OS 4(KHTML, like Gecko) Version/5.0.2 Mobile/8J2" $(minikube -p $profile ip):$(kubectl get svc customer -n $NAMESPACE -o 'jsonpath={.spec.ports[0].nodePort}')
echo

