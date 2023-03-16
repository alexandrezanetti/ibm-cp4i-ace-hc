# Criando uma instância do CP4I Aspera High-Speed Transfer Server no cluster Openshift / Creating an instance of CP4I Aspera High-Speed Transfer Server on Openshift cluster

We have used this link to help us: 
- Products: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=operators-installing-using-openshift-console<br>
            https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=integration-aspera-high-speed-transfer-server-transformation-guide
 
#### 1. Entrar no Bastion do cluster OCP através de terminal (SSH) / Open Bastion of OCP cluster using terminal SSH
> Lembre-se que precisará das informações abaixo/ Note that you will use the informations below:<br>
> - Bastion IP Publico / Bastion public IP<br>
> - Sua senha Root / Root Password<br>
> - Project/Namespace / Project/Namespace<br>
> - Versão/Channel do operador IBM Aspera Operator/Namespace / Version/Channel of IBM Aspera Operator<br>
> - Licença do Aspera / Aspera license


#### 2. Baixar o script / Clone git with scripts
```
dnf install -y git
```

#### 3. Baixar o script / Clone git with scripts
```
git clone https://github.com/alexandrezanetti/cp4i.git
```

#### 4. E finalmente, execute o script / And finally, run the script
Preencha os conteudos abaixo {###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###} e {###PROVIDE_YOUR_ASPERA_LICENCE_CP4X_HERE###} no comando abaixo:
```
echo "##### IBM CP4I Aspera High-Speed Transfer Server ####"; export PROJECT=cp4i ; export STORAGECLASSFS=rook-cephfs ; export ASPERALICENCE={###PROVIDE_YOUR_ASPERA_LICENCE_CP4X_HERE###} ; chmod a+x /root/cp4i/asperaHstsInstance/asperaHstsInstance.sh ; /root/cp4i/asperaHstsInstance/asperaHstsInstance.sh
```
