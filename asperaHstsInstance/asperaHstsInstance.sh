#!/bin/bash

echo $PROJECT
echo $STORAGECLASSFS
echo $ASPERALICENCA
echo $ASPERADIRECTORY

mkdir -p /tmp/$PROJECT/asperaHstsInstance
chmod a+x /tmp/$PROJECT/asperaHstsInstance

cat /root/cp4i/asperaHstsInstance/asperaHstsInstancePvc.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  >/tmp/$PROJECT/asperaHstsInstance/asperaHstsInstancePvc_OK.yaml
oc apply -f /tmp/$PROJECT/asperaHstsInstance/asperaHstsInstancePvc_OK.yaml 

oc create secret generic asperanoded-creds --from-literal=NODE_USER=nodeuser --from-literal=NODE_PASS=`uuidgen` -n $PROJECT

chmod a+x /root/cp4i/asperaHstsInstance/asperaHstsInstance.yaml

cat /root/cp4i/asperaHstsInstance/asperaHstsInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_ASPERA_LICENCE_CP4X_HERE###}/$ASPERALICENCA/g"  | sed "s/{###PROVIDE_YOUR_ASPERA_DIRECTORY_HERE###}/$ASPERADIRECTORY/g"  >/tmp/$PROJECT/asperaHstsInstance/asperaHstsInstance_OK.yaml

oc apply -f >/tmp/$PROJECT/asperaHstsInstance/asperaHstsInstance_OK.yaml
