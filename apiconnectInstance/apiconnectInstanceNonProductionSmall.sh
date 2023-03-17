#!/bin/bash

echo $PROJECT
echo $STORAGECLASSBLOCK
echo $APICLICENCE

mkdir -p /tmp/$PROJECT/apiconnectInstance
chmod a+x /tmp/$PROJECT/apiconnectInstance

cat /root/cp4i/apiconnectInstance/apiconnectInstanceNonProductionSmall.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_YOUR_STORAGECLASSBLOCK_HERE###}/$STORAGECLASSBLOCK/g"  | sed "s/{###PROVIDE_YOUR_APIC_LICENCE_HERE###}/$APICLICENCE/g" >/tmp/$PROJECT/apiconnectInstance/apiconnectInstanceNonProductionSmall_OK.yaml
oc apply -f /tmp/$PROJECT/apiconnectInstance/apiconnectInstanceNonProductionSmall_OK.yaml

oc get routes --all-namespaces | grep -v "gateway-manager" | grep -i "cpi4-apic-gw-gateway-" > /tmp/url-console-cp4i.txt
export APICGWURLCON=https://$(awk '/ -apic-gw-gateway-/ {print $3}' /tmp/url-console-cp4i.txt)
echo "##############################################"
echo "##############################################"
echo "Url do CP4I APIC Gateway: $APICGWURLCON"
echo "##############################################"
echo "##########################################
