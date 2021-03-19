#!/bin/bash
# A script to create PreRequisite part 1 by Jayden Aung

# Your CloudGuard ID
CHKP_CLOUDGUARD_API="your-cloudguard-api"
CHKP_CLOUDGUARD_SECRET="your-cloudguard-secret"

# Your namespace 
namespace="myns"

#Cluster
clusterid="mycluster"

# Create your name space
oc create namespace $myns

# Generate secret
oc create secret generic dome9-creds \
--from-literal=username=$CHKP_CLOUDGUARD_API \
--from-literal=secret=$CHKP_CLOUDGUARD_SECRET \
--namespace $myns

# Create Configmap

oc create configmap cp-resource-management-configmap \
--from-literal=cluster.id=,$clusterid --namespace $myns

# Create Services account
oc create serviceaccount cp-resource-management --namespace $myns

echo Service Account "${myns}" has been created. 

