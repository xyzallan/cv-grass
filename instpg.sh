pgnimi=$(apt-cache search postgresql | grep -e "postgresql-[0-9][0-9]-postgis-[0-9].[0-9] " | awk '{print $1}')
apt-get -y install $pgnimi pgadmin3
