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

     ```
