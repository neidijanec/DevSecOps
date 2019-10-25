Máquina: logging
----------------

Procedimento:
-------------

* **Projeto**: https://modsecurity.org/
* **Instalação:**
  ```bash
  apt install apache2 libapache2-mod-security2 -y
  ```
* **COMANDOS NA AULA:**
   ```bash
  vagrant up logging --provision
  vagrant ssh logging
  sudo su
  vim /etc/resolv.conf
  # digita nameserver 8.8.8.8

   apt install apache2 libapache2-mod-security2 -y
  cp /etc/modsecurity/modsecurity.conf{-recommended,}

  vim /etc/modsecurity/modsecurity.conf
  alterar linha 7 aonde tem SecRuleEngine DetectionOnly coloca SecRuleEngine on
  apartir da linha 17 acrescentar
   17 #REGRA DVSECOPS
   18 #SecRule VARIAVEL SCRIPT/OPERADOR TRANSFORMACAO/ACAO
   19 secRule REQUEST_URI "@contains /4linux" "phase:1,id:'2727',log,status:403,deny"
   
   mkdir -p /var/www/html/linux
  echo "ESTA ACABANDO" >> /var/www/html/linux/index.html
  a2enmod security2
  systemctl restart apache2
   tail -f /var/log/apache2/error.log
 
   ##acessa o browser
  http://192.168.77.30/4linux

  ###depois 
  vim log-security.conf
  ####cola o codigo abaixo no arquivo log-security.conf
      input {
          file {
              path => "/var/log/apache2/error.log"
              start_position => "beginning"
          }
      }

      filter {
          if [path] =~ "error" {
              mutate { replace => { "type" => "apache_error" } }
              grok { match => { "message" => "%{HTTPD_ERRORLOG}" } }
          }
      }

      output {
          elasticsearch {
              hosts => ["192.168.77.30:9200"]
          }
          stdout { codec => rubydebug }
      }
  ######### salva e sai
  #Pacotes - Instalar
  
  apt install python-pip python-dev libffi-dev libssl-dev -y
  
  pip install "elastalert>=0.2.0b"
  
  
  
   ```
