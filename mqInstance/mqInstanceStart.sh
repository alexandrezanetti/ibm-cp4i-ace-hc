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

cat /root/cp4i/mqInstance/mqInstanceQMgrStart.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  | sed "s/{###PROVIDE_YOUR_MQ_LICENCE_HERE###}/$MQLICENCE/g" > /tmp/$PROJECT/mqInstance/mqInstanceQMgrStart_OK.yaml
oc apply -f /tmp/$PROJECT/mqInstance/mqInstanceQMgrStart_OK.yaml

 oc describe pod cp4i-mq-qmgr-start-ibm-mq-0 -n cp4i | grep MQ_ZEN_BASE_URI
oc get routes --all-namespaces | grep -v "cp4i-mq-qmgr" | grep -i "-mq-qmgr-" > /tmp/url-console-mq.txt
export MQURLCON=https://$(awk '/-mq-qmgr-"/ {print $3}' /tmp/url-console-mq.txt)
echo "##############################################"
echo "##############################################"
echo "Url do CP4I MQ: $MQURLCON"
echo "##############################################"
echo "##########################################"
