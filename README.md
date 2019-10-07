AWS-Terrafom - Infra estrutura como código

Você quer construir sua cloud orientada em código, veio no lugar certo.

O aws-terraform é um conjunto de códigos que realizam o deploy de uma infra estrutura na AWS, orientada a subnets públicas e privadas, garantindo comunicação entre as redes (aplicação e banco) e também garantindo a conexão com a internet para as redes privadas.

O que é deployado por código no aws-terraform

    - VPC 
    - Subnets pública e privada
    - Internet Gateway
    - NAT Gateway
    - Rotas e associações
    - Security Groups
    - EC2 - Instância web
    - EC2 - Instância db
    
Ainda temos espaço para incluir novos serviços, fica pra frente.

Bom, para você seguir adiante, siga os passos abaixo e cruze os dedos :

1 - Instalar e configurar o AWS Command Line 

    - Obter o AWS Command Line (awscli), abaixo link para ajuda.
        https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-install.html
    
    - Configurar o AWS Command Line com suas credenciais AWS 
        https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html


2 - Instalar o Terraform, para mais detalhes use os links abaixo :

    - https://learn.hashicorp.com/terraform/getting-started/install.html


3 - Faça o clone do repositório, aqui você vai precisar do git :

    $ git clone https://github.com/glaucius/aws-terraform.git

    * Caso preferir, pode baixar o zip do repositório Git.

4 - Inicializar o Terraform no diretório do projeto

    $ cd aws-terraform/
    $ terraform init

5 - Criar suas chaves ssh no diretório do projeto

    $ cd aws-terraform
    $ ssh-keygen -f minha-chave-ssh

6 - Configuração inicial :

    - Região : us-west-2
    - Zona de disponibilidade 1 e 2 : us-west-2a e us-west-2-b
    - Bloco IP da VPC : 10.0.0.0/16
    - Subnet de servidores web - pública : 10.0.1.0/24
    - Subnet de servidores db - privada : 10.0.2.0./24
    - SO utilizado : CentOS 7
    - Banco de dados utilizado : MariaDB
    - Servidor web utilizado : Apache
    - Duas instâncias : DB01 e WEB01
    - Os servidores web utilizam o arquivo userdataweb.sh para setup de serviço web em tempo de deploy
    - Os servidores db utilizam o arquivo userdatadb.sh para setup de serviço de banco de dados em tempo de deploy

7 - Caso queira alterar, incluir ou remover algo, por favor, edite os arquivos .tf

8 - Agora é validar e criar o plano de implementação 

    $ terraform plan --out plano.out

    Se você não alterou os arquivos .tf, deve receber a mensagem abaixo :

    Plan: 15 to add, 0 to change, 0 to destroy.
    ------------------------------------------------------------------------
    This plan was saved to: plano.out
    To perform exactly these actions, run the following command to apply:
    terraform apply "plano.out"

9 - Depois de validar e criar o plano, é mandar rodar 

    $ terraform apply plano.out

    Cruze os dedos, vá tomar um café que em minutos você terá sua infra estrutura operacional.

Obrigado e boa sorte !!!









