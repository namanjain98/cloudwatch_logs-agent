#!/bin/bash
yum install awslogs -y
yum install httpd -y
service httpd start
chkconfig httpd on
echo "This is naman jain"> /var/www/html/index.html
cd /var/log/httpd/
cd /etc/awslogs
cat <<EOF > /etc/awslogs/awscli.conf
[plugins]
cwlogs=cwlogs
[default]
region=ap-south-1
EOF

cat <<EOF >> /etc/awslogs/awslogs.conf
[/var/log/httpd/access_log]
datetime_format = %b %d %H:%M:%S
file=/var/log/httpd/access_log
buffer_duration=5000
log_stream_name=myApacheServer-{instance_id}
initial_position=start_of_file
log_group_name=/var/log/httpd/access_log

[/var/log/httpd/error_log]
datetime_format = %b %d %H:%M:%S
file=/var/log/httpd/error_log
buffer_duration=5000
log_stream_name=myApacheServer-{instance_id}
initial_position=start_of_file
log_group_name=/var/log/httpd/error_log
EOF

service awslogs start