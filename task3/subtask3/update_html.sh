#!/bin/sh

text="DEVOPS=$(printenv DEVOPS)"
date=$(date +"%Y-%m-%d %H:%M:%S")

cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
    <head>
    	<title>Test web page</title>
    </head>
<body>
	<h2>Hello world</h2>
	<h1>Container started: $date</h1>
	<p>Test for jenkins pipeline from github run in docker container</p>
	<p>$text</p>
</body>
</html>
EOF

/usr/sbin/apache2ctl -D FOREGROUND
