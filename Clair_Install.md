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

* **Scanner: **
    - Acessar: https://github.com/arminc/clair-scanner/releases
    - Baixar última versão do **clair-scanner_linux_amd64**
