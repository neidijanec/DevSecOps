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
##digita no arquivo

##
consul agent -config-file /etc/consul/consul.hcl  &>> /var/log/consul.log &
tail -f /var/log/consul.log
cat /var/log/consul.log

root@logging:~# mkdir /etc/vault
root@logging:~# cd /etc/vault
root@logging:/etc/vault# vim vault.hcl
root@logging:/etc/vault# vim vault.hcl

###### conteudo do arquivo acima
ui = true

listener "tcp" {
        address = "0.0.0.0:8200"
        tls_disable = 1
}

storage "consul" {
        address = "127.0.0.1:8500"
        path = "vault/"
}
#########FIM DO ARQUIVO
 vault server -config=/etc/vault/vault.hcl &>> /var/log/vault.log &
tail /var/log/vault.log

root@logging:/etc/vault# export VAULT_ADDR=http://192.168.77.30:8200
root@logging:/etc/vault# export VAULT_API_ADDR=http://192.168.77.30:8200
root@logging:/etc/vault# cd
root@logging:~# vault operator init > vault_init.txt
root@logging:~# vim vault_init.txt
###dentro desse arquivo tem chaves de seguranca, q temos q usar 3 delas 
##contem tbm a  chave para acessar o usuario root

root@logging:~# head -n5 vault_init.txt

  Unseal Key 1: iTE1KFg2+pDKI81O4iISXyxlQNF1eoYmJkvLx6hkJ9XY
  Unseal Key 2: +m71Jimec/B+d1vJ0xaJBP5zHMRDQMHtj/GPm00Y1dKh
  Unseal Key 3: Y39wILCZSrM92KrxqmJrlzu4GdSTgBUDb0jeqgC77Qsw
  Unseal Key 4: XTGXboXi/hRZadsa8jSgtFFrzailNpsVmzC5CO1oC250
  Unseal Key 5: Shi2SjPxnB9Gll/WUynnXYvV55Fxy0kWL+UEwrgHJWMR

#rodar esse comando abaixo 3 vezes, na terceira vez vai aparecer Sealed false
root@logging:~# vault operator unseal
  Unseal Key (will be hidden): <colar uma chave aki>

## depois q destrava vamos rodar usuario root
root@logging:~# grep root vault_init.txt
root@logging:~# grep -i root vault_init.txt
Initial Root Token: s.3FHAxHryVxKqnByaeB0DMvPJ
root@logging:~# vault login
Token (will be hidden):<<copia e cola o Initial Root Token>>
##digita no browser 192.168.77.30:8200
SECRETS ENGINER> CLICA EM > enable a secrets engine
seleciona ssh clica no next
path dar um nome ou deixa ssh
coloca descrição
configura tempo etc
depois clica em enable engine
vai abrir a pagina q tem roles e configuration
create role
Nome Roler
CIDR List
 192.168.77.0/24
Port 22
key type otp >> ele faz a senha ser uma a cada vez
clica em criar


 ```
