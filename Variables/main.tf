provider "aws" {
  // We have to set provider as well so that we could use aws APIs . This should be as same as your main.tf files.
  region = "eu-west-2"
}

variable "For_multiple_VPC" {
  // This file is used for setting/deploying multiple vpcs at a time.
  type    = string
  default = "myvpc"
}

variable "sshport" {
  // This var is for default sshport
  type    = number
  default = 22
}

variable "enabled" {
  // This var is for feature switch
  default = true
}

variable "mylist" {
  // This var is list which is as same as Array
  type    = list(string)// here we show what type of data type list are we dclareing e.g. String, int, boolean, long etc
  default = ["Value-1", "Value-2"]
  // List can be use let's say you have multiple firewall rules and you can send in a list format.
}

variable "mymap" {
  // This var is map which is as same as Mapping in programming
  type    = map               // mapping is done in a key value pair.
  default = {
    Key-1 = "Value1"
    Key-2 = "Value2"
  }
}

variable "inputname" {
    type = string
    description = "Set the name of the VPC"

}

resource "aws_vpc" "myvpc" {              // This block was taken from main.tf file
  cidr_block = "10.0.0.0/16"

/*  tags = {
    Name = var.For_multiple_VPC    // This is the vpc name declared above.
    // We can also do String interpolation if you have 0.12 terraform version    ${var.For_multiple_VPC}
    // In terraform above 0.12 version, string interpolation is not needed.
  }

  tags = {
    Name = var.mylist[0]    // This will use list value Value-1
  }

  tags = {
    Name = var.mymap["Key-1"]   // This will take value from Key-1
  }*/
  tags = {
    Name = var.inputname
  }
}

output "vpcid" {         // This is to generate vpcID (attribute) after we run apply commands
  value = aws_vpc.myvpc.id   // It works like  sourceType.theNameWeGave.theAttribute
}

variable "my_tuple" {  // This is similar to list but here we can use various data types unlike list where only one data type is allowed
  type = tuple([string,number,bool,string])
  default = ["Cat",1,true,"Horse"]
}

variable "myObject" {
  type = object({name = string, port = list(number)})
  default = {
    name = "TJ"
    port = [22, 25, 80]
  }
}