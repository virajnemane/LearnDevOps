#
# In this exercise we will create Master Slave architecture in Jenkins.
#
1) Create Master server from jenkins-master-userdata.sh ---> we will call it as MASTER server
2) Create ec2 instance with generic-userdata.sh --- > we will call it as SLAVE server
3) Login on SLAVE server with admin user then switch to root user
4) create jenkins user, keep password jenkins
    adduser jenkins
    passwd jenkins
5) create below required directories and change ownership to jenkins user.
    mkdir /local/apps/jenkins
    chown jenkins:jenkins /local/apps/jenkins/ -R
6) install java and git by yum command
    yum install java git -y
7) switch to jenkins user 
8) generate ssh key
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
    cd ~/.ssh
9) copy private key into authorized_keys for keyless authentication from master to slave.
    cat id_rsa.pub > authorized_keys
    chmod 700 authorized_keys
11) Go to MASTER jenkins Dashboard --> Manage Jenkins --> Manage Credentials --> Jenkins --> Global Credentials --> Add Credentials
    Kind - SSH Username with private key
    Scope - Global
    ID - LOWERENV-SLAVE
    Description - authentication for slave server of lower environment
    Username - jenkins
    Private Key - Select "Enter directly" radio button --> Add --> paste containt of /home/jenkins/.ssh/id_rsa from SLAVE server.
    Click on OK
10) Go to jenkins Dashboard --> Manage Jenkins --> System Configuration --> Manage Nodes and Clouds
11) Click on "New Node" --> give node name "LOWERENV-SLAVE" --> select "Permanent Agent" --> OK
    "Description" = "Slave node for lower environment"
    "Remote root directory" = "/local/apps/jenkins"
    "Labels" = "LOWERENV"
    "Launch method" = "Launch agent via SSH"
    "HOST" = <<SLAVE_PRIVATE_IP>>
    "Credentials" = "Jenkins"   (Which you have created in step no.11)
    "Host Key Verification Strategy" = "Non verifying Verification strategy"
    Click on "Save"
12) After some time SLAVE node will be online.
13) To test this SLAVE node, create pipeline using pipeline file.
    Note : You will find just one change --> agent { label 'LOWERENV' }
14) You will find you are triggering build from MASTER jenkins dashboard, but job get executed on SLAVE node.