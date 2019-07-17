Máquina: logging
----------------

Procedimentos:
--------------

   Projeto: https://www.elastic.co

   ### Like Debian
   wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
   apt update && apt-get install apt-transport-https openjdk-11-jre -y
   echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-7.x.list
   apt update && apt install -y kibana logstash elasticsearch

   ### Like RedHat
   rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
   vim /etc/yum.repos.d/elasticstack.repo (Adicionar o Conteúdo abaixo)
       [elasticstack-7.x]
       name=Elasticstack repository for 7.x packages
       baseurl=https://artifacts.elastic.co/packages/7.x/yum
       gpgcheck=1
       gpgkey=https://artifacts.elastic.co/GPG-KEY-elasticsearch
       enabled=1
       autorefresh=1
       type=rpm-md   
   yum install kibana logstash elasticsearch -y  
