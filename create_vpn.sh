#!/bin/sh

echo "Creating VPN"

rm ~/.aws/config
echo "[default]" >> ~/.aws/config
echo $1 >> ~/.aws/config

if [[ -n $1 ]]; then

  sed -i 's/_enter_email_address_/'$2'/g' foehammer-vpn/main.tf

fi

cd foehammer-vpn
terraform init -input=false
terraform apply -input=false -auto-approve

echo "Create complete"
