drop table if exists relationships;

create table relationships (
	parentAdapterKind varchar(50) not null,
	parentResKind varchar(50) not null,
	parentResName varchar(50) not null,
	childAdapterKind varchar(50) not null,
	childResKind varchar(50) not null,
	childRes varchar(50) not null,
	parentResIdentifiers varchar(150),
	childResIdentifiers varchar(150),
	parentIsContainer varchar(50) not null
);
