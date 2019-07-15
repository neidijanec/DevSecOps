# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
 
#JENKINS / OWASP ZAP / ARACHNI 
  config.vm.define "jenkins" do |jenkins|
    jenkins.vm.hostname = "jenkins"
    jenkins.vm.box = "ubuntu/bionic64"
    jenkins.vm.box_check_update = false
    jenkins.vm.network "private_network", ip: "192.168.77.10", dns: "8.8.8.8"
  
    jenkins.vm.provider "virtualbox" do |jen|
	    jen.memory = "3072"
        jen.cpus = 3
			  #jen.gui = true
   end
  end 

#DOCKER / SONARQUBE / ANSIBLE / AWX 
  config.vm.define "docker" do |docker|
    docker.vm.hostname = "docker"
    docker.vm.box = "centos/7"
    docker.vm.box_check_update = false
    docker.vm.network "private_network", ip: "192.168.77.20", dns: "8.8.8.8"
  
    docker.vm.provider "virtualbox" do |doc|
    	doc.memory = "2048"
   end
  end 

#ELK // CHATOPS
  config.vm.define "elk" do |elk|
    elk.vm.hostname = "elk"
    elk.vm.box = "ubuntu/bionic64"
    elk.vm.box_check_update = false
    elk.vm.network "private_network", ip: "192.168.77.30", dns: "8.8.8.8"
  
    elk.vm.provider "virtualbox" do |log|
    	log.memory = "3072"
   end
  end 

#GAUNTLT / GERRIT / VAULT CLIENT
  config.vm.define "gauntlt" do |gauntlt|
    gauntlt.vm.hostname = "gauntlt"
    gauntlt.vm.box = "ubuntu/bionic64"
    gauntlt.vm.box_check_update = false
    gauntlt.vm.network "private_network", ip: "192.168.77.40", dns: "8.8.8.8"
  
    gauntlt.vm.provider "virtualbox" do |gau|
    	gau.memory = "1024"
   end
  end 

#VAULT 
  config.vm.define "vault" do |vault|
    vault.vm.hostname = "vault"
    vault.vm.box = "ubuntu/bionic64"
    vault.vm.box_check_update = false
    vault.vm.network "private_network", ip: "192.168.77.50", dns: "8.8.8.8"
  
    vault.vm.provider "virtualbox" do |vau|
    	vau.memory = "1024"
   end
  end 

#AUDIT / OPENSCAP / KONG
  config.vm.define "audit" do |audit|
    audit.vm.hostname = "audit"
    audit.vm.box = "centos/7"
    audit.vm.box_check_update = false
    audit.vm.network "private_network", ip: "192.168.77.60", dns: "8.8.8.8"
  
    audit.vm.provider "virtualbox" do |aud|
	    aud.memory = "1024"
		    #aud.gui = true
   end
  end 

  config.vm.provision "shell", inline: <<-SHELL
    mkdir -p /root/.ssh/
    cat /vagrant/devsecops.pem > /root/.ssh/id_rsa
    cat /vagrant/devsecops.pub > /root/.ssh/authorized_keys
    chmod 600 /root/.ssh/id_rsa
  SHELL
end
