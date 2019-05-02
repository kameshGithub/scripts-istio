#!/bin/bash

kubectl patch svc/recommendation -p '{"spec":{"selector":{"app":"mynodenew"}}}'
