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
      validation:~/gauntlt/examples # pwd
        /root/gauntlt/examples
      validation:~/gauntlt/examples # ls -a
      validation:~/gauntlt/examples # vim simplest.attack
      validation:~/gauntlt/examples # gauntlt simplest.attack
      validation:~/gauntlt/examples # cd dirb/
      validation:~/gauntlt/examples/dirb # ls
         dirb.attack
    
      validation:~/gauntlt/examples/dirb # vim dirb.attack
    
      Altera o arquivo as linas hostname | http://4linux.com.br  e wordlist  | euskera.txt 
      @slow
        Feature: Run dirb scan on a URL

        Scenario: Use dirb to scan a website for basic security requirements and the DIRB_WORDLISTS environment variable must be set in your path.  You can use different wordlists by changing the environment variable.
          Given "dirb" is installed
          And the following profile:
             | name                | value                          |
             | hostname            | http://4linux.com.br           |
             | dirb_wordlists_path | Overwritten by $DIRB_WORDLISTS |
             | wordlist            | euskera.txt                    |
          When I launch a "dirb" attack with:
          """
          dirb <hostname> <dirb_wordlists_path>/<wordlist> -wf
          """
          Then the output should contain:
          """
          FOUND: 0
          """
          
          ## salva o arquivo e sai: comando <esc>+w+q+ <enter>
          *******************************************
          validation:~/gauntlt/examples/dirb # echo $DIRB_WORDLISTS
            /opt/dirb/wordlists
          validation:~/gauntlt/examples/dirb # ls /opt/dirb/wordlists/
            big.txt     common.txt   extensions_common.txt  mutations_common.txt  small.txt    stress
            catala.txt  euskera.txt  indexes.txt            others                spanish.txt  vulns
          
            validation:~/gauntlt/examples/dirb # dirb http://4linux.com.br /opt/dirb/wordlists/euskera.txt -wf
            validation:~/gauntlt/examples/dirb # du -hs /opt/dirb/wordlists/euskera.txt
                  4.0K    /opt/dirb/wordlists/euskera.txt
            
            ##     rodar novamente o dirb attack
            validation:~/gauntlt/examples/dirb # gauntlt dirb.attack
            
            ##Modificar o timout do arquivo para 500
            ## Abre o arquivo atras da linha de comando:
                  validation:~/gauntlt/examples/dirb # vim dirb.attack
            
            ## E acrescenta o código abaixo, acima da linha >>> When I launch a "dirb" attack with: <<< :
                And The default aruba timeout is (\d+) seconds
            ## Substituindo >>>  (\d+) <<< por >>> 500 <<<
            ## ficando assim:
            ## And The default aruba timeout is 500 seconds
            ## When I launch a "dirb" attack with:
            
            ## executa o comando abaixo:
            validation:~/gauntlt/examples/dirb # gauntlt dirb.attack

## abre o arquivo novamente
validation:~/gauntlt/examples/dirb # vim dirb.attack
## substitui euskera.txt  por vulns/apache.txt 
## salva e sai e testa conforme comando abaixo
validation:~/gauntlt/examples/dirb # gauntlt dirb.attack

 validation:~/gauntlt/examples/heartbleed # vim heartbleed.attack
validation:~/gauntlt/examples/heartbleed # Heartbleed 4linux.com.br:443
2019/10/24 18:59:11 4linux.com.br:443 - SAFE
validation:~/gauntlt/examples/heartbleed # gauntlt heartbleed.attack

validation:~/gauntlt/examples/heartbleed # cd ../nmap/
validation:~/gauntlt/examples/nmap # ls
nmap.attack  os_detection.attack  simple-env-var.attack  simple.attack  tcp_ping_ports.attack  xml_output.attack
validation:~/gauntlt/examples/nmap # vim os_detection.attack
## testando
validation:~/gauntlt/examples/nmap # nmap -sV -p80 -PN 4linux.com.br

## criar arquivo vim Find.attack, com o conteudo abaixo:
Feature: Simple FIND attack

  Scenario: Ataque com o comando find      # find.attack:2
    When I launch a "generic" attack with: # gauntlt-1.0.13/lib/gauntlt/attack_adapters/generic.rb:1
      """

      su - vagrant -c 'find / -writable -type d 2> /dev/null'
      """
    Then the output should not contain:     # find.attack:9
      """
      /root
      """
## salva e sai
# executa
su - vagrant -c 'find / - writable - type d 2> /dev/null'

##depois 
 chmod 750 -R /root/
 chown root. -R /root/
 gauntlt find.attack
        

  


            
            


 
 




      
      
      
      
    ```
