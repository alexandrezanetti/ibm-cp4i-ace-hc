#!/bin/bash
export ACEUSERNAME=admin
export ACEPASSWORD=admin
export ACEHASH=$(echo '{"authType":"BASIC_AUTH","credentials":{"username":"${ACEUSERNAME}","password":"${ACEPASSWORD}"}}' | base64)

echo "ACEUSERNAME: ${ACEUSERNAME}"
echo "ACEPASSWORD: ${ACEPASSWORD}"
echo "ACEHASH: ${ACEHASH}"

mkdir -p /tmp/$PROJECT/aceinstance
chmod a+x /tmp/$PROJECT/aceinstance

cat /root/cp4i/aceinstance/aceinstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSBLOCK_HERE###}/$STORAGECLASSBLOCK/g"  | sed "s/{###PROVIDE_YOUR_HASH_HERE###}/${ACEHASH}/g" > /tmp/$PROJECT/aceinstance/aceinstance_OK.yaml
oc apply -f /tmp/$PROJECT/aceinstance/aceinstance_OK.yaml

