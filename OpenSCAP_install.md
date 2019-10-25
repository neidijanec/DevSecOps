Máquina: testing
----------------

Procedimento:
-------------

* **Projeto**: https://www.open-scap.org/
* **Instalação:**
  ```bash
  yum install openscap-scanner scap-security-guide scap-workbench -y
  ```
* **comandos na aula:**
  ```bash
[vagrant@testing ~]$ cd /usr/share/xml/scap/ssg/content/
[vagrant@testing content]$ ls
ssg-centos6-ds.xml              ssg-firefox-ocil.xml        ssg-jre-oval.xml              ssg-rhel6-xccdf.xml
ssg-centos6-xccdf.xml           ssg-firefox-oval.xml        ssg-jre-xccdf.xml             ssg-rhel7-cpe-dictionary.xml
ssg-centos7-ds.xml              ssg-firefox-xccdf.xml       ssg-rhel6-cpe-dictionary.xml  ssg-rhel7-cpe-oval.xml
ssg-centos7-xccdf.xml           ssg-jre-cpe-dictionary.xml  ssg-rhel6-cpe-oval.xml        ssg-rhel7-ds.xml
ssg-firefox-cpe-dictionary.xml  ssg-jre-cpe-oval.xml        ssg-rhel6-ds.xml              ssg-rhel7-ocil.xml
ssg-firefox-cpe-oval.xml        ssg-jre-ds.xml              ssg-rhel6-ocil.xml            ssg-rhel7-oval.xml
ssg-firefox-ds.xml              ssg-jre-ocil.xml            ssg-rhel6-oval.xml            ssg-rhel7-xccdf.xml
#### VER PERFIL dos arquivos acima:
 [vagrant@testing content]$ oscap info ssg-centos7-ds.xml
## ver configurações,informações
 [vagrant@testing content]$ oscap --v
[vagrant@testing content]$ pwd
/usr/share/xml/scap/ssg/content

[vagrant@testing content]$ oscap xccdf eval --profile pci-dss --report /vagrant/report_oscap.html --fetch-remote-resources ssg-centos7-ds.xml
##remediate resolve problema na maquina
[vagrant@testing content]$ oscap xccdf eval --remediate --profile pci-dss --report /vagrant/report_oscap.html --fetch-remote-resources ssg-centos7-ds.xml
[vagrant@testing content]$ oscap xccdf generate fix --fix-type ansible --profile pci-dss --output /root/fix.yml ssg-centos7-ds.xml

  ```
