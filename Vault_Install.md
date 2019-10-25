Máquina: logging - `[SERVER]`
---------------------------

Procedimentos:
--------------

* **Projeto:** https://www.vaultproject.io/ - Baixar última versão
* **Instalação:**
  ```bash
  wget https://releases.hashicorp.com/vault/<version>/vault_<version>_linux_amd64.zip
  apt install unzip
  unzip vault_<version>_linux_amd64.zip
  cp vault /usr/bin
  ```

Máquina: validation - `[CLIENT - SSH Helper]`
--------------------------------------------

Procedimentos:
--------------

* Acessar https://releases.hashicorp.com/vault-ssh-helper/ e Download da última versão
* **Instalação:**
  ```bash
  wget https://releases.hashicorp.com/vault-ssh-helper/<version>/vault-ssh-helper_<version>_linux_amd64.zip
  unzip vault-ssh-helper_<version>_linux_amd64.zip
  cp vault-ssh-helper /usr/bin/
  ```
***
  ```bash
https://www.consul.io/
https://www.vaultproject.io/

vagrant up validation logging --provision
vagrant ssh validation 
sudo su -


# abre novo terminal e executa abaixo < teremos as duas VM rodando
vagrant ssh logging
sudo su -
# # Download Consul https://releases.hashicorp.com/consul/1.6.1/consul_1.6.1_linux_amd64.zip
wget -c https://releases.hashicorp.com/consul/1.6.1/consul_1.6.1_linux_amd64.zip
apt-get install unzip -y
unzip vault_1.2.3_linux_amd64.zip
unzip consul_1.6.1_linux_amd64.zip
cp consul /usr/bin
cp vault /bin/
useradd -r consul
mkdir -p /var/consul/data/vault
chown -R consul.consul /var/consul/
mkdir /etc/consul/
vim /etc/consul/consul.hcl





 ```
