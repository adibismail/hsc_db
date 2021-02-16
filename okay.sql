/* create table residents_table(
	-- resident_id bigint unsigned auto_increment,
	beacon_id bigint unsigned,
	resident_fName text(20),
	resident_lName text(20),
	resident_age int,
	wheelchair tinyint,
	walking_cane tinyint,
	x_value float,
	y_value float,
	z_value float,
	primary key(beacon_id)
	);


create table users_table(
	-- user_id bigint unsigned auto_increment,
    beacon_id bigint unsigned,
	type_id int,
	alert_id bigint,
	right_id int,
	fName varchar(20),
	lName varchar(20),
	phone_number varchar(20),
	created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	primary key(beacon_id)
	);

create table beacons_table(
	id bigint unsigned unique not null,
	beacon_type int unsigned,
	beacon_mac varchar(17),
    foreign key(id) references users_table(beacon_id),
    foreign key(id) references residents_table(beacon_id)
	); */


create table beacons_table(
    id bigint unsigned not null unique auto_increment primary key,
    mac_addr varchar(45)
);

create table users_table(
    id bigint unsigned not null auto_increment primary key,
    beacon_id bigint unsigned unique,
    foreign key(beacon_id) references beacons_table(id) 
    on update cascade
);

create table residents_table(
    id bigint unsigned not null auto_increment primary key,
    beacon_id bigint unsigned unique,
    foreign key(beacon_id) references beacons_table(id)
    on update cascade
);