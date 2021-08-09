#!/bin/bash

#Enable login with password
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.org
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd restart

#Install git and java
yum install git java -y

#Install jdk
#cd /tmp
#wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm
#rpm -ivh jdk-8u141-linux-x64.rpm

#Create Jenkins user
pass=$(perl -e 'print crypt($ARGV[0], "password")' jenkins)
useradd -m -p "$pass" "jenkins"

#Generate key for jenkins user
mkdir /home/jenkins/.ssh
chmod 700 /home/jenkins/.ssh
ssh-keygen -t rsa -f /home/jenkins/.ssh/id_rsa -P ''
chown jenkins:jenkins /home/jenkins/.ssh/ -R

#Give sudo access
cp /etc/sudoers /etc/sudoers.org
echo "jenkins    ALL=(ALL)       NOPASSWD:ALL" >> /etc/sudoers

#Setup Jenkins
mkdir /local/apps/jenkins /local/apps/jenkins/tools /local/apps/jenkins/bin /local/apps/jenkins/logs /local/apps/jenkins/home -p
cd /local/apps/jenkins
JENKINS_VER=`curl --silent https://get.jenkins.io/war-stable/ |grep -a1 'href="latest' |tail -n1 |awk '{split($2,c,">"); print c[2]}' |sed "s/\/<\/a//g"`
wget https://get.jenkins.io/war-stable/${JENKINS_VER}/jenkins.war

#Creating start/stop script
cd bin
cat <<EOF > start_jenkins.sh
#!/bin/bash
ROOT_DIR=/local/apps/jenkins
JENKINS_HOME=/local/apps/jenkins/home
JENKINS_URL=/local/apps/jenkins

for i in \$ROOT_DIR \$JENKINS_HOME \$ROOT_DIR/logs
do
  if [ ! -d  \$i ]
  then
    mkdir \$i
  fi
done

#If you are using port other than 8080
#HTTP_PORT=9090
#JENKINS_ARGS="--prefix=/jenkins --httpPort=\$HTTP_PORT"

export JENKINS_HOME JENKINS_ARGS JENKINS_URL
mv \$ROOT_DIR/logs/jenkins.log \$ROOT_DIR/logs/jenkins_` date +%d-%m-%Y_%H-%M`.log
nohup java -jar /local/apps/jenkins/jenkins.war  > \$ROOT_DIR/logs/jenkins.log &
EOF

cat <<EOF > stop_jenkins.sh
#!/bin/bash
ps aux |grep jenkins.war |head -n1 |awk '{print \$2}'|xargs kill -9
EOF

#setting proper permission and ownership
chmod 755 /local/apps/jenkins/bin/*
chown jenkins:jenkins /local/apps/jenkins -R

#setting env for jenkins user
echo "cd /local/apps/jenkins" >> /home/jenkins/.bash_profile
echo "export PATH=/local/apps/jenkins/bin:$PATH" >> /home/jenkins/.bash_profile

#Install maven
#cd /tmp
#wget https://mirrors.estointernet.in/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip
#unzip apache-maven-3.6.3-bin.zip
#mkdir /local/apps/jenkins/tools
#mkdir /local/apps/jenkins/tools/maven -p
#cd apache-maven-3.6.3
#mv * /local/apps/jenkins/tools/maven