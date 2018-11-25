# set up by root
wget http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
rpm -ivh epel-release-latest-7.noarch.rpm
yum install gcc gcc-c++
yum install byacc
yum install proj-devel
yum install geos-devel
yum install zlib-devel

rm -f *.rpm
