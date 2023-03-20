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

while true
do
	oc get pod | grep "${PROJECT}-mq-qmgr-start-ibm-mq-0" | grep Running
	if [[ $? -eq 0 ]]
	then
		break
	fi
done
oc get pod --all-namespaces | grep "${PROJECT}-mq-qmgr-start-ibm-mq-0" > /tmp/url-console-mq.txt
export MQURLCON=https://$(awk '/-mq-qmgr-"/ {print $3}' /tmp/url-console-mq.txt)
export MQUSER=$(oc get secret "${PROJECT}-mq-secret" -n "${PROJECT}" -o go-template --template="{{.data.user|base64decode}}")
export MQPASSWORD=$(oc get secret "${PROJECT}-mq-secret" -n "${PROJECT}" -o go-template --template="{{.data.password|base64decode}}")
clear
echo "##############################################"
echo "##############################################"
echo "Url do CP4I MQ: $MQURLCON"
echo "Usuário Admin do MQ: $MQUSER"
echo "Senha do usuário Admin: $MQPASSWORD"
echo "Ou você pode utilizar o Kubeadmin ou seu W3IntranetId"
echo "##############################################"
echo "##########################################"
