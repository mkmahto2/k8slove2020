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

