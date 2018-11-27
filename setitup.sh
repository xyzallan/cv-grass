# How to make grass-gis build for CalValUs system (single tar.gz file) for CentOS7.
# build made by user
echo "Kas laadin alla?"
read dwnl
echo "Kas installeerin?"
read inst
srcDir=`pwd`/src
bldDir=`pwd`/build
oldPath=$PATH
export PATH=$PATH:${bldDir}/bin:${bldDir}/include

if [ "${inst}" == "J" ]; then
   if [ -d "${bldDir}" ]; then
      rm -rf ${bldDir}
   fi
fi
if [ "${dwnl}" == "J" ]; then
   if [ -d "${srcDir}" ]; then
      rm -rf ${srcDir}
   fi
   mkdir -p ${srcDir}
fi
#===============================================================================
cd ${srcDir}
projVer="4.8.0"
if [ "${dwnl}" == "J" ]; then
   wget -O proj-${projVer}.tar.gz http://download.osgeo.org/proj/proj-${projVer}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf proj-${projVer}.tar.gz
   srcPath=$(ls -1 | grep proj | grep -v "tar.gz")

   cd $srcPath
   ./configure --prefix=${bldDir}
   make 
   make install
   make check || exit 1
fi

#===============================================================================
cd ${srcDir}
gdalVer="2.3.2"
if [ "${dwnl}" == "J" ]; then
   wget -O gdal-${gdalVer}.tar.gz http://download.osgeo.org/gdal/${gdalVer}/gdal-${gdalVer}.tar.gz 
fi
if [ "${inst}" == "J" ]; then
   tar -xf gdal-${gdalVer}.tar.gz
   srcPath=$(ls -1 | grep gdal | grep -v "tar.gz")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install || exit 1
fi
#===============================================================================
cd ${srcDir}
tiffVer="4.0.10"
if [ "${dwnl}" == "J" ]; then
   wget -O tiff-${tiffVer}.tar.gz https://download.osgeo.org/libtiff/tiff-${tiffVer}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf tiff-${tiffVer}.tar.gz
   srcPath=$(ls -1 | grep tiff | grep -v "tar.gz")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install
   make check || exit 1
fi
#================================================================================
cd ${srcDir}
m4Ver="1.4.17"
if [ "${dwnl}" == "J" ]; then
   wget -O m4-${m4Ver}.tar.gz http://ftp.gnu.org/gnu/m4/m4-${m4Ver}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf m4-${m4Ver}.tar.gz
   srcPath=$(ls -1 | grep m4 | grep -v "tar.gz")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install || exit 1
fi

#================================================================================
cd ${srcDir}
flexVer="2.6.4"
if [ "${dwnl}" == "J" ]; then
   wget -O flex-${flexVer}.tar.gz https://github.com/westes/flex/releases/download/v${flexVer}/flex-${flexVer}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf flex-${flexVer}.tar.gz
   srcPath=$(ls -1 | grep flex | grep -v "tar.gz")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install || exit 1
fi
#================================================================================
cd ${srcDir}
geosVer="3.4.3"
if [ "${dwnl}" == "J" ]; then
   wget -O geos-${geosVer}.tar.bz2 http://download.osgeo.org/geos/geos-${geosVer}.tar.bz2
   tar -jxf geos-${geosVer}.tar.bz2
   tar -zcf geos-${geosVer}.tar.gz geos-${geosVer}
   rm -rf geos-${geosVer}/
   rm -rf geos-${geosVer}.tar.bz2
fi
if [ "${inst}" == "J" ]; then
   tar -jxf geos-${geosVer}.tar.bz2
   srcPath=$(ls -1 | grep geos | grep -v "tar.bz2")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install || exit 1
fi
#================================================================================
#cd ${srcDir}
#ncdfVer="4.6.2"
#wget -O netcdf-${ncdfVer}.tar.gz ftp://ftp.unidata.ucar.edu/pub/netcdf/netcdf-c-${ncdfVer}.tar.gz
#tar -xf netcdf-${ncdfVer}.tar.gz
#srcPath=$(ls -1 | grep netcdf | grep -v "tar.gz")
#cd $srcPath
#./configure --prefix=${bldDir} \
#  --disable-dap \
#  --disable-netcdf-4
#make
#make install || exit 1
#================================================================================
cd ${srcDir}
zlibVer="1.2.11"
if [ "${dwnl}" == "J" ]; then
   wget -O zlib-${zlibVer}.tar.gz https://zlib.net/zlib-${zlibVer}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf zlib-${zlibVer}.tar.gz
   srcPath=$(ls -1 | grep zlib | grep -v "tar.gz")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install || exit 1
fi
#================================================================================
cd ${srcDir}
pythVer="2.7.15"
if [ "${dwnl}" == "J" ]; then
   wget -O Python-${pythVer}.tgz https://www.python.org/ftp/python/${pythVer}/Python-${pythVer}.tgz
fi
if [ "${inst}" == "J" ]; then
   tar -xf Python-${pythVer}.tgz
   srcPath=$(ls -1 | grep Python | grep -v "tar.gz")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install || exit 1
fi
#================================================================================
cd ${srcDir}
grasVer="7.4.2"
if [ "${dwnl}" == "J" ]; then
   wget -O grass-${grasVer}.tar.gz https://grass.osgeo.org/grass74/source/grass-${grasVer}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf grass-${grasVer}.tar.gz
   srcPath=$(ls -1 | grep grass | grep -v "tar.gz")
   cd $srcPath
   sed -i 's/with_freetype=yes/with_freetype=no/g' configure
   sed -i 's/with_sqlite=yes/with_sqlite=no/g' configure
   ./configure \
    --prefix=${bldDir} \
    --with-geos
 
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
   make install || exit 1
fi
cd ${srcDir}
export PATH=$oldPath
