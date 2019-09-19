#!/bin/sh
sudo yum update
java -version
sudo yum install java-1.8.0
#optional 
#sudo /usr/sbin/alternatives --config java
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins
echo "jenkins installed now starting"
sleep 100
sudo service jenkins start
echo -e "Access Jenkins server using the public DNS of your ec2 on port 8080 \n  http://{ec2-public-dns}:8080 \n example : http://3.89.79.74:8080/"
echo "Here you might have to allow port 8080 in your security group settings"
mkdir -p /home/jenkins
sudo su 
cd /var/lib/jenkins/secrets/
cat initialAdminPassword | tee -a >> /home/jenkins/passwordjenkins.txt
cat /home/jenkins/passwordjenkins.txt

#Tips for remembering
echo -e "To start jenkins on a diff port \n Update port number in /etc/sysconfig/jenkins"

echo -e "To fetch initial admin password \n sudo su - \n cd /var/lib/jenkins/secrets/ \n cat initialAdminPassword \n 0bcbbcab7f984af7b4171b55e9201d04 \n To stop Jenkins \n sudo service jenkins stop \n"
