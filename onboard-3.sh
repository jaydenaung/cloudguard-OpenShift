#!/bin/bash
# A script to deploy CloudGuard on OpenShift by Jayden Aung

# Update this with your namespace
myns="mynamespace"

# Create Cluster Role
oc create clusterrole cp-resource-management \
--verb=get,list \
--resource=pods,nodes,services,nodes/proxy,networkpolicies.networking.k8s.io,ingresses.extensions,podsecuritypolicies,roles,rolebindings,clusterroles,clusterrolebindings,serviceaccounts,namespaces

# Clusterrole binding
oc create clusterrolebinding cp-resource-management \
--clusterrole=cp-resource-management \
--serviceaccount=prod:cp-resource-management

# Deploy CloudGuard 
oc create -f cp-cloudguard-openshift.yaml --namespace=$myns
