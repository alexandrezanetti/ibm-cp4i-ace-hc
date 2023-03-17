# Criando uma instância do CP4I APIC Non-Production Small no cluster Openshift / Creating an instance of CP4I APIC Non-Production Small  on Openshift cluster

We have used this link to help us: 
- Products: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=operators-installing-using-openshift-console<br>
            apic!
 
#### 1. Entrar no Bastion do cluster OCP através de terminal (SSH) / Open Bastion of OCP cluster using terminal SSH
> Lembre-se que precisará das informações abaixo/ Note that you will use the informations below:<br>
> - Bastion IP Publico / Bastion public IP<br>
> - Sua senha Root / Root Password<br>
> - Licença do APIC / APIC  license
> - Storage Class Block / Storage Class Block


#### 2. Baixar o script / Clone git with scripts
```
dnf install -y git
```

#### 3. Baixar o script / Clone git with scripts
```
git clone https://github.com/alexandrezanetti/cp4i.git
```

#### 4. E finalmente, execute o script / And finally, run the script
Preencha os conteudos abaixo {###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}, {###PROVIDE_YOUR_APIC_LICENCE_CP4X_HERE###} e {###PROVIDE_YOUR_STORAGECLASSBLOCK_HERE###} no comando abaixo:
```
echo "##### IBM CP4I APIC Non-Production Small ####"; export PROJECT=cp4i ; export STORAGECLASSBLOCK=rook-ceph-block ; export APICLICENCE=L-GVEN-GFUPVE ; chmod a+x /root/cp4i/apiconnectInstance/apiconnectInstanceNonProdctionSmall.sh ; /root/cp4i/apiconnectInstance/apiconnectInstanceNonProdctionSmall.sh
```
 
