

srcdir=`pwd`
bldDir=`pwd`/build

rm -rf ${bldDir}
mkdir ${bldDir}

export PATH=$PATH:${bldDir}/bin:${bldDir}/include
#=================================================
rm -rf sqlite-autoconf-3340000

tar -xf sqlite-autoconf-3340000.tar.gz
cd ${srcdir}/sqlite-autoconf-3340000

./configure --prefix=${bldDir}
make 
make install
make check || exit 1

cd ${srcdir}

#=================================================
rm -rf tiff-4.2.0

tar -xf tiff-4.2.0.tar.gz
cd ${srcdir}/tiff-4.2.0

./configure --prefix=${bldDir}
make 
make install
make check || exit 1



cd ${srcdir}

#=================================================
rm -rf proj-7.2.0

tar -xf proj-7.2.0.tar.gz
cd proj-7.2.0
./configure --prefix=${bldDir} SQLITE3_CFLAGS="-I${bldDir}/include" SQLITE3_LIBS="-L${bldDir}/lib -lsqlite3"  TIFF_LIBS="-L${bldDir}/lib -ltiff" --without-curl
make 
make install
make check || exit 1

cd ${srcdir}

#=================================================
rm -rf gdal-3.2.1

tar -xf gdal-3.2.1.tar.gz

cd gdal-3.2.1
./configure --prefix=${bldDir} --with-proj=${bldDir}
make
make install || exit 1
   
cd ${srcdir}

