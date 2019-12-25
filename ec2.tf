### EC2 - Instances


### Criação de EC2 para DBservers
resource "aws_instance" "DB01" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"
  ### VPC
  subnet_id = aws_subnet.prod-subnet-private-1.id
  availability_zone = var.AWS_REGION_AZ_DB
  ### Atribuir Security Group
  vpc_security_group_ids = [aws_security_group.dbservers.id]
  ### Chave pública utilizada
  key_name = aws_key_pair.minha-chave-ssh.id
  ### Script para deploy de banco de dados MariaDB/MySQL
  user_data = file("userdatadb.sh")
  connection {
    user = "ec2-user"
    private_key = file(var.PRIVATE_KEY_PATH)
  }
  tags = {
    Name = "DB01"
  }
}

### Criação de EC2 para Webservers
resource "aws_instance" "WEB01" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"
  ### VPC
  subnet_id = aws_subnet.prod-subnet-public-1.id
  availability_zone = var.AWS_REGION_AZ_WEB_1
  ### Atribuir Security Group
  vpc_security_group_ids = [aws_security_group.webservers.id]
  ### Chave pública utilizada
  key_name = aws_key_pair.minha-chave-ssh.id
  ### Script para deploy de servidor web 
  user_data = file("userdataweb.sh")
  connection {
    user = "ec2-user"
    private_key = file(var.PRIVATE_KEY_PATH)
  }
  tags = {
    Name = "WEB01"
  }
}

### Criação de EC2 para Webservers
resource "aws_instance" "WEB02" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"
  ### VPC
  subnet_id = aws_subnet.prod-subnet-public-2.id
  availability_zone = var.AWS_REGION_AZ_WEB_2
  ### Atribuir Security Group
  vpc_security_group_ids = [aws_security_group.webservers.id]
  ### Chave pública utilizada
  key_name = aws_key_pair.minha-chave-ssh.id
  ### Script para deploy de servidor web 
  user_data = file("userdataweb.sh")
  connection {
    user = "ec2-user"
    private_key = file(var.PRIVATE_KEY_PATH)
  }
  tags = {
    Name = "WEB02"
  }
}
resource "aws_instance" "WEB03" {
  ami           = "ami-00068cd7555f543d5"
  instance_type = "t2.micro"
  ### VPC
  subnet_id = aws_subnet.prod-subnet-public-3.id
  availability_zone = var.AWS_REGION_AZ_WEB_3
  ### Atribuir Security Group
  vpc_security_group_ids = [aws_security_group.webservers.id]
  ### Chave pública utilizada
  key_name = aws_key_pair.minha-chave-ssh.id
  ### Script para deploy de servidor web 
  user_data = file("userdataweb.sh")
  connection {
    user = "ec2-user"
    private_key = file(var.PRIVATE_KEY_PATH)
  }
  tags = {
    Name = "WEB03"
  }
}

### Chave pública que deve ser enviada para as EC2 no momento do deploy
### para criar, basta digitar no diretorio raiz :  ssh-keygen -f minha-chave-ssh 
resource "aws_key_pair" "minha-chave-ssh" {
  key_name = "minha-chave-ssh"
  public_key = file(var.PUBLIC_KEY_PATH)
}
