#!/bin/bash
# add a circuit breaker that will open whenever we have more than 1 request being handled by any instance/pod.

command1="kubectl replace -f ../istio-tutorial/istiofiles/destination-rule-recommendation_cb_policy_version_v2.yml -n tutorial"
echo $command1
$command1

echo "Now Siege it"
