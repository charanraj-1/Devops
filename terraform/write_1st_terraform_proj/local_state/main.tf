terraform{
required_version=">=1.2.0"
   }
resource "aws_instance" "ec2_instance" {
  ami           = "ami-0ec10929233384c7f"
  instance_type = "t3.micro"
  key_name="Charan_123"
  tags = {
    Name = "jenkins"
  }
}

