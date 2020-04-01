# cc-install-bot
Bot Installer Script

# Requirements
CentOS 7

# About
This script will ask user to install skynet, frank or alice after running install.sh. Once user picks the option, script
will install that bot accordingly.

# Usage
You have to run "chmod +x install.sh" before running the script.
IF .env file does NOT exists. Create .env file manually locally and run systemctl restart <bot>
```
#####################################################################
## ALICE ##
#####################################################################
#ALICE_AZ_CORE_NAMESPACE=''
#ALICE_AZ_CORE_KEYNAME=''
#ALICE_AZ_CORE_KEYVALUE='='
#ALICE_AZ_CORE_ENDPOINT=''
#ALICE_ZD_CORE_USERNAME=''
#ALICE_ZD_CORE_PASSWORD=''
#ALICE_ZDV_CORE_USERNAME=''
#ALICE_ZDV_CORE_TOKEN=''
#ALICE_JUNIPER_USERNAME=''
#ALICE_JUNIPER_PASSWORD=''
#ALICE_CTRLUSER=''
#ALICE_CTRLPASS=''
#ALICE_VPXUSER=''
#ALICE_VPXPASS=''
#ES_BASE_CONNECTION=''
#CLC_ES_USER=''
#CLC_ES_PASSWORD=''
#####################################################################
## FRANK ##
#####################################################################
#FRANK_ZD_CORE_USERNAME=''
#FRANK_ZD_CORE_PASSWORD=''
#FRANK_ZD_CORE_SUBDOMAIN=''
#FRANK_AZ_CORE_NAMESPACE=''
#FRANK_AZ_CORE_KEYNAME=''
#FRANK_AZ_CORE_KEYVALUE=''
#FRANK_AZ_CORE_ENDPOINT=''
#####################################################################
## SKYNET ##
#####################################################################
#SKYNET_ZD_CORE_USERNAME=''
#SKYNET_ZD_CORE_PASSWORD=""
#SKYNET_ZD_CORE_SUBDOMAIN=''
#SKYNET_AZ_CORE_NAMESPACE=''
#SKYNET_AZ_CORE_KEYNAME=''
#SKYNET_AZ_CORE_KEYVALUE=''
#SKYNET_AZ_CORE_ENDPOINT=''
#IM_CHANNEL_ID=''
```
