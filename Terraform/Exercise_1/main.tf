# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
    region = "us-east-1"
    access_key = "ASIA3ZUSZAWNBHYMIAH3"
    secret_key = "83YUqUx7ijoVyOR4XCUdedyiVp3yOLy5FqOq/YRH"
    token = "FwoGZXIvYXdzEMX//////////wEaDA4AGB4EdbLG+y5BuiLVAUl5b+3imVNDzmD+RGSU+zornM3ANX82RVWmcaCWsfJ74ooTGGzPIbiymkniSSlcKEe8HT83wJKhq3DHL+sF+ejBbcLzI5JzEJGDVdSDbwqzQcqEJdxBBv+3k4Chu7IhPKO25mw5w8w8NVxR7TzYwLM0SgvnBQenMd5mL5ou/eDux0BuzDE6MThrTusWqU3kY12U1keMGGBoDzaYI67Y+kstusnnEPhtRR7xKundLPej6K50CCw3AC50+03jCuy0IR8UsyLeyRV06f180nx0oHhyEeKWCCjBlJOTBjIt0c7RO3HuNGv8iyoSv3oxFcwbDZ/qQTiHKhvjGEhSlmhHZl9MiDfdvv2rTB3D"
}


# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
#resource "aws_instance" "Udacity_T2" {
  
  # All four instances will have the same ami and instance_type
#  ami = "ami-0e472ba40eb589f49"
#  instance_type = "t2.micro"
#  count = 4     
#  tags = {
#    # The count.index allows you to launch a resource 
#    # starting with the distinct index number 0 and corresponding to this instance.
#    Name = "Udacity_T2-${count.index}"
#  }
#}


# TODO: provision 2 m4.large EC2 instances named Udacity M4
#resource "aws_instance" "Udacity_M4" {
#  ami           = "ami-0e472ba40eb589f49"
#  instance_type = "m4.large"
#  count = 2     
#  tags = {
#    # The count.index allows you to launch a resource 
#    # starting with the distinct index number 0 and corresponding to this instance.
#    Name = "Udacity_M4-${count.index}"
#  }
#}