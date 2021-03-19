#!/bin/bash
# Script to Create User

#Create Admin User
oc create -f uid1000.json --as system:admin

# Policy Add User
oc adm policy add-scc-to-user uid1000 -z cp-resource-management --as system:admin