# k8slove2020

# date may 20 docker and k8s EXAM
# Task 1
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
docker build -t mkmahto7/webapp .
~~~
# push image to dockerhub

~~~
docker login -u mkmahto7
docker push mkmahto7/webapp
~~~

# Task 2:create POD File

~~~
vim mypodwithenv.yml
~~~

~~~
apiVersion: v1
kind: Pod
metadata:
 name: mukeshpodenv1
 labels:
  adhoc: mukeshenv

spec:
 containers:
  - name: mukeshcc111
    image: mkmahto7/webapp:latest
    ports:
     - containerPort: 80
    env:   
     - name: color 
       value: yellow  

~~~

# creating POD 


~~~
 kubectl apply -f mypodwithenv.yml
~~~

# to get details of pod creation
~~~
kubectl get pods
~~~
# TASK 4
# Replica Set
creating replica sets

~~~

apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: adhocmkmahto4
  labels:
    app: adhocmkmahto4
spec:
  replicas: 1
  selector:
    matchLabels:
      adhoc: mkmahtoq4 
  template:
    metadata:
      name: adhocpod4
      labels:
        adhoc: mkmahtoq4
    spec:
      containers:
      - env:
        - name: x
          value: app2
        image: mkmahto7/webapp
        imagePullPolicy: Always
        name: adhocpod4
        ports:
        - containerPort: 80

~~~
~~~
kubectl apply -f mukeshrs.yml ~~~

