echo 'select distinct vendor, model, versiontype, version from versions order by vendor, model, versiontype, version;' |
	mysql -u version -p layer1versions | ./model_health.pl
