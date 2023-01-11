#!/bin/bash


# Create new netplan file
touch /etc/netplan/01-net-static.yaml

# Changes dhcp from 'yes' to 'no'
sed -i "s/dhcp4: true/dhcp4: false/g" /etc/netplan/50-cloud-init.yaml


# Ask for input on network configuration
read -p "Enter the static IP of the server notation: " staticip 
read -p "Enter the IP of your gateway: " gatewayip
read -p "Enter the IP of preferred nameservers (seperated by a coma if more than one): " nameserversip
echo
cat > /etc/netplan/01-net-static.yaml <<EOF
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      addresses:
        - $staticip/24
      nameservers:
        search: []
        addresses: [$nameserversip]
      routes:
        - to: default
          via: $gatewayip
EOF
sudo netplan generate
echo "netplan generated"
sudo netplan apply
echo "netplan applied"