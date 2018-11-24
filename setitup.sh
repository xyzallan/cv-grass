# How to make grass-gis build for CalValUs system (single tar.gz file) for CentOS7.
# build made by user

srcDir=`pwd`/src
bldDir=`pwd`/build
oldPath=$PATH
export PATH=$PATH:${bldDir}/bin

if [ -f "${bldDir}" ]; then
   rm -rf ${bldDir}
fi

if [ -f "${srcDir}" ]; then
   rm -rf ${srcDir}
fi

mkdir -p ${srcDir}

#===============================================================================
cd ${srcDir}
projVer="4.8.0"
wget -O proj-${projVer}.tar.gz http://download.osgeo.org/proj/proj-${projVer}.tar.gz
tar -xf proj-${projVer}.tar.gz
cd proj-${projVer}
./configure --prefix=${bldDir}
make 
make install

#===============================================================================
cd ${srcDir}
gdalVer="2.3.2"

wget -O gdal-${gdalVer}.tar.gz http://download.osgeo.org/gdal/2.3.2/gdal-${gdalVer}.tar.gz 
tar -xf gdal-${gdalVer}.tar.gz
cd gdal-${gdalVer}
./configure --prefix=${bldDir}
make
make install

#===============================================================================
cd ${srcDir}
tiffVer="4.0.10"

wget -O tiff-${tiffVer}.tar.gz https://download.osgeo.org/libtiff/tiff-${tiffVer}.tar.gz
tar -xf tiff-${tiffVer}.tar.gz
cd tiff-${tiffVer}
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
m4Ver="1.4.17"
wget -O m4-${m4Ver}.tar.gz http://ftp.gnu.org/gnu/m4/m4-${m4Ver}.tar.gz
tar -xf m4-${m4Ver}.tar.gz
cd m4-${m4Ver}
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
flexVer="2.6.4"
wget -O flex-${flexVer}.tar.gz https://github.com/westes/flex/releases/download/v${flexVer}/flex-${flexVer}.tar.gz
tar -xf flex-${flexVer}.tar.gz
cd flex-${flexVer}
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
geosVer="3.4.3"
wget -O geos-${flexVer}.tar.bz2 http://download.osgeo.org/geos/geos-3.4.3.tar.bz2

#================================================================================
cd ${srcDir}
zlibVer="1.2.11"
wget -O zlib-${zlibVer}.tar.gz https://zlib.net/zlib-${zlibVer}.tar.gz
tar -xf zlib-${zlibVer}.tar.gz
cd zlib-${zlibVer}
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
pythVer="2.7.15"
wget -O Python-${pythVer}.tgz https://www.python.org/ftp/python/${pythVer}/Python-${pythVer}.tgz
tar -xf Python-${pythVer}.tgz
cd Python-${pythVer}
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
grasVer="7.4.2"
wget -O grass-${grasVer}.tar.gz https://grass.osgeo.org/grass74/source/grass-${grasVer}.tar.gz
tar -xf grass-${grasVer}.tar.gz
cd grass-${grasVer}
./configure \
 --prefix=${bldDir} \
 --without-ffmpeg \
 --without-mysql \
 --without-postgres \
 --without-odbc \
 --with-geos \
 --with-netcdf \
 --without-fftw
 
# --with-cxx \
# --enable-largefile \
# --with-proj --with-proj-share=/usr/share/proj \
# --with-gdal=/usr/bin/gdal-config \
# --with-sqlite \
# --with-python \
# --with-cairo --with-cairo-ldflags=-lfontconfig \
# --with-freetype --with-freetype-includes=/usr/include/freetype2 \
# --with-wxwidgets=/usr/bin/wx-config \
# --with-openmp \
# --with-blas --with-blas-includes=/usr/include/atlas-x86_64-base/ \
# --with-lapack --with-lapack-includes=/usr/include/atlas-x86_64-base/ \
# --with-fftw \
# --with-geos \
# --with-netcdf \

make
make install
cd ${srcDir}
export PATH=$oldPath
