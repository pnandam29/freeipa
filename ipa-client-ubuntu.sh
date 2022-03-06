#/bin/bash!

sudo apt-get --assume-yes update
sudo apt---get --assume-yes upgrade

ipaservername=ipa.freeipa.com
serverhost=ipa
serverip=192.168.1.182
domainname=freeipa.com
realmname=FREEIPA.COM
clientname=client.freeipa.com


sudo hostnamectl set-hostname $clientname

sudo apt-get install --assume-yes freeipa-client

#echo sudo vim /etc/hosts adding server details to client hosts file
echo "$serverip $ipaservername $serverhost">> /etc/hosts

ipa-server-install --enable-dns-updates --ntp-serve=$ipaservername --hostname=$ipaservername --realm=$realmname -p secret12 --domain=$domainname --mkhomedir --force-ntpd -U 
