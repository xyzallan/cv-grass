rm -rf source
mkdir source
for nimi in $(ls -1 targz); do
tar -xf targz/$nimi -C ./source
done
