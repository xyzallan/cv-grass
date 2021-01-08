rm -rf targz
mkdir targz

projVer="7.2.1"
wget -O targz/proj-${projVer}.tar.gz http://download.osgeo.org/proj/proj-${projVer}.tar.gz

gdalVer="3.2.1"
wget -O targz/gdal-${gdalVer}.tar.gz http://download.osgeo.org/gdal/${gdalVer}/gdal-${gdalVer}.tar.gz 

sqliteVer="autoconf-3340000"
wget -O targz/sqlite-${sqliteVer}.tar.gz https://www.sqlite.org/2020/sqlite-${sqliteVer}.tar.gz

tiffVer="4.2.0"
wget -O targz/tiff-${tiffVer}.tar.gz https://download.osgeo.org/libtiff/tiff-${tiffVer}.tar.gz

m4Ver="1.4.18"
wget -O targz/m4-${m4Ver}.tar.gz http://ftp.gnu.org/gnu/m4/m4-${m4Ver}.tar.gz

flexVer="2.6.4"
wget -O targz/flex-${flexVer}.tar.gz https://github.com/westes/flex/releases/download/v${flexVer}/flex-${flexVer}.tar.gz

geosVer="3.9.0"
wget -O targz/geos-${geosVer}.tar.bz2 http://download.osgeo.org/geos/geos-${geosVer}.tar.bz2

zlibVer="1.2.11"
wget -O targz/zlib-${zlibVer}.tar.gz https://zlib.net/zlib-${zlibVer}.tar.gz

wget -O targz/openjpeg-2.4.0.tar.gz https://github.com/uclouvain/openjpeg/archive/v2.4.0.tar.gz
