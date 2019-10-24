Máquina: automation
-------------------

Documentação:
-------------
* Ansible Hardening: https://docs.openstack.org/ansible-hardening/latest/
* CIS Benchmarks   : https://www.cisecurity.org/cis-benchmarks/

Procedimento:
-------------

* **Instalação:**
  ```bash
  ansible-galaxy install git+https://github.com/openstack/ansible-hardening.git
  ```
* **GIT ANSIBLE HARDENING:**
  ```bash
     https://github.com/openstack/ansible-hardening
  ```
  * **Comandos na aula com Yago**
     ```bash
     entra na VM dar permissao sudo su -     
     vagrant@automation:~$ansible-galaxy install git+https://github.com/openstack/ansible-hardening
     - extracting ansible-hardening to /etc/ansible/roles/ansible-hardening
      - ansible-hardening was installed successfully
      root@automation:~# cd /etc/ansible/roles/ansible-hardening/
      root@automation:/etc/ansible/roles/ansible-hardening# ls
      LICENSE    README.rst   bindep.txt  doc    handlers  manual-test.rc  releasenotes  setup.cfg  tasks      test_plugins  tox.ini  zuul.d
      README.md  Vagrantfile  defaults    files  library   meta            run_tests.sh  setup.py   templates  tests         vars
      root@automation:/etc/ansible/roles/ansible-hardening# 
      root@automation:/etc/ansible/roles/ansible-hardening# cd ../../
      root@automation:/etc/ansible# cd playbooks/
      criar o arquivo hardening.yml
      root@automation:/etc/ansible/playbooks# vim hardening.yml
      vai digitar o seguinte no arquivo:
      ---
      - name: Ansible Hardening
        hosts: all
        user: root
        #become: yes
        vars:
          - security_enable_firewalld: no
          - security_rhel7_initialize_aide: no
          - security_disallow_blank_password_login: no
          - security_sshd_permit_root_login: yes
          - security_ntp_servers:
                  - a.ntp.br
                  - b.ntp.br
       roles:
         - ansible-hardening
      
      SALVA ESC+:+W+Q ENTER
      executa com o seguinte comando
      root@automation:/etc/ansible/playbooks# ansible-playbook --limit 192.168.77.20 hardening.yml

      mensagem qdo terminar de executar::: You have new mail in /var/mail/root
      sai da maquina : 
      root@automation:/etc/ansible/playbooks# logout
      vagrant@automation:~$ exit

      acessa novamente : 
      vagrant@automation:~$ vagrant ssh automation
      vagrant@automation:~$ sudo su -
      
      PARA INSTALAR E CONFIGURAR O GAUNTLT
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
      
      
    ```
