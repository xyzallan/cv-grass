# set up by root
yum -y install wget
#wget -O /etc/yum.repos.d/grass74.repo https://copr.fedoraproject.org/coprs/neteler/grass74/repo/epel-7/neteler-grass74-epel-7.repo
#yum -y update
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum -y install gcc gcc-c++
yum -y install byacc
yum -y install yum-utils
#yum -y install proj-devel
#yum -y install geos-devel
#yum -y install zlib-devel

rm -f *.rpm

