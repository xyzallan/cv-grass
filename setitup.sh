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
srcPath=$(ls -1 | grep proj | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make 
make install
make check

exit 1

#===============================================================================
cd ${srcDir}
gdalVer="2.3.2"
wget -O gdal-${gdalVer}.tar.gz http://download.osgeo.org/gdal/2.3.2/gdal-${gdalVer}.tar.gz 
tar -xf gdal-${gdalVer}.tar.gz
srcPath=$(ls -1 | grep gdal | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make
make install

#===============================================================================
cd ${srcDir}
tiffVer="4.0.10"
wget -O tiff-${tiffVer}.tar.gz https://download.osgeo.org/libtiff/tiff-${tiffVer}.tar.gz
tar -xf tiff-${tiffVer}.tar.gz
srcPath=$(ls -1 | grep tiff | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
m4Ver="1.4.17"
wget -O m4-${m4Ver}.tar.gz http://ftp.gnu.org/gnu/m4/m4-${m4Ver}.tar.gz
tar -xf m4-${m4Ver}.tar.gz
srcPath=$(ls -1 | grep m4 | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
flexVer="2.6.4"
wget -O flex-${flexVer}.tar.gz https://github.com/westes/flex/releases/download/v${flexVer}/flex-${flexVer}.tar.gz
tar -xf flex-${flexVer}.tar.gz
srcPath=$(ls -1 | grep flex | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
geosVer="3.4.3"
wget -O geos-${geosVer}.tar.bz2 http://download.osgeo.org/geos/geos-${geosVer}.tar.bz2
tar -jxf geos-${geosVer}.tar.gz
srcPath=$(ls -1 | grep geos | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
ncdfVer="4.6.2"
wget -O netcdf-${ncdfVer}.tar.gz ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-4.6.2.tar.gz
tar -xf netcdf-${ncdfVer}.tar.gz
srcPath=$(ls -1 | grep netcdf | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir} \
  --disable-dap \
  --disable-netcdf-4
make
make install

exit 1

#================================================================================
cd ${srcDir}
zlibVer="1.2.11"
wget -O zlib-${zlibVer}.tar.gz https://zlib.net/zlib-${zlibVer}.tar.gz
tar -xf zlib-${zlibVer}.tar.gz
srcPath=$(ls -1 | grep zlib | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
pythVer="2.7.15"
wget -O Python-${pythVer}.tgz https://www.python.org/ftp/python/${pythVer}/Python-${pythVer}.tgz
tar -xf Python-${pythVer}.tgz
srcPath=$(ls -1 | grep Python | grep -v "tar.gz")
cd $srcPath
./configure --prefix=${bldDir}
make
make install

#================================================================================
cd ${srcDir}
grasVer="7.4.2"
wget -O grass-${grasVer}.tar.gz https://grass.osgeo.org/grass74/source/grass-${grasVer}.tar.gz
tar -xf grass-${grasVer}.tar.gz
srcPath=$(ls -1 | grep grass | grep -v "tar.gz")
cd $srcPath
./configure \
 --prefix=${bldDir} \
 --with-geos \
 --with-netcdf 
 
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
