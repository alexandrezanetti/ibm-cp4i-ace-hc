#!/bin/bash

echo "Check your IBM Aspera License - https://www.ibm.com/cloud/aspera/license-key" 
echo "ASPERALICENSE: ${ASPERALICENSE}"
if [ ${ASPERALICENSE} = "{###PROVIDE_YOUR_ASPERA_LICENSE_CP4X_HERE###}" ]; then echo "Please provide your IBM Aspera License - Check https://www.ibm.com/cloud/aspera/license-key"; exit 999; fi

echo $PROJECT
echo $STORAGECLASSFS
echo $ASPERALICENSE

mkdir -p /tmp/$PROJECT/asperaHstsInstance
chmod a+x /tmp/$PROJECT/asperaHstsInstance

cat ~/cp4i/asperaHstsInstance/asperaHstsInstancePvc.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  >/tmp/$PROJECT/asperaHstsInstance/asperaHstsInstancePvc_OK.yaml
oc apply -f /tmp/$PROJECT/asperaHstsInstance/asperaHstsInstancePvc_OK.yaml 

oc create secret generic asperanoded-creds --from-literal=NODE_USER=nodeuser --from-literal=NODE_PASS='uuidgen' -n $PROJECT

cat ~/cp4i/asperaHstsInstance/asperaHstsInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_ASPERA_LICENSE_HERE###}/$ASPERALICENSE/g" >/tmp/$PROJECT/asperaHstsInstance/asperaHstsInstance_OK.yaml
oc apply -f /tmp/$PROJECT/asperaHstsInstance/asperaHstsInstance_OK.yaml
