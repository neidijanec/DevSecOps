Máquina: automation
-------------------

Procedimentos:
--------------

* **Projeto AWX:** https://github.com/ansible/awx
* **Instalação:**
  - Acessar https://github.com/ansible/awx/releases e baixar a versão mais atual em formato tar.gz
    ```bash
    wget https://github.com/ansible/awx/archive/<versao>.tar.gz
    tar xf <versao>.tar.gz
    cd awx-<versao>/installer/
    ```
User@DESKTOP-7UHTEJQ MINGW32 ~/Documents/devsecops/DevSecOps (master)
$ vagrant ssh automation
root@automation:~# docker ps
root@automation:~# rm -r /tmp/awxcompose/
root@automation:~# ls
7.0.0.tar.gz  clair-scanner_linux_amd64
awx-7.0.0     terraform_0.12.10_linux_amd64.zip

root@automation:~# docker ps -q
ca002c4b4a59
30c5e003f3a5
0254602b655d
f963a4466792
root@automation:~# docker ps
root@automation:~# docker stop sonarqube
sonarqube

root@automation:~# docker ps
root@automation:~# docker rm -f $(docker ps -q)
ca002c4b4a59
30c5e003f3a5
0254602b655d
root@automation:~# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

root@automation:~# cd awx-7.0.0/
root@automation:~/awx-7.0.0# ls
API_STANDARDS.md   INSTALL.md   Makefile   awxkit     manage.py     setup.py
CONTRIBUTING.md    ISSUES.md    README.md  config     pytest.ini    tools
DATA_MIGRATION.md  LICENSE.md   VERSION    docs       requirements
DCO_1_1.md         MANIFEST.in  awx        installer  setup.cfg
root@automation:~/awx-7.0.0# cd installer/
root@automation:~/awx-7.0.0/installer#
root@automation:~/awx-7.0.0/installer# ansible-playbook -i inventory install.yml

root@automation:~/awx-7.0.0/installer# sysctl -w vm.drop_caches=3
root@automation:~/awx-7.0.0/installer# docker ps
CONTAINER ID        IMAGE                        COMMAND                  CREATED             STATUS              PORTS                                                 NAMES
84b3518e051d        ansible/awx_task:7.0.0       "/tini -- /bin/sh -c…"   2 minutes ago       Up 2 minutes        8052/tcp                                              awx_task
e2754a228233        ansible/awx_web:7.0.0        "/tini -- /bin/sh -c…"   2 minutes ago       Up 2 minutes        0.0.0.0:80->8052/tcp                                  awx_web
d7bfb81d7aa1        ansible/awx_rabbitmq:3.7.4   "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes        4369/tcp, 5671-5672/tcp, 15671-15672/tcp, 25672/tcp   awx_rabbitmq
8f5a162a3ac4        memcached:alpine             "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes        11211/tcp                                             awx_memcached
34114bf2215c        postgres:9.6                 "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes        5432/tcp                                              awx_postgres

root@automation:~/awx-7.0.0/installer# docker logs awx_web
Using /etc/ansible/ansible.cfg as config file
127.0.0.1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "elapsed": 0,
    "match_groupdict": {},
    "match_groups": [],
    "path": null,
    "port": 5432,
    "search_regex": null,
    "state": "started"
}
Using /etc/ansible/ansible.cfg as config file
127.0.0.1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "elapsed": 0,
    "match_groupdict": {},
    "match_groups": [],
    "path": null,
    "port": 11211,
    "search_regex": null,
    "state": "started"
}
Using /etc/ansible/ansible.cfg as config file
127.0.0.1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "elapsed": 13,
    "match_groupdict": {},
    "match_groups": [],
    "path": null,
    "port": 5672,
    "search_regex": null,
    "state": "started"
}
Using /etc/ansible/ansible.cfg as config file
127.0.0.1 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "db": "awx"
}
Found another fil...................
.................................

abre no navegar
http://192.168.77.20/#/login



