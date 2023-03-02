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

#### 2. Instalar o GIT no bastion / Instal GIT on Bastion:
> sudo dnf install -y git<br>
> git --version

#### 3. Baixar o script / Clone git with scripts
> git clone https://github.com/alexandrezanetti/cp4i.git

#### 4. Muito importante: Setar estas variáveis / Must important! Define project name and set your IBM Entitlement Key
> PROJECT=cp4i<br>
> CHANNEL=v2.2<br>
> OPERATOR=ibm-mq<br>
> #channel versions: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=reference-operator-channel-versions-this-release<br>
> echo $PROJECT<br>
> echo $CHANNEL<br>
> echo $OPERATOR

#### 5. E finalmente, execute o script / And finally, run the script
> chmod 777 /root/cp4i/product-operator-sub/zzzOperator.sh<br>
> /root/cp4i/product-operator-sub/./zzzOperator.sh

#### Informação complementar / Addicional information
- Como descobrir os operadores / How to discover the operators:
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-integration-platform-navigator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-common-service-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-mq"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "aspera-hsts-operator"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-apiconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-appconnect"<br>
> oc get packagemanifests --all-namespaces | grep "IBM Operator Catalog " | grep "ibm-events-operator"
