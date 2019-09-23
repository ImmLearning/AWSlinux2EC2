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
pip freeze > requirementss.txt

#below are optional

#pip install -r requirementss.txt
#django-admin startproject myproject
#python manage.py startapp myapp
#python manage.py makemigrations
#python manage.py migrate
#python manage.py runserver
