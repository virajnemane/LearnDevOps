#!/bin/bash
#Enable login with password
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.org
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
service sshd restart

#Create Jenkins user
pass=$(perl -e 'print crypt($ARGV[0], "password")' bform)
useradd -m -p "$pass" "bform"

#Generate key for jenkins user
mkdir /home/bform/.ssh
chmod 700 /home/bform/.ssh
ssh-keygen -t rsa -f /home/bform/.ssh/id_rsa -P ''
chown bform /home/bform/.ssh/ -R

#Give sudo access
cp /etc/sudoers /etc/sudoers.org
echo "jenkins    ALL=(ALL)       NOPASSWD:ALL" >> /etc/sudoers

#Install jdk
cd /tmp
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u141-b15/336fa29ff2bb4ef291e347e091f7f4a7/jdk-8u141-linux-x64.rpm
rpm -ivh jdk-8u141-linux-x64.rpm

#install tomcat
TOMCAT_VER=`curl --silent http://mirror.vorboss.net/apache/tomcat/tomcat-8/ | grep v8 | awk '{split($5,c,">v") ; split(c[2],d,"/") ; print d[1]}'`
wget -N http://mirror.vorboss.net/apache/tomcat/tomcat-8/v${TOMCAT_VER}/bin/apache-tomcat-${TOMCAT_VER}.zip
unzip apache-tomcat-${TOMCAT_VER}.zip
cd /tmp/apache-tomcat-${TOMCAT_VER}
mkdir /local/apps/bform/tomcat /local/apps/bform/bin -p
mv * /local/apps/bform/tomcat
chmod 755 /local/apps/bform/tomcat/bin/*

#Create start and stop script
cat <<EOF > /local/apps/bform/bin/start_tomcat.sh
JAVA_HOME=/usr/java/jdk1.8.0_141
CATALINA_PID=/local/apps/bform/tomcat/pid
PATH=$JAVA_HOME/bin:$PATH
/local/apps/bform/tomcat/bin/startup.sh
EOF
cat <<EOF > /local/apps/bform/bin/stop_tomcat.sh
#!/bin/bash
kill -9 `cat /local/apps/bform/tomcat/pid`
EOF

#give execute permission to start/stop script
chmod 755 /local/apps/bform/bin/start_tomcat.sh /local/apps/bform/bin/stop_tomcat.sh
chown bform:bform /local/apps/bform -R