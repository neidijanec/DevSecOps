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
