# Criando uma instância do CP4I Platform Navigator no cluster Openshift / Creating an instance of CP4I Platform Navigator on Openshift cluster

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

```
echo "##### IBM CP4i Platform Navigator ####"; export PROJECT=cp4i ; export STORAGECLASSFS=rook-cephfs ; chmod a+x /root/cp4i/platformNavigatorInstance/platformNavigatorInstance.sh ; /root/cp4i/platformNavigatorInstance//./platformNavigatorInstance.sh
```

