#!/bin/bash

echo $PROJECT
echo $STORAGECLASSFS

mkdir -p /tmp/$PROJECT/asperaHstsInstance
chmod 777 /tmp/$PROJECT/asperaHstsInstance

cat /root/cp4i/asperaHstsInstance/asperaHstsInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  >/tmp/$PROJECT/asperaHstsInstance/asperaHstsInstance_OK.yaml
 
oc apply -f /tmp/$PROJECT/asperaHstsInstance/asperaHstsInstance_OK.yaml
