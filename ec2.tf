### EC2 - Instances


### Criação de EC2 para DBservers
resource "aws_instance" "DB01" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  ### VPC
  subnet_id = "${aws_subnet.prod-subnet-private-1.id}"
  availability_zone = "${var.AWS_REGION_AZ_DB}"
  ### Atribuir Security Group
  vpc_security_group_ids = ["${aws_security_group.dbservers.id}"]
  ### Chave pública utilizada
  key_name = "${aws_key_pair.minha-chave-ssh.id}"
  ### Script para deploy de banco de dados MariaDB/MySQL
  user_data = "${file("userdatadb.sh")}"
  connection {
    user = "centos"
    private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  }
  tags = {
    Name = "DB01"
  }
}

### Criação de EC2 para Webservers
resource "aws_instance" "WEB01" {
  ami           = "${data.aws_ami.centos.id}"
  instance_type = "t2.micro"
  ### VPC
  subnet_id = "${aws_subnet.prod-subnet-public-1.id}"
  availability_zone = "${var.AWS_REGION_AZ_WEB}"
  ### Atribuir Security Group
  vpc_security_group_ids = ["${aws_security_group.webservers.id}"]
  ### Chave pública utilizada
  key_name = "${aws_key_pair.minha-chave-ssh.id}"
  ### Script para deploy de servidor web 
  user_data = "${file("userdataweb.sh")}"
  connection {
    user = "centos"
    private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
  }
  tags = {
    Name = "WEB01"
  }
}

### Idenfiticar e localizar ultima versão de CentOS 7 - Oficial
data "aws_ami" "centos" {
  owners      = ["679593333241"]
  most_recent = true
  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS *"]
  }
  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
}
### Chave pública que deve ser enviada para as EC2 no momento do deploy
### para criar, basta digitar no diretorio raiz :  ssh-keygen -f minha-chave-ssh 
resource "aws_key_pair" "minha-chave-ssh" {
  key_name = "minha-chave-ssh"
  public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
