# ========================ECS Instances=======================

provider "aws" {
  secret_key = "<AWS_SECRET_KEY>"
  access_key = "<AWS_ACCESS_KEY_ID>"
  region = "<REGION>"
}

# EC2 instances
resource "aws_instance" "sampleInstances" {
  count = 1

  # ami = "${var.ecsAmi}"
  ami = "ami-00b7e666605d33085"
  #The AMI specified above is a public Ubuntu image, backed by EBS. It was available on AWS at the time of
  #authoring this sample. You can also specify your own AMI image or use any other public EBS backed image if the
  #AMI used in the sample is decommissioned.
  availability_zone = "ap-south-1a"   #REPLACE THIS WITH YOUR AVAILABILITY ZONE
  instance_type = "t2.micro"
  associate_public_ip_address = true
  source_dest_check = false

  tags = {
    Name = "sampleInstances-${count.index}"
  }
}
