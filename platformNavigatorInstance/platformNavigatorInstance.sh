#!/bin/bash

echo $PROJECT
echo $STORAGECLASSFS

mkdir -p /tmp/$PROJECT/platformNavigatorInstance
chmod 777 /tmp/$PROJECT/platformNavigatorInstance

cat /root/cp4i/platformNavigatorInstance/platformNavigatorInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  >/tmp/$PROJECT/platformNavigatorInstance/platformNavigatorInstance_OK.yaml
 
oc apply -f /tmp/$PROJECT/platformNavigatorInstance/platformNavigatorInstance_OK.yaml
