Máquina: validation
-------------------

Procedimentos:
--------------

* **Projeto**: http://gauntlt.org/

* **Like Suse**
  ```bash
  zypper -n install ruby ruby-devel python python2-pip nmap go libcurl-devel git
  zypper -n install --type pattern devel_basis
  gem install rake gauntlt
  alias gauntlt=gauntlt.ruby2.5
  git clone https://github.com/gauntlt/gauntlt.git
  ```

* Like Debian
  ```bash
  apt install ruby rubygems ruby-dev dirb python nmap gem zlib1g-dev zlib1g build-essential -y
  gem install rake gauntlt
  git clone https://github.com/gauntlt/gauntlt.git
  export DIRB_WORDLISTS=/root/dirb/wordlists/
  ```

* Like RedHat - Fedora
  ```bash
  dnf install wget ruby rubygems ruby-devel python nmap gem -y
  dnf groupinstall "Development Tools" "Development Libraries" -y
  gem install rake gauntlt
  git clone https://github.com/gauntlt/gauntlt.git
  ```
* **PARA INSTALAR E CONFIGURAR O GAUNTLT
 ```bash
      Link's:
        https://raw.githubusercontent.com/yesquines/DevSecOps/Aula06/install_gauntlt_deps.sh
        http://gauntlt.org/	
        
      Em outro terminar inicia a outra maquina disponivel na aula a VALIDATION (gauntlt/ logstash / gerrit/ vault client)
      vagrant up validation
      vagrant ssh validation
      vagrant@validation:~> sudo su -
      validation:~ #
      validation:~ # ls
        apache_log.conf  bin  gauntlt  logstash-7.4.0.rpm
      validation:~ # wget -q https://raw.githubusercontent.com/yesquines/DevSecOps/Aula06/install_gauntlt_deps.sh
      validation:~ # source install_gauntlt_deps.sh
      validation:/opt # alias gauntlt=gauntlt.ruby2.6
      validation:/opt # gauntlt -v
      [DEPRECATION] This gem has been renamed to optimist and will no longer be supported. Please switch to optimist as soon as possible.
      1.0.13
      
      em gauntlt/exemples/:
      validation:~ # cd gauntlt/examples/
      validation:~/gauntlt/examples # zypper -n install libxslt libxslt-devel
      validation:~/gauntlt/examples # gauntlt -a
   
      
      
      
      
    ```
