#!/bin/bash

kubectl patch service/recommendation -p '{"spec":{"selector":{"app":"recommendation","version":"v2"}}}' -n tutorial
