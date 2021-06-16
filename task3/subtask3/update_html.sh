#!/bin/sh

text="DEVOPS=`echo $DEVOPS`"
date=`date +"%Y-%M-%d %H:%M:%S"`

cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
    <head>
    	<title>Test web page</title>
    </head>
<body>
	<h2>Hello world</h2>
  <h1>Update repo: $date</h1>
	<p>$text</p>
</body>
</html>
EOF

/usr/sbin/apache2ctl -D FOREGROUND
