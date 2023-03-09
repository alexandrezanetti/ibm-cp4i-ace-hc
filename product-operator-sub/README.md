# Instalando os Operadores no cluster Openshift / Installing Operators on Openshift cluster

We have used this link to help us: 
- Products: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=operators-installing-using-openshift-console

#### 1. Entrar no Bastion do cluster OCP através de terminal (SSH) / Open Bastion of OCP cluster using terminal SSH
> Lembre-se que precisará das informações abaixo/ Note that you will use the informations below:<br>
> - Bastion IP Publico / Bastion public IP<br>
> - Sua senha Root / Root Password<br>
> - Project/Namespace / Project/Namespace<br>
> - Versão/Channel do operador IBM MQ Operator/Namespace / Version/Channel of IBM MQ Operator

#### 2. Baixar o script / Clone git with scripts
```
dnf install -y git
```
```
git clone https://github.com/alexandrezanetti/cp4i.git
```

#### 3. Execute as linhas abaixo para instalar toda a lista de produtos do CP4I  / Run lines below to install all CP4I products
Obtenha o channel version [aqui](https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=reference-operator-channel-versions-this-release)
- IBM CP4i Platform Navigator (com IBM Foundational Services)
- Aspera HSTS
- IBM Api Connect (APIC)
- IBM App Connect (ACE)
- IBM Event Stream 
- IBM MQ

```
echo "##### IBM CP4I Platform Navigator ####"; export PROJECT=cp4i ; export CHANNEL=v7.0 ; export OPERATOR=ibm-integration-platform-navigator ; export PROJECTSUB=openshift-operators ; chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "###### Aspera ####" ; export PROJECT=cp4i ; export CHANNEL=v1.5 ; export OPERATOR=aspera-hsts-operator ; export PROJECTSUB=openshift-operators ; chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM API Connect ####" ; export PROJECT=cp4i ; export CHANNEL=v3.2 ; export OPERATOR=ibm-apiconnect ; export PROJECTSUB=openshift-operators ; chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM App Connect ####" ; export PROJECT=cp4i ; export CHANNEL=v7.0 ; export OPERATOR=ibm-appconnect ; export PROJECTSUB=openshift-operators ; chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM Event Stream ####" ; export PROJECT=cp4i ; export CHANNEL=v3.1 ; export OPERATOR=ibm-eventstreams ; export PROJECTSUB=openshift-operators ; chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM MQ ####" ; export PROJECT=cp4i ; export CHANNEL=v2.2 ; export OPERATOR=ibm-mq ; export PROJECTSUB=openshift-operators ; chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM CP4D (Data) ####"; ; export PROJECT=cp4d ; export CHANNEL=v3.6 ; export OPERATOR=cpd-platform-operator ;  export PROJECTSUB=openshift-operators ;  chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM CP4S (Security) ####"; export PROJECT=cp4s ; export CHANNEL=v1.10 ; export OPERATOR=ibm-cp-security-operator ;  export PROJECTSUB=$PROJECT ;  chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM CP4MCM (Multi Cloud for Management) ####"; export PROJECT=cp4mcm ; export CHANNEL=v2.3-stable ; export OPERATOR=ibm-management-orchestrator ;  export PROJECTSUB=$PROJECT ;  chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
echo "##### IBM CP4BA ####"; export PROJECT=cp4ba ; export CHANNEL=v22.2 ; export OPERATOR=ibm-cp4a-operator ; export PROJECTSUB=openshift-operators ; chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh ; /root/cp4i/product-operator-sub/./zzzOperator.sh
```

#### Informação complementar / Addicional information
- Como descobrir os operadores / How to discover the operators:
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-integration-platform-navigator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-common-service-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-mq"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "aspera-hsts-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-apiconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-appconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-events-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-cp4a-operator"
