Máquina: testing
----------------

Procedimento:
-------------

* **Projeto:** https://konghq.com/
* **Instalação**:
  ```bash
  wget https://bintray.com/kong/kong-rpm/rpm -O /etc/yum.repos.d/bintray-kong-kong-rpm.repo
  export major_version=`grep -oE '[0-9]+\.[0-9]+' /etc/redhat-release | cut -d "." -f1`
  sed -i -e 's/baseurl.*/&\/centos\/'$major_version''/ /etc/yum.repos.d/bintray-kong-kong-rpm.repo
  yum install kong -y
  ```
* ** PASSO A PASSO DA AULA**:
  ```bash
	######## Executa os 4 comando desse arquivo abaixo, 
	https://github.com/neidijanec/DevSecOps/blob/Aula10/Postgresql_Install_and_Conf.md
	[root@testing ~]# su - postgres
	-bash-4.2$ psql -c "create user kong with password '4linux';"
	CREATE ROLE
	-bash-4.2$psql -c "create database kong owner kong;"
	CREATE DATABASE
	-bash-4.2$ vim 10/data/pg_hba.conf
	#Na linha 82 troca ident por trust, salva e sai
	logout
	systemctl restart postgresql-10
	kong migrations bootstrap
	kong migrations up
	kong start
	#mostra os limites de configuração que podem serem feitos no sistema kong
	ulimit -a
	ss -lntp | egrep "(80|84)[0-9]{2}"

	

 ```
