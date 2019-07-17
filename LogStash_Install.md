Máquina: validation
-------------------

Procedimento:
-------------

* **Acessar**: https://www.elastic.co/pt/downloads/logstash
  - Baixa a última versão do Pacote de Instalação

* **Like Suse**
```bash
   zypper -n install java-1_8_0-openjdk java-1_8_0-openjdk-headless javapackages-tools
   wget https://artifacts.elastic.co/downloads/logstash/logstash-<version>.rpm
   rpm -ivh logstash-<version>.rpm
```

* Like Debian
```bash
   apt-get update ; apt-get install apt-transport-https openjdk-11-jre apache2 -y
   wget https://artifacts.elastic.co/downloads/logstash/logstash-<version>.deb
   dpkg -i logstash-<version>.deb
```
