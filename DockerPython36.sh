#how to run 
#First - run below commands for initaiting docker
#second run below command
#wget -O - https://raw.githubusercontent.com/ImmLearning/AWSlinux2EC2/master/DockerPython36.sh | bash

#docker commands
#docker pull ubuntu:18.04
#docker run -it -d ubuntu:18.04
#docker exec -it ContainerId sh
#run the commands in the sh shell ( by default root so no need for sudo)

#!/bin/sh
echo "running commands"

#may need this
apt install -y software-properties-common
#now start

add-apt-repository ppa:jonathonf/python-3.6
apt update -y && apt upgrade -y
apt install -y python3.6
apt install -y python3-django
apt install -y python3-pip

#create virtual env
#pip3 install -y virtualenv
#virtualenv -p python3.6 venv
#apt-get install python3.6-dev libmysqlclient-dev

apt install -y python3.6 libmysqlclient-dev
pip3 freeze > requirementss.txt

#below are optional

#pip3 install -r requirementss.txt
#django-admin startproject myproject
#python manage.py startapp myapp
#python manage.py makemigrations
#python manage.py migrate
#python manage.py runserver

#testing installation
echo -e " \n Checking python Version \n \n"
python3 -V
sleep 100

echo -e " \n Checking python Django Version \n \n"
py -m django --version
#python -m django --version
sleep 100

echo -e " \n Checking pip Version \n \n"
pip --version
#pip -V
sleep 100

#using custom requirement list 
wget https://raw.githubusercontent.com/ImmLearning/AWSlinux2EC2/master/requirements.txt 
echo -e "\n run pip3 install -r requirements.txt \n for more"
