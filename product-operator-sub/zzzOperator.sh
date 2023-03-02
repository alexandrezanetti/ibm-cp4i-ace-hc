#channel versions: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=reference-operator-channel-versions-this-release
echo ${OPERATOR}
echo ${CHANNEL}

mkdir -p /root/cp4i/${OPERATOR}
chmod 777 /root/cp4i/${OPERATOR}

cat /root/cp4i/${OPERATOR}/${OPERATOR}-operator.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${OPERATOR}/g"  | sed "s/{###PROVIDE_YOUR_OPERATOR_PRODUCT_CP4X_HERE###}/${OPERATOR}/g" >/root/cp4i/${OPERATOR}/${OPERATOR}_OK.yaml
cat /root/cp4i/${OPERATOR}/${OPERATOR}-sub.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/${OPERATOR}/g" | sed "s/{###PROVIDE_CHANNEL_OPERATOR_HERE###}/${CHANNEL}/g" | sed "s/{###PROVIDE_YOUR_OPERATOR_PRODUCT_CP4X_HERE###}/${OPERATOR}/g" >/root/cp4i/${OPERATOR}/${OPERATOR}-sub_OK.yaml

oc apply -f /root/cp4i/${OPERATOR}/${OPERATOR}-operator_OK.yaml
oc apply -f /root/cp4i/${OPERATOR}/${OPERATOR}-sub_OK.yaml
