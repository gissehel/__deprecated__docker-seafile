export DEBIAN_FRONTEND=noninteractive
apt-get -y update
apt-get install -y ca-certificates nginx python2.7 python-flup python-imaging python-setuptools sqlite3
apt-get install -y -q --force-yes ssl-cert wget

rm -rf /var/lib/apt/lists/*
rm -f /var/log/dpkg.log
rm -rf /var/log/apt
rm -rf /var/cache/apt

mkdir -p /etc/service/seafile
mkdir -p /etc/service/seahub
mkdir -p /etc/service/nginx
mkdir -p /opt/seafile 
mkdir -p /opt/image

adduser --disabled-password --gecos "" seafile

chown seafile:seafile /opt/seafile
chown seafile:seafile /opt/image

cp /tmp/files/seafile.start /etc/service/seafile/run
cp /tmp/files/seahub.start /opt/image

cp /tmp/files/service-nginx.sh /etc/service/nginx/run
cp /tmp/files/seafile-nginx.conf /etc/nginx/sites-available/seafile

ln -s /etc/nginx/sites-available/seafile /etc/nginx/sites-enabled/seafile

cp /tmp/files/init_data.sh /etc/my_init.d/init_data.sh
chmod +x /etc/my_init.d/init_data.sh

cp /tmp/files/init_data_user.sh /opt/image/init_data_user.sh
chmod +x /opt/image/init_data_user.sh

ln -s /etc/my_init.d/init_data.sh /init

rm -rf /tmp/files

