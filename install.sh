#!/bin/bash
## Taufique Noorani ##
## 12/11/2019 ##
## Install bots from scratch. ##

frank() {
  HOST=10.88.10.202
  FILE_PATH=/root/cc-frank/.env
  FILE_NAME=/etc/systemd/system/frank.service
  # Update packages
  yum update -y
  # Get python rpm
  yum install -y https://centos7.iuscommunity.org/ius-release.rpm
  # Install packages to run services
  yum install -y python36u python36u-libs python36u-devel python36u-pip && yum install -y which gcc && yum install -y openldap-devel && yum install -y git && yum install -y rsync
  # Clone github frank repo
  cd /root/ && git clone https://github.com/Tier3/cc-frank.git
  # Copy .env from the prod server if exists
  ssh -q $HOST [[ -f $FILE_PATH ]] && rsync -av root@$HOST:$FILE_PATH /root/cc-frank/ || echo ".env NOT FOUND. Create file manually inside repo directory and run systemctl restart frank. Continuing in 10 seconds" || true;
  sleep 10
  # Install python packages
  pip3.6 install -r /root/cc-frank/requirements.txt
  # Create frank service
  touch $FILE_NAME
  cat >> $FILE_NAME <<EOF
  [Unit]
  Description=Frank Bot
  After=network.target
  [Service]
  Type=simple
  Restart=always
  RestartSec=1
  User=root
  ExecStart=/usr/bin/python3.6 /root/cc-frank/mib.py

  [Install]
  WantedBy=multi-user.target
EOF
  # Reload daemon
  systemctl daemon-reload
  # Start the service
  systemctl start frank
}

alice() {
  HOST=10.88.10.202
  FILE_PATH=/root/cc-alice/.env
  FILE_NAME=/etc/systemd/system/alice.service
  # Update packages
  yum update -y
  # Get python rpm
  yum install -y https://centos7.iuscommunity.org/ius-release.rpm
  # Install packages to run services
  yum install -y python36u python36u-libs python36u-devel python36u-pip && yum install -y which gcc && yum install -y openldap-devel && yum install -y git && yum install -y rsync
  # Clone github alice repo
  cd /root/ && git clone https://github.com/Tier3/cc-alice.git
  # Copy .env from the prod server if exists
  ssh -q $HOST [[ -f $FILE_PATH ]] && rsync -av root@$HOST:$FILE_PATH /root/cc-alice/ || echo ".env NOT FOUND. Create file manually inside repo directory and run systemctl restart alice. Continuing in 10 seconds" || true;
  sleep 10
  # Install python packages
  pip3.6 install -r /root/cc-alice/requirements.txt
  # Create frank service
  touch $FILE_NAME
  cat >> $FILE_NAME <<EOF
  [Unit]
  Description=Alice Bot
  After=network.target
  [Service]
  Type=simple
  Restart=always
  RestartSec=1
  User=root
  ExecStart=/usr/bin/python3.6 /root/cc-alice/alice.py

  [Install]
  WantedBy=multi-user.target
EOF
  # Reload daemon
  systemctl daemon-reload
  # Start the service
  systemctl start alice
}

skynet() {
  HOST=10.88.10.205
  FILE_PATH=/root/cc-skynet/.env
  FILE_NAME=/etc/systemd/system/skynet.service
  # Update packages
  yum update -y
  # Get python rpm
  yum install -y https://centos7.iuscommunity.org/ius-release.rpm
  # Install packages to run services
  yum install -y python36u python36u-libs python36u-devel python36u-pip && yum install -y which gcc && yum install -y openldap-devel && yum install -y git && yum install -y rsync
  # Clone github skynet repo
  cd /root/ && git clone https://github.com/Tier3/cc-skynet.git
  # Copy .env from the prod server if exists
  ssh -q $HOST [[ -f $FILE_PATH ]] && rsync -av root@$HOST:$FILE_PATH /root/cc-skynet/ || echo ".env NOT FOUND. Create file manually inside repo directory and run systemctl restart skynet. Continuing in 10 seconds" || true;
  sleep 10
  # Install python packages
  pip3.6 install -r /root/cc-skynet/requirements.txt
  # Create frank service
  touch $FILE_NAME
  cat >> $FILE_NAME <<EOF
  [Unit]
  Description=Skynet Bot
  After=network.target
  [Service]
  Type=simple
  Restart=always
  RestartSec=1
  User=root
  ExecStart=/usr/bin/python3.6 /root/cc-skynet/skynet.py

  [Install]
  WantedBy=multi-user.target
EOF
  # Reload daemon
  systemctl daemon-reload
  # Start the service
  systemctl start skynet
}

PS3='Please select bot to install: '
options=("Frank" "Alice" "Skynet" "Exit")
select opt in "${options[@]}"
do
    case $opt in
        "Frank")
            echo "Installing Frank Bot"
            frank
            ;;
        "Alice")
            echo "Installing Alice Bot"
            alice
            ;;
        "Skynet")
            echo "Installing Skynet Bot"
            skynet
            ;;
        "Exit")
            break
            ;;
        *) echo "Invalid Option!";;
    esac
done

