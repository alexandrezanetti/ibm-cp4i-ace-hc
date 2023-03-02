#!/bin/bash

#channel versions: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=reference-operator-channel-versions-this-release
echo $PROJECT
echo $CHANNEL
echo $OPERATOR
echo $PROJECT
echo $$PROJECTSUB

mkdir -p /tmp/$PROJECT/$OPERATOR
chmod 777 /tmp/$PROJECT/$OPERATOR

cat /root/cp4i/product-operator-sub/product-operator.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/$PROJECT/g"  | sed "s/{###PROVIDE_YOUR_OPERATOR_PRODUCT_CP4X_HERE###}/$OPERATOR/g" | sed "s/{###PROVIDE_YOUR_SUBSCRIPTION_PROJECT_NAMESPACE_CP4X_HERE###}/$PROJECTSUB/g" >/tmp/$PROJECT/$OPERATOR-operator_OK.yaml
cat /root/cp4i/product-operator-sub/product-sub.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${PROJECT}/g" | sed "s/{###PROVIDE_CHANNEL_OPERATOR_HERE###}/$CHANNEL/g" | sed "s/{###PROVIDE_YOUR_OPERATOR_PRODUCT_CP4X_HERE###}/$OPERATOR/g" | sed "s/{###PROVIDE_YOUR_SUBSCRIPTION_PROJECT_NAMESPACE_CP4X_HERE###}/$PROJECTSUB/g" >/tmp/$PROJECT/$OPERATOR-sub_OK.yaml

oc apply -f /tmp/$PROJECT/$OPERATOR-operator_OK.yaml
oc apply -f /tmp/$PROJECT/$OPERATOR-sub_OK.yaml
