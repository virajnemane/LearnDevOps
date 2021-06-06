variable region {
        description = "aws region"
        default = "us-east-1"
}

variable ec2count {
        default = "3"
}
variable ami {
        description = "ami for ec2 instance as per region"
        type = map(string)
        default = {
                "us-east-1" = "ami-047a51fa27710816e"
                "us-west-1" = "ami-005c06c6de69aee84"
        }
}

variable instance_type {
        description = "instance type of ec2"
        default = "t2.micro"
}

variable key_name {
        description = "key for ec2"
        default = "tcia-nv"
}

variable subnet_id {
        description = "subnet for ec2"
        default = "subnet-0fa6b335bf76fe56e"
}

variable sg_ids {
        description = "security groups for ec2"
        type = list(string)
        default = ["sg-0b66f459347721e72"]
}

variable tcia_web_names {
        description = "tag for ec2"
        type = list(string)
        default = ["tcia-webserver-1","tcia-webserver-2","tcia-webserver-3"]
}