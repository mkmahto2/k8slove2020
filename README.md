# k8slove2020

# date may 20 docker and k8s EXAM
# create Dockerfile
vim Dockerfile
~~~
from centos
maintainer mukesh
run  yum   install  httpd  -y
run  mkdir -p   /mywebapps/app1  /mywebapps/app2
env  x=webapp1
#   x  variable will be  present in docker image
copy webapp1   /mywebapps/app1/
copy webapp2   /mywebapps/app2/
copy  entrypoint.sh  /opt/
expose  80
#  this is web server port number  
ENTRYPOINT  ["/bin/bash","/opt/entrypoint.sh"]

~~~
# make script File startweb.sh
~~~
#!/bin/bash

if [  "$x"  == "app1"   ]
then
    cp  /myapps/ashu.html  /var/www/html/index.html
    cp  /myapps/docker.png  /var/www/html/docker.png
    httpd  -DFOREGROUND 

elif   [   "$x"  ==    "app2"    ]
then
    cp  /myapps/ashu1.html  /var/www/html/index.html
    cp  /myapps/container.png  /var/www/html/container.png
    httpd  -DFOREGROUND 

else 
	echo  "Page Not FOund please contact to Admin"  >/var/www/html/index.html
	httpd  -DFOREGROUND 

fi 

~~~


# docker build command
~~~
docker build -t mkmahto7/webapp
~~~

