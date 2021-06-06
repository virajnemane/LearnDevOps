variable region {
        description = "aws region"
        default = "us-east-1"
}

variable ami {
        description = "ami for ec2 instance as per region"
        default = "ami-047a51fa27710816e"
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

variable ec2_name {
        description = "tag for ec2"
        default = ""
}
