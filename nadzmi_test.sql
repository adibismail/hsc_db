create table data_gathering(
    id int auto_increment primary key,
    gateway_addr varchar(45),
    beacon_addr varchar(45),
    rssi bigint,
    battery_level float,
    x_value float,
    y_value float, 
    z_value float,
    rawData varchar(50),
    detected_at timestamp default CURRENT_TIMESTAMP 
    );

