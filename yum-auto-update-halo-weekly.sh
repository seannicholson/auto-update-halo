#! /bin/bash
#RPM Linux (Fedora,RHEL,CentOS,AMI Linux, Oracle)

# Create Halo auto update

# Create /etc/cron.weekly/update_halo
sudo touch /etc/cron.weekly/update_halo


sudo cat <<EOT > /etc/cron.weekly/update_halo
#!/bin/bash
/usr/bin/yum -y update cphalo
EOT

# Change file permissions to execute
sudo chmod 755 /etc/cron.weekly/update_halo
sudo chown root /etc/cron.weekly/update_halo
sudo chgrp root /etc/cron.weekly/update_halo
