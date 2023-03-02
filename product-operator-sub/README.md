# Instalando os Operadores no cluster Openshift / Installing Operators on Openshift cluster
- Aspera HSTS
- IBM Api Connect (APIC)
- IBM App Connect (ACE)
- IBM Event Stream 
- IBM MQ

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
git --version
git clone https://github.com/alexandrezanetti/cp4i.git
```

#### 3. Muito importante: Setar estas variáveis / Must important! Define project name and set your IBM Entitlement Key
```
export PROJECT=cp4i
export CHANNEL=v2.2
export OPERATOR=ibm-mq
echo $PROJECT
echo $CHANNEL
echo $OPERATOR
```

#### 4. E finalmente, execute o script / And finally, run the script
```
chmod a+x /root/cp4i/product-operator-sub/zzzOperator.sh
/root/cp4i/product-operator-sub/./zzzOperator.sh
```

#### Informação complementar / Addicional information
- Como descobrir os operadores / How to discover the operators:
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-integration-platform-navigator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-common-service-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-mq"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "aspera-hsts-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-apiconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-appconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-events-operator"
