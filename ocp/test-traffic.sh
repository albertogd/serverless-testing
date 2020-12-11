#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Need the number of PODs to create"
    exit 1
else
    REQS=$1
fi

REQ_PER_POD=5
TOTAL_REQ=$((REQ_PER_POD*REQS))

while true; do
  for i in $(seq 1 $TOTAL_REQ); do
    #echo "Request #$i:"
    curl http://hello-knative-hello-world.apps.alber1.lab.pnq2.cee.redhat.com > /dev/null 2>&1 &
  done

  echo "Current pod nº: $(oc get pods -o name | wc -l)" 
  sleep 1s
done

