#!/bin/bash

echo $PROJECT
echo $STORAGECLASSFS
echo $MQLICENCE

mkdir -p /tmp/$PROJECT/mqInstance
chmod a+x /tmp/$PROJECT/mqInstance

cat /root/cp4i/mqInstance/mqInstanceSecret.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_MQ_LICENCE_HERE###}/$MQLICENCE/g" > /tmp/$PROJECT/mqInstance/mqInstanceSecret_OK.yaml
oc apply -f /tmp/$PROJECT/mqInstance/mqInstanceSecret_OK.yaml

cat /root/cp4i/mqInstance/mqInstanceConfigMapMQSC.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_MQ_LICENCE_HERE###}/$MQLICENCE/g" > /tmp/$PROJECT/mqInstance/mqInstanceConfigMapMQSC_OK.yaml
oc apply -f /tmp/$PROJECT/mqInstance/mqInstanceConfigMapMQSC_OK.yaml

cat /root/cp4i/mqInstance/mqInstanceQMgrStart.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_MQ_LICENCE_HERE###}/$MQLICENCE/g" > /tmp/$PROJECT/mqInstance/mqInstance/mqInstanceQMgrStart_OK.yaml
oc apply -f /tmp/$PROJECT/mqInstance/mqInstance/mqInstanceQMgrStart_OK.yaml

oc get routes --all-namespaces | grep -v "gateway-manager" | grep -i "apic-gw-gateway-" > /tmp/url-console-cp4i.txt
export APICGWURLCON=https://$(awk '/-apic-gw-gateway-/ {print $3}' /tmp/url-console-cp4i.txt)
echo "##############################################"
echo "##############################################"
echo "Url do CP4I APIC Gateway: $APICGWURLCON"
echo "##############################################"
echo "##########################################
