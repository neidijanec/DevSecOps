Máquina: automation
-------------------

Procedimentos:
--------------

* **Projeto**: https://github.com/coreos/clair
* **Container**:
  ```bash
  docker run -p 5432:5432 -d --name db arminc/clair-db:2017-09-18
  docker run -p 6060:6060 --link db:postgres -d --name clair arminc/clair-local-scan:v2.0.6
  ```

* **Scanner:**
    - Acessar: https://github.com/arminc/clair-scanner/releases
    - Baixar última versão do **clair-scanner_linux_amd64**

* ** CLAIR
- https://github.com/coreos/clair
- https://github.com/arminc/clair-scanner/releases
- https://docs.docker.com/compliance/cis/docker_ee/
- https://github.com/docker/docker-bench-security
```bash

## acessar a VM automation
$ vagrant ssh automation

vagrant@automation:~$ sudo su -

root@automation:~# docker images
REPOSITORY                TAG                 IMAGE ID            CREATED             SIZE
memcached                 alpine              e0ec4da6251b        2 days ago          9.08MB
ansible/awx_task          latest              f5bffba536e3        3 days ago          2.02GB
ansible/awx_web           latest              c682e8dfa612        3 days ago          1.98GB
postgres                  9.6                 afd8110f1813        7 days ago          211MB
arminc/clair-db           latest              f653a7701575        13 days ago         415MB
arminc/clair-local-scan   latest              86deddc5e1a9        13 days ago         355MB
bkimminich/juice-shop     latest              b498f67a97f9        2 weeks ago         277MB
sonarqube                 latest              d7558a6a8598        5 weeks ago         479MB
ansible/awx_task          7.0.0               dc5983bbaf55        7 weeks ago         1.68GB
ansible/awx_web           7.0.0               6a942a0c5461        7 weeks ago         1.65GB
hello-world               latest              fce289e99eb9        9 months ago        1.84kB
ansible/awx_rabbitmq      3.7.4               e08fe791079e        19 months ago       85.6MB
ansible/awx_rabbitmq      latest              e08fe791079e        19 months ago       85.6MB

## remover umas images para liberar espaço
root@automation:~# docker rmi c682e8dfa612
root@automation:~# docker rmi f5bffba536e3

# limpa sistemas, tirar td q está sendo subutilizado e remove
docker system prune 

#limpa todo o docker:
docker rm -f $(docker ps -q)

#lista td no docker
docker ps

#relata a quantidade de espaço em disco disponível sendo usada pelos sistemas de arquivos
df -h
# criando contener com essa imagem
docker run -p 5432:5432 -d --name db arminc/clair-db
#criando  contener de banco de dados likando com a imagem de cima
docker run -p 6060:6060 --link db:postgres -d --name clair arminc/clair-local-scan

root@automation:~# docker ps
CONTAINER ID        IMAGE                     COMMAND                  CREATED             STATUS              PORTS                              NAMES
9d97b596b6ca        arminc/clair-local-scan   "/clair -config=/con…"   5 seconds ago       Up 3 seconds        0.0.0.0:6060->6060/tcp, 6061/tcp   clair
7760f67a86f7        arminc/clair-db           "docker-entrypoint.s…"   2 minutes ago       Up 2 minutes        0.0.0.0:5432->5432/tcp             db

# copia para o diretorio bin/clair
cp clair-scanner_linux_amd64 /bin/clair

# dando permissao de execução para o clair
chmod +x /bin/clair
#iniciar o scanner, validando camada por camada
clair --ip 172.17.0.1 sonarqube

clair --ip 172.17.0.1 -l /root/clair_info -r /root/clair_vulns -t High postgres

docker pull alpine

clair --ip 172.17.0.1 alpine

# criar contener alpine
 docker run -d -ti alpine
      aed3e174577302d9361f890e4ca8930d2fbb5564eae08bba1017d1a55b89999c
dockerroot@automation:~# docker exec -ti 87 /bin/sh

#instalar algo nele >>  apk instal apache2

clair --ip 172.17.0.1 postgres:alpine

#executa comando abaixo do git https://github.com/docker/docker-bench-security , Running Docker Bench for Security
docker run -it --net host --pid host --userns host --cap-add audit_control \
-e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
    -v /etc:/etc:ro \
    -v /usr/bin/docker-containerd:/usr/bin/docker-containerd:ro \
    -v /usr/bin/docker-runc:/usr/bin/docker-runc:ro \
    -v /usr/lib/systemd:/usr/lib/systemd:ro \
    -v /var/lib:/var/lib:ro \
    -v /var/run/docker.sock:/var/run/docker.sock:ro \
    --label docker_bench_security \
    docker/docker-bench-security


  ```
