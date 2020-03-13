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
projVer="6.0.0"
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
gdalVer="3.0.4"
if [ "${dwnl}" == "J" ]; then
   wget -O gdal-${gdalVer}.tar.gz http://download.osgeo.org/gdal/${gdalVer}/gdal-${gdalVer}.tar.gz 
fi
if [ "${inst}" == "J" ]; then
   export LD_LIBRARY_PATH=${bldDir}/lib:${LD_LIBRARY_PATH};
   export PATH=${bldDir}/bin:${PATH};
   tar -xf gdal-${gdalVer}.tar.gz
   srcPath=$(ls -1 | grep gdal | grep -v "tar.gz")
   cd $srcPath
   CPPFLAGS=-I${bldDir}/include LDFLAGS=-L${bldDir}/lib ./configure --prefix=${bldDir} --with-openjpeg --with-jpeg=internal
   make
   make install || exit 1
fi
