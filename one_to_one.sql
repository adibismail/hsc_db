create table data_table(
    id int,
    name varchar(40),
    primary key(id)
);

create table data2_table(
    id int,
    name varchar(40),
    primary key(id)
);

create table one_table(
    one_id int unique not null,
    value1 int,
    foreign key(one_id) references data_table(id),
    foreign key(one_id) references data2_table(id)
);