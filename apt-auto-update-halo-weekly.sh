#! /bin/bash
#Debian/Ubuntu Linux
# Create Halo auto update

# Create /etc/cron.weekly/update_halo
sudo touch /etc/cron.weekly/update_halo


sudo cat <<EOT > /etc/cron.weekly/update_halo
#!/bin/bash
/usr/bin/apt-get update > /dev/null
/usr/bin/apt-get -y install cphalo > /dev/null
EOT

# Change file permissions to execute
sudo chmod 755 /etc/cron.weekly/update_halo
sudo chown root /etc/cron.weekly/update_halo
sudo chgrp root /etc/cron.weekly/update_halo
