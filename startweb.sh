#!/bin/bash

if [  "$x"  == "app1"   ]
then
    cp  /myapps/app1.html  /var/www/html/index.html
    
    httpd  -DFOREGROUND 

elif   [   "$x"  ==    "app2"    ]
then
    cp  /myapps/app2.html  /var/www/html/index.html
    
    httpd  -DFOREGROUND 

else 
	echo  "Page Not FOund please contact to Admin"  >/var/www/html/index.html
	httpd  -DFOREGROUND 

fi 
