#
# This exercise will cover how to take backup of any Jenkins job and how to restore it.
#
1) Downloading the client
The CLI client can be downloaded directly from a Jenkins master at the URL /jnlpJars/jenkins-cli.jar, in effect JENKINS_URL/jnlpJars/jenkins-cli.jar
i.e.
wget http://localhost:8080/jnlpJars/jenkins-cli.jar

2) Export job
without auth - java -jar jenkins-cli.jar -s http://server get-job myjob > myjob.xml
with auth - java -jar jenkins-cli.jar   -s http://3.135.187.255:8080/ -auth nilesh:nilesh -webSocket get-job RD-Pipeline > config.xml

3) login to another jenkins server, and Import job
without auth - java -jar jenkins-cli.jar -s http://server create-job newmyjob < myjob.xml
with auth - java -jar jenkins-cli.jar   -s http://3.135.187.255:8080/ -auth nilesh:nilesh -webSocket create-job TestWebApp < config.xml