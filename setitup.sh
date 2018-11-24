

curDir=`pwd`/src
bldDir=`pwd`/build
rm -rf ${bldDir}
cd ${curDir}

rm -rf *
#===============================================================================
projVer="4.8.0"
wget -O proj-${projVer}.tar.gz http://download.osgeo.org/proj/proj-${projVer}.tar.gz
tar -xf proj-${projVer}.tar.gz
cd proj-${projVer}
./configure --prefix=${bldDir}
make 
make install
cd ${curDir}
#===============================================================================
wget -O gdal-2.3.2.tar.gz http://download.osgeo.org/gdal/2.3.2/gdal-2.3.2.tar.gz 
tar -xf gdal-2.3.2.tar.gz
cd gdal-2.3.2
./configure --prefix=${bldDir}
make
make install
cd ${curDir}


wget -O tiff-4.0.10.tar.gz https://download.osgeo.org/libtiff/tiff-4.0.10.tar.gz
tar -xf tiff-4.0.10.tar.gz
cd tiff-4.0.10
./configure --prefix=${bldDir}
make
make install
cd ${curDir}


#================================================================================
wget -O m4-latest.tar.gz http://ftp.gnu.org/gnu/m4/m4-latest.tar.gz
tar -xf m4-latest.tar.gz
cd m4-1.4.17
./configure --prefix=${bldDir}
make
make install
cd ${curDir}

#================================================================================
wget -O flex-2.6.4.tar.gz https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz
tar -xf flex-2.6.4.tar.gz
cd flex-2.6.4
./configure --prefix=${bldDir}
make
make install
cd ${curDir}

#================================================================================
wget -O zlib-1.2.11.tar.gz https://zlib.net/zlib-1.2.11.tar.gz
tar -xf zlib-1.2.11.tar.gz
cd zlib-1.2.11
./configure --prefix=${bldDir}
make
make install

#================================================================================
wget -O Python-2.7.15.tgz https://www.python.org/ftp/python/2.7.15/Python-2.7.15.tgz
tar -xf Python-2.7.15.tgz
cd Python-2.7.15
./configure --prefix=${bldDir}
make
make install
cd ${curDir}

#================================================================================
wget -O grass-7.4.2.tar.gz https://grass.osgeo.org/grass74/source/grass-7.4.2.tar.gz
tar -xf grass-7.4.2.tar.gz
cd grass-7.4.2
./configure \
 --prefix=${bldDir} \
 --with-zlib-includes=${bldDir}/include/ \
 --without-ffmpeg \
 --without-mysql \
 --without-postgres \
 --without-odbc \
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
 --without-ffmpeg \
 --without-mysql \
 --without-postgres \
 --without-odbc \
 --without-fftw



make
make install
cd ${curDir}

