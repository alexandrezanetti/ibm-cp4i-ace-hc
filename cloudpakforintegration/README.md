# Instalando o Operador IBM Cloud Pak for Integration no cluster Openshift / Installing IBM Cloud Pak for Integration Operator on Openshift cluster

We have used this link to help us: 
- IBM Cloud Pak for Integration : https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=operators-installing-using-cli

#### 1. Entrar no Bastion do cluster OCP através de terminal (SSH) / Open Bastion of OCP cluster using terminal SSH
> Lembre-se que precisará das informações abaixo/ Note that you will use the informations below:<br>
> - Bastion IP Publico / Bastion public IP<br>
> - Sua senha Root / Root Password<br>
> - Project/Namespace / Project/Namespace<br>
> - Versão/Channel do operador IBM MQ Operator/Namespace / Version/Channel of IBM MQ Operator

#### 2. Instalar o GIT no bastion / Instal GIT on Bastion:
> sudo dnf install -y git<br>
> git --version

#### 3. Baixar o script / Clone git with scripts
> git clone https://github.com/alexandrezanetti/cp4i.git

#### 4. Se tiver interesse, visualizar o conteúdo do Script / Look the content
> cat /root/cp4i/ibm-mq-operator.yaml<br>
> cat /root/cp4i/ibm-mq-sub.yaml

#### 5. Criar o novo arquivo/script que será ajustado / create a new script to be changed
> touch /root/cp4i/ibm-mq-operator_OK.yaml<br>
> touch /root/cp4i/ibm-mq-sub_OK.yaml<br>
> chmod 777 /root/cp4i/ibm-mq-operator_OK.yaml<br>
> chmod 777 /root/cp4i/ibm-mq-sub_OK.yaml

#### 6. Muito importante: Setar estas variáveis / Must important! Define project name and set your IBM Entitlement Key
> PROJECT=cp4i<br>
> MQCHANNEL=v2.2<br>
> #channel versions: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=reference-operator-channel-versions-this-release<br>
> echo $PROJECT<br>
> echo $MQCHANNEL

#### 7. Ajustar o arquivo com Projeto/EntitlementKey / Run the command below to adjust Project and EntitlementKey
> cat /root/cp4i/ibm-mq-operator.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/$PROJECT/g" >/root/cp4i/ibm-mq-operator_OK.yaml<br>
> cat /root/cp4i/ibm-mq-sub.yaml | sed "s/{###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}/$PROJECT/g" | sed "s/{###PROVIDE_CHANNEL_OPERATOR_HERE###}/$MQCHANNEL/g" >/root/cp4i/ibm-mq-sub_OK.yaml

#### 8. Execute o script / And finally, run the script
> oc apply -f /root/cp4i/ibm-mq-operator_OK.yaml<br>
> oc apply -f /root/cp4i/ibm-mq-sub_OK.yaml

#### Informação complementar / Addicional information
- Como descobrir os operadores / How to discover the operators:
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-integration-platform-navigator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-common-service-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-mq"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "aspera-hsts-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-apiconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-appconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-appconnect"<br>
