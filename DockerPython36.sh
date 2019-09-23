#docker commands
#docker pull ubuntu:18.04
#docker run -it -d ubuntu:18.04
#docker exec -it ContainerId sh
#run the commands in the sh shell ( by default root so no need for sudo)

#!/bin/sh
echo "running commands"

#may need this
apt-get install software-properties-common
#now start

add-apt-repository ppa:jonathonf/python-3.6
apt update -y && apt upgrade -y
apt install -y python3.6
apt install -y python3-django
apt install -y python3-pip
apt install -y python3.6 libmysqlclient-dev
pip freeze > requirementss.txt

#below are optional

#pip install -r requirementss.txt
#django-admin startproject myproject
#python manage.py startapp myapp
#python manage.py makemigrations
#python manage.py migrate
#python manage.py runserver
