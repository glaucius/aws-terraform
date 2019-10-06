# aws-terraform
laboratório de terraform para aws

Siga os passos abaixo, cruze os dedos e seja feliz.

Estes scripts estão preparados para realizar o deploy abaixo :

1 - Instalar e configurar o AWS Command Line 

    - Obter o AWS Command Line (awscli), abaixo link para ajuda.
        https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-install.html
    
    - Configurar o AWS Command Line com suas credenciais AWS 
        https://docs.aws.amazon.com/pt_br/cli/latest/userguide/cli-chap-configure.html


2 - Instalar o Terraform, para mais detalhes use os links abaixo :
        https://learn.hashicorp.com/terraform/getting-started/install.html


3 - Faça o clone do repositório, aqui você vai precisar do git :

    $ git clone git clone https://github.com/glaucius/aws-terraform.git

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
    - Banco de dados 

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









