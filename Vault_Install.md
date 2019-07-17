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
