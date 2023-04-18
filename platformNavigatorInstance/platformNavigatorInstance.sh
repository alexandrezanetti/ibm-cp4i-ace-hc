#!/bin/bash

echo $PROJECT
echo $STORAGECLASSFS

mkdir -p /tmp/$PROJECT/platformNavigatorInstance
chmod 777 /tmp/$PROJECT/platformNavigatorInstance

cat ~/cp4i/platformNavigatorInstance/platformNavigatorInstance.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSFS_HERE###}/$STORAGECLASSFS/g"  >/tmp/$PROJECT/platformNavigatorInstance/platformNavigatorInstance_OK.yaml
 
oc apply -f /tmp/$PROJECT/platformNavigatorInstance/platformNavigatorInstance_OK.yaml

echo "Waiting 30 seconds"
for i in {1..30}; do  echo "Loop time "$i;   sleep 1s; done

echo "Waiting restart of all Nodes (Masters and Workers)"
export i=1
while true
do
        clear
        echo "Aguarde enquanto os recursos são criados... em geral 30/40min! - Loop $i"
	echo "Pod: ${PROJECT}-platform-navigator-ui"
	oc get event -n ${PROJECT} | grep "${PROJECT}-platform-navigator-ui"
	oc get pod -n ${PROJECT} | grep "${PROJECT}-platform-navigator-ui" | grep Running
        if [[ $? -eq 0 ]]
        then
                break
        fi
        sleep 10s
        ((i=i+1))
done

oc get secret platform-auth-idp-credentials -n ibm-common-services -o go-template --template="{{.data.admin_password|base64decode}}" > /tmp/$PROJECT/platformNavigatorInstance/bm-common-services-platform-auth-idp-credentials_OK.yaml

oc get routes --all-namespaces | grep -i platform-navigator-ui > /tmp/url-console-cp4i.txt
export CP4IURLCON=https://$(awk '/ cp4i-platform-navigator-ui-pn-/ {print $3}' /tmp/url-console-cp4i.txt)
export CP4IPNPASSWORD=$(oc get secret platform-auth-idp-credentials -n ibm-common-services -o go-template --template="{{.data.admin_password|base64decode}}")
export CP4IPNUSER=$(oc get secret platform-auth-idp-credentials -n ibm-common-services -o go-template --template="{{.data.admin_username|base64decode}}")
clear
echo "##############################################"
echo "##############################################"
echo "Url do CP4I Platform Navigator: $CP4IURLCON"
echo "Usuário Admin do CP4I: $CP4IPNUSER"
echo "Senha do usuário Admin: $CP4IPNPASSWORD"
echo "Ou você pode utilizar o Kubeadmin ou seu W3IntranetId"
echo "##############################################"
echo "##########################################"
