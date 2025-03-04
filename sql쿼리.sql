

create table user_info(
	id varchar(45) not null,
    username varchar(45) not null,
    DelivaryAddress varchar(45) not null,
    PaymentMethod varchar(45),
    wow bool not null default false,
    Gcode varchar(45) not null,
    DelivaryDate date not null,
    dName varchar(45) not null,
    primary key(id),
	foreign key(Gcode) references Goods.Gname
);

create table Goods(
	Gcode varchar(45) not null,
    Gname varchar(45) not null,
    inventory int,
    primary key(Gcode)
);

create table menufacture(
	Mname varchar (45) not null,
    country varchar(45) not null,
    Gname varchar(45) not null,
    primary key(Mname),
    foreign key(Gname) references Goods.Gname
);

create table purchase(
	id varchar(45) not null,
    Gcode varchar(45) not null,
    amount int not null,
    primary key (id),
    primary key (Gcode),
    foreign key(id) references user_info.id,
    foreign key(Gcode) references Goods.Gcode
);

create table review(
	reviewCode varchar(45) not null,
    reviewTitle varchar(45) not null,
    details varchar(100),
    Rdate date not null,
    primary key (reviewCode)
);