echo 'select vendor, model, count(model) as qty, "" as qty_3yrs_old, "" as qty_4yrs_old, "" as qty_5plus_yrs_old, "" as budgetary_replace_unitcost
	from versions
	where versiontype != "array disk productRev"
		and versiontype != "art_rev"
		and versiontype != "datadomain disk firmware"
		and versiontype != "sps assy_rev"
		and vendor != "vmware"
		and vendor != "avamar"
		and vendor != ""
	group by model
	order by vendor, model;' |
	mysql -u version -p layer1versions | sed -e 's/	/","/g' -e 's/^/"/' -e 's/$/"/' >hardware_models.csv
echo '"emc","VMAX 2314",1,,' >>hardware_models.csv
echo '"emc","VMAX 2875",1,,' >>hardware_models.csv
echo '"emc","VMAXe 0389",1,,' >>hardware_models.csv
