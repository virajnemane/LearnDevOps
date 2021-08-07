#
# In this exercise we will deploy java application on tomcat server.
#
1) spin ec2 instance of Amazon Linux 2 AMI and use jenkins-master-userdata.sh
2) spin ec2 instance of Amazon Linux 2 AMI and use tomcat-userdata.sh

Jenkins server
---------------
username - jenkins
password - jenkins

TOMCAT server
--------------
username - bform
password - bform

3) Login on Jenkins Dashboard --> Manage Jenkins --> Manage Plugins --> Available
4) Search "SSH Agent" or "ssh" and select "SSH Agent" plugin and click on "Install without restart"
5) Click on "Manage Plugins" --> Available --> search "Maven" or "maven" and select "Pipeline Maven Integration"
6) Click on "Install without restart"
7) Click on Dashboard --> Manage Jenkins --> Global Tool Configuration --> go to at the end of the page and click on "Add Maven"
8) Type "MyMaven" in "Name"  textbox.
9) Be sure "Install automatically" checkbox should selected.
10) Click on Apply and Save.
11) Login on TOMCAT server with bform user.
12) generate ssh key
    ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
13) copy private key
    cat ~/.ssh/id_rsa   ------> copy contain of this file in notepad
14) create authorized_keys file with having public key contain.
    cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys
15) give proper permission to authorized_keys file
    chmod 600 ~/.ssh/authorized_keys
16) Login on Jenkins Dashboard --> Manage Jenkins --> Manage Credentials --> Jenkins --> Global Credentials --> Add Credentials
17) Fill up proper information
    Kind - SSH Username with private key
    Scope - Global
    ID - bform
    Description - authentication for bform user
    Username - bform
    Private Key - Select "Enter directly" radio button --> Add --> paste private key which you copied in notepad in step 13 in given text box.
    Click on OK
18) Click on Dashboard
19) Click on New Item --> Enter item name as "AppDeploy"
20) Select pipeline option and click on OK
21) Description - "This job will deploy java application on tomcat server."
22) Click on Pipeline section which is at the end.
23) In the Script section copy contain of pipeline file.
24) Click on Apply and Save
25) Click on "Build Now" and let it be complete, it will fail first time.
26) Once build completed, now you will see instead of "Build Now" you will see "Build with Parameters" option, click on it.
27) It will ask IP address of application server, provide IP address of TOMCAT server and click on "Build"




