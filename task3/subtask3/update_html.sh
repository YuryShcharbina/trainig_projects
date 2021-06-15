#!/bin/sh

text="DEVOPS=`echo $DEVOPS`"


cat > /var/www/html/index.html << EOF
<!DOCTYPE html>
<html>
    <head>
    	<title>Test web page</title>
    </head>
<body>
	<h2>Hello world</h2>
	<p>$text</p>
</body>
</html>
EOF

/usr/sbin/apache2ctl -D FOREGROUND
