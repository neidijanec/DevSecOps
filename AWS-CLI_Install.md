Máquina: automation


-------------------

Procedimentos:
-------------

* **Documentação**: https://docs.aws.amazon.com/pt_br/cli/latest/
* **Instalação**:
  ```bash
  apt install awscli
  pip install awscli --upgrade --user
  pip install boto
  ```
* ** acessar o aws
```bash
## criar conta
## depois criar usuarioo
## dar permissao
## e na maquina virtual
 apt install awscli -y
 
 pip install awscli --upgrade
 pip install boto boto3 botocore
 aws --version
 aws configure
    AWS Access Key ID [None]:
    AWS Secret Access Key [None]:
    Default region name [None]: us-east-a1
    Default output format [None]:
root@automation:~# cat .aws/config
## as credenciais. essa pasta nao pode ir pro github. pois tem todos os dados
root@automation:~# cat .aws/credentials

wget https://raw.githubusercontent.com/yesquines/DevSecOps/Aula08/Cloud/iam.yaml
wget https://raw.githubusercontent.com/yesquines/DevSecOps/Aula08/Cloud/financeiro.json
wget https://raw.githubusercontent.com/yesquines/DevSecOps/Aula08/Cloud/analista.json

#muda o name do grupo analists e do grupo financeiro

vim iam.yaml
#parte do conteudo do arquivo iam
- name: create user <nome1> and add group analistas
            iam:
                    iam_type: user
              muda aki>>>>        name: ioda
                    password: devops
                    state: present
                    access_key_state: create
                    groups: analistas



          - name: create user <nome2> and add group financeiro
            iam:
                    iam_type: user
              muda aki>>>>      name: jedi
                    password: devops
                    state: present
                    access_key_state: create
                    groups: financeiro

############


 
 ```
