# set up by root
yum -y install wget
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum -y install gcc gcc-c++
yum -y install byacc
yum -y install proj-devel
yum -y install geos-devel
yum -y install zlib-devel

rm -f *.rpm
