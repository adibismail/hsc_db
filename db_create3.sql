/* Users -> users_right -> users_type */

create table users_type_table(
	user_type_id int auto_increment,
	type varchar(20),
	description text(255),
	primary key(user_type_id)
	);
	
	
create table users_right_table(
	user_right_id int auto_increment,
	description text(255),
	restriction varchar(255),
	primary key(user_right_id)
	);
	
/* Alerts -> rules_table -> rules_type */

create table rules_type_table(
	rules_type_id bigint unsigned auto_increment,
	rules_type_desc varchar(45),
	primary key(rules_type_id)
	);
	
create table scopes_table(
	scope_id int unsigned auto_increment,
	gateway_id int unsigned, 
	gateway_dwell_time varchar(45),
	start_time timestamp not null,
	end_time TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	primary key(scope_id)
	);

	
create table rules_table(
	rules_id bigint unsigned auto_increment,
	description text(255),
	x_threshold float,
	y_threshold float,
	z_threshold float,
	x_frequency int,
	y_frequency int,
	z_frequency int,
	alert_option tinyint,
	attendance tinyint,
	geoence tinyint,
	rules_type_id bigint unsigned,
	scope_id int unsigned,
	primary key(rules_id, rules_type_id, scope_id),
	foreign key(rules_type_id) references rules_type_table(rules_type_id),
	foreign key(scope_id) references scopes_table(scope_id)
	);
		
	/* alter table alerts_table add foreign key(user_id) references users_table(user_id); */
	
	
/* Gateway -> location_master -> Location_type */

create table locations_type_table(
	type_id bigint unsigned auto_increment,
	location_type varchar(45),
	primary key(type_id)
	);

create table buildings_table(
    building_id bigint unsigned NOT NULL auto_increment,
    name varchar(255) NOT NULL, 
    detail text,
    floor_num int(11) NOT NULL,
    address varchar(255) not null,
    lat double(8,2) not null,
    lng double(8,2) not null,
    created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    primary key(building_id)
    );

create table floors_table(
    floor_id int unsigned auto_increment,
    id bigint(20) unsigned NOT NULL,
    number int(11) NOT NULL,
    building_id bigint unsigned DEFAULT NULL,
    created_at timestamp NULL DEFAULT NULL,
    updated_at timestamp NULL DEFAULT NULL,
    PRIMARY KEY (floor_id),
    foreign key(building_id) references buildings_table(building_id) on update cascade
    );
	
create table locations_master_table(
	location_master_id bigint unsigned auto_increment,
	location_type_id bigint unsigned, 
	parent_location_id bigint unsigned,
	location_description text(255),
	floor int unsigned,
	primary key(location_master_id),
	foreign key(location_type_id) references locations_type_table(type_id),
    foreign key(floor) references floors_table(floor_id) on delete cascade
	);
	
create table gateways_table(
	gateway_id bigint unsigned auto_increment,
	mac_addr varchar(17),
	reader_ip varchar(45),
	location_id bigint unsigned,
	reader_status tinyint, 
	up_status text(255),
    assigned tinyint,
    serial varchar(45),
	created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	primary key(gateway_id),
	foreign key(location_id) references locations_master_table(location_master_id) on update cascade
	);
	
/* Residents -> beacons -> beacons_type */
create table beacons_type_table(
	beacon_type_id int unsigned auto_increment,
	beacon_type_desc text(20),
	primary key(beacon_type_id)
	);

create table beacons_table(
	id bigint unsigned not null unique auto_increment,
	beacon_type int unsigned,
	beacon_mac varchar(17),
	created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
    primary key(id),
	foreign key(beacon_type) references beacons_type_table(beacon_type_id)
	);

create table residents_table(
	resident_id bigint unsigned not null unique auto_increment,
	beacon_id bigint unsigned,
	resident_fName text(20),
	resident_lName text(20),
	resident_age int,
	wheelchair tinyint,
	walking_cane tinyint,
	x_value float,
	y_value float,
	z_value float,
    primary key(resident_id),
    foreign key(beacon_id) references beacons_table(id) on update cascade
	);

    create table users_table(
	user_id bigint unsigned auto_increment,
    beacon_id bigint unsigned,
	type_id int,
	alert_id bigint,
	right_id int,
	fName varchar(20),
	lName varchar(20),
	phone_number varchar(20),
	created_at TIMESTAMP NOT NULL,
    updated_at TIMESTAMP NOT NULL DEFAULT NOW() ON UPDATE NOW(),
	primary key(user_id),
	foreign key(type_id) references users_type_table(user_type_id),
	foreign key(right_id) references users_right_table(user_right_id),
    foreign key(beacon_id) references beacons_table(id) on update cascade
	);


/* ACTIVITY LOG */

create table activity_log_table(
	log_id bigint unsigned auto_increment,
	log_time timestamp NOT NULL,
	gateway_id bigint unsigned,
	beacon_id bigint unsigned,
	rssi bigint,
	battery_level float,
	x_value float,
	y_value float,
	z_value float,
	rawData varchar(50),
	primary key(log_id),
	foreign key(gateway_id) references gateways_table(gateway_id),
	foreign key(beacon_id) references beacons_table(id)
	);
	
	
create table alerts_table(
	alert_id bigint auto_increment,
	occured_at timestamp not null,
	resolved_at timestamp not null default now() on update now(),
	reader_id bigint unsigned,
	rules_id bigint unsigned,
	action tinyint,
	user_id bigint unsigned,
	primary key(alert_id),
	foreign key(rules_id) references rules_table(rules_id),
	foreign key(user_id) references users_table(user_id),
	foreign key(reader_id) REFERENCES gateways_table(gateway_id)
	);
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	