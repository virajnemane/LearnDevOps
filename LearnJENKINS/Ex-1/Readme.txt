#
# In this exercise we will see how to install jenkins manually.
#
# Jenkins run on 8080 port, so be sure that port is open in security group.
#
1) spin ec2 instance of Amazon Linux 2 AMI and use generic-userdata.sh
2) login with admin user, password is admin
3) switch to root user by doing sudo su -
4) create jenkins user, keep password jenkins
5) create below required directories and change ownership to jenkins user.
    /local/apps/jenkins 
    /local/apps/jenkins/bin 
    /local/apps/jenkins/logs 
    /local/apps/jenkins/home
6) install java and git by yum command
7) switch to jenkins user
8) download latest war file from https://www.jenkins.io/download/ at /local/apps/jenkins
9) create startup script for jenkins at /local/apps/jenkins/bin/start_jenkins.sh
10) give executable permission and run it.
11) Open browser and open http://<public_ip_of_jenkins>:8080
12) provide admin password
13) select suggested plugin installation
14) provide details
15) continue
16) save and finish
17) You should able to land to Jenkins dashboard.

command history 
==============
root user
-----------
adduser jenkins
passwd jenkins
mkdir /local/apps/jenkins /local/apps/jenkins/bin /local/apps/jenkins/logs /local/apps/jenkins/home -p
chown jenkins:jenkins /local/apps/jenkins/ -R
yum install java -y
su - jenkins

jenkins user
-------------
cd /local/apps/jenkins/
wget http://mirrors.jenkins.io/war-stable/latest/jenkins.war
cd bin
vim start_jenkins.sh
    #!/bin/bash
    JENKINS_HOME=/local/apps/jenkins/home
    nohup java -jar /local/apps/jenkins/jenkins.war  > /local/apps/jenkins/logs/jenkins.log &
chmod 755 start_jenkins.sh
./start_jenkins.sh