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

sqliteVer="autoconf-3340000"
if [ "${dwnl}" == "J" ]; then
   wget -O sqlite-${sqliteVer}.tar.gz https://www.sqlite.org/2020/sqlite-${sqliteVer}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf sqlite-${sqliteVer}.tar.gz
   cd sqlite-${sqliteVer}
   ./configure --prefix=${bldDir}
   make 
   make install
   make check || exit 1
fi

#===============================================================================


cd ${srcDir}
projVer="7.2.0"
if [ "${dwnl}" == "J" ]; then
   wget -O proj-${projVer}.tar.gz http://download.osgeo.org/proj/proj-${projVer}.tar.gz
fi
if [ "${inst}" == "J" ]; then
   tar -xf proj-${projVer}.tar.gz
   srcPath=$(ls -1 | grep proj | grep -v "tar.gz")

   cd $srcPath
   ./configure --prefix=${bldDir} SQLITE3_CFLAGS="-I${bldDir}/include" SQLITE3_LIBS="-L${bldDir}/lib -lsqlite3" --without-curl
   make 
   make install
   make check || exit 1
fi

#===============================================================================
cd ${srcDir}
gdalVer="3.2.0"
if [ "${dwnl}" == "J" ]; then
   wget -O gdal-${gdalVer}.tar.gz http://download.osgeo.org/gdal/${gdalVer}/gdal-${gdalVer}.tar.gz 
fi
if [ "${inst}" == "J" ]; then
   tar -xf gdal-${gdalVer}.tar.gz
   cd gdal-${gdalVer}
   ./configure --prefix=${bldDir} --with-proj=${bldDir}
   make
   make install || exit 1
fi
#===============================================================================
cd ${srcDir}
tiffVer="4.1.0"
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
m4Ver="1.4.18"
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
geosVer="3.8.1"
if [ "${dwnl}" == "J" ]; then
   wget -O geos-${geosVer}.tar.bz2 http://download.osgeo.org/geos/geos-${geosVer}.tar.bz2
   tar -jxf geos-${geosVer}.tar.bz2
   tar -zcf geos-${geosVer}.tar.gz geos-${geosVer}
   rm -rf geos-${geosVer}/
   rm -rf geos-${geosVer}.tar.bz2
fi
if [ "${inst}" == "J" ]; then
   tar -xf geos-${geosVer}.tar.gz
   srcPath=$(ls -1 | grep geos | grep -v "tar.gz")
   cd $srcPath
   ./configure --prefix=${bldDir}
   make
   make install || exit 1
fi
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
export PATH=$oldPath
