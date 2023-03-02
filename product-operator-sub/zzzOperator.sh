#OPERATOR=ibm-mq
#CHANNEL=v3.1
#channel versions: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=reference-operator-channel-versions-this-release
echo $OPERATOR
echo $CHANNEL

mkdir -p /root/cp4i/$OPERATOR
chmod 777 /root/cp4i/$OPERATOR

cat /root/cp4i/$OPERATOR/$OPERATOR-operator.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/$PROJECT/g"  | sed "s/{###PROVIDE_YOUR_OPERATOR_PRODUCT_CP4X_HERE###}/$OPERATOR/g" >/root/cp4i/$OPERATOR/$OPERATOR_OK.yaml<br>
cat /root/cp4i/$OPERATOR/$OPERATOR-sub.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/$PROJECT/g" | sed "s/{###PROVIDE_CHANNEL_OPERATOR_HERE###}/$CHANNEL/g" | sed "s/{###PROVIDE_YOUR_OPERATOR_PRODUCT_CP4X_HERE###}/$OPERATOR/g" >/root/cp4i/$OPERATOR/$OPERATOR-sub_OK.yaml

#### 8. Execute o script / And finally, run the script
> oc apply -f /root/cp4i/$OPERATOR/$OPERATOR-operator_OK.yaml<br>
> oc apply -f /root/cp4i/$OPERATOR/$OPERATOR-sub_OK.yaml

#### Informação complementar / Addicional information
- Como descobrir os operadores / How to discover the operators:
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-integration-platform-navigator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-common-service-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-mq"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "aspera-hsts-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-apiconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-appconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-events-operator"
