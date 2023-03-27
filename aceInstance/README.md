# Criando uma instância do CP4I ACE no cluster Openshift / Creating an instance of CP4I ACE on Openshift cluster

We have used this link to help us: 
- Products: https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=operators-installing-using-openshift-console<br>
            ACE!
 
#### 1. Entrar no Bastion do cluster OCP através de terminal (SSH) / Open Bastion of OCP cluster using terminal SSH
> Lembre-se que precisará das informações abaixo/ Note that you will use the informations below:<br>
> - Bastion IP Publico / Bastion public IP<br>
> - Sua senha Root / Root Password<br>
> - Licença do ACE / ACE license
> - Storage Class FS / Storage Class FS

#### 2. Baixar o script / Clone git with scripts
```
dnf install -y git
```

#### 3. Baixar o script / Clone git with scripts
```
git clone https://github.com/alexandrezanetti/cp4i.git
```

#### 4. E finalmente, execute o script / And finally, run the script
Preencha os conteudos abaixo {###PROVIDE_YOUR_PROJECT_NAMESPACE_CP4X_HERE###}, {###PROVIDE_YOUR_ACE_LICENCE_CP4X_HERE###} e {###PROVIDE_YOUR_STORAGECLASSFS_HERE###} no comando abaixo:
```
echo "##### IBM CP4I ACE ####"; export PROJECT=cp4i ; export STORAGECLASSFS=rook-cephfs ; export ACELICENCE=L-KSBM-C37J2R ; chmod a+x /root/cp4i/aceInstance/aceInstance.sh ; /root/cp4i/aceInstance/./aceInstance.sh
```

```
 
