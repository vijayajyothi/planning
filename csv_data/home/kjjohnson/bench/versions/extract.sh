echo 'select * from versions order by vendor, device;' |
	mysql -u version -p layer1versions | sed -e 's/	/","/g' -e 's/^/"/' -e 's/$/"/' >versiondbexport.csv
