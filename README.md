============== *AULA 08* ==============
---------------------------------------

* Aula08 - Contempla a Aula Prática de AWS e GCP
  - *Contéudo geral*: Arquivos para realizar procedimentos de Deploy com IaC

* ** conteudo aula
- *https://cloud.google.com
```bash
new projets
depois vai o IAM & Admin > Contas de serviço 
criar como editor e validador
criar uma chave e copia o codigo json q criou no arquivo qdo gerou a chave
root@automation:~#
root@automation:~# ls
7.0.0.tar.gz  awx-7.0.0  clair-scanner_linux_amd64  clair_info  clair_vulns  terraform_0.12.10_linux_amd64.zip
root@automation:~# mkdir gcp
root@automation:~# cd gcp/
root@automation:~/gcp# vim key.json
root@automation:~/gcp# ls
key.json
root@automation:~/gcp# cat key.json
root@automation:~/gcp# cd ../
root@automation:~/gcp# cd ../
root@automation:~# unzip terraform_0.12.10_linux_amd64.zip
Archive:  terraform_0.12.10_linux_amd64.zip
  inflating: terraform
root@automation:~# cp terraform /usr/bin/
root@automation:~# terraform --version
Terraform v0.12.10

Your version of Terraform is out of date! The latest version
is 0.12.12. You can update by downloading from www.terraform.io/downloads.html
root@automation:~# cd gcp/
root@automation:~/gcp# wget -q https://raw.githubusercontent.com/yesquines/DevSecOps/Aula08/Cloud/provider.tf

```
