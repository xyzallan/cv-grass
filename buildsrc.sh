srcDir=`pwd`/src

rm -rf $srcDir
mkdir -p $srcDir
cd $srcDir

yumdownloader proj --resolve
yumdownloader gdal --resolve

