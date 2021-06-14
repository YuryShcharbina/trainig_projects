#!/bin/bash

sudo apt-get -y install apache2

status=`sudo systemctl is-enabled apache2`
if [ $status != "enabled" ]
then
	sudo systemctl enable apache2
fi

sudo ps cax | grep apache2 &>/dev/null
if [ $? -ne 0 ]
then
	sudo systemctl start apache2
fi

text=`lsb_release -d | awk '{print $2,$3,$4}'`

cat > index.html << EOF
<!DOCTYPE html>
<html>
<head>
  <title>Test Web Server</title>
</head>
  <body>
   <h3>Hello World</h3>
   <p>OS version: $text</p>
  </body>
</html>
EOF

sudo mv index.html /var/www/html

