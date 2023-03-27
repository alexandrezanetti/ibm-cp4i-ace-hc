#!/bin/bash
export ACEUSERNAME=admin
export ACEPASSWORD=admin
export ACEHASH=$(echo '{"authType":"BASIC_AUTH","credentials":{"username":"${ACEUSERNAME}","password":"${ACEPASSWORD}"}}' | base64)

echo "ACEUSERNAME: ${ACEUSERNAME}"
echo "ACEPASSWORD: ${ACEPASSWORD}"
echo "ACEHASH: ${ACEHASH}"

mkdir -p /tmp/$PROJECT/aceInstance
chmod a+x /tmp/$PROJECT/aceInstance

cat /root/cp4i/aceInstance/aceInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_ACE_LICENCE_CP4X_HERE###}/$ACELICENCE/g"  | sed "s/{###PROVIDE_YOUR_HASH_HERE###}/${ACEHASH}/g" > /tmp/$PROJECT/aceInstance/aceInstance_OK.yaml
oc apply -f /tmp/$PROJECT/aceInstance/aceInstance_OK.yaml

cat /root/cp4i/aceInstance/aceInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_ACE_LICENCE_CP4X_HERE###}/$ACELICENCE/g"  | sed "s/{###PROVIDE_YOUR_HASH_HERE###}/${ACEHASH}/g" > /tmp/$PROJECT/aceInstance/aceInstance_OK.yaml
oc apply -f /tmp/$PROJECT/aceInstance/aceInstance_OK.yaml

cat /root/cp4i/aceInstance/aceInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_ACE_LICENCE_CP4X_HERE###}/$ACELICENCE/g"  | sed "s/{###PROVIDE_YOUR_HASH_HERE###}/${ACEHASH}/g" > /tmp/$PROJECT/aceInstance/aceInstance_OK.yaml
oc apply -f /tmp/$PROJECT/aceInstance/aceInstance_OK.yaml

