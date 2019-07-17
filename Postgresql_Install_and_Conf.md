Máquina: testing
----------------

Procedimentos:
--------------

* **Instalação: **
  ```bash
  rpm -Uvh https://yum.postgresql.org/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm
  yum install postgresql10-server postgresql10
  ```

* **Inicializando BD:**
  ```bash
  /usr/pgsql-10/bin/postgresql-10-setup initdb
  systemctl start postgresql-10
  ```
