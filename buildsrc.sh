srcDir=`pwd`/pkgs

rm -rf $srcDir
mkdir -p $srcDir
cd $srcDir

#yumdownloader --source proj --resolve
#yumdownloader --source gdal --resolve
#yumdownloader --source netcdf --resolve
yumdownloader --source grass --resolve

#yum install grass grass-libs grass-gui liblas
# needed for GRASS Addons (via g.extension)
#yum install grass-devel liblas liblas-devel
