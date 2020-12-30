CREATE TABLE users(
    id INT(11) NOT NULL,
    username VARCHAR (128) NOT NULL,
    password VARCHAR (512) NOT NULL,
    email VARCHAR(255) NOT NULL,
    enabled BOOLEAN NOT NULL
);
create table roles(
    id int(11) not null,
    name varchar(128) not null
);
create table user_roles(
    user_id int(11) not null,
    role_id int(11) not null
);
create table owner(
    id INT(11) not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    phone_number varchar(255) not null
);
create table car(
    id INT(11) not null,
    brand varchar(255) not null,
    model varchar(255) not null,
    year bigint not null,
    km bigint not null,
    color varchar(255) not null,
    owner_id INT(11) not null
);
create table advert(
    id INT(11) not null,
    car_id INT(11) not null,
    title varchar(255) not null,
    description varchar(255) not null,
    createdAt date not null,
    price bigint not null
);

alter table users add constraint pk_users primary key(id);
alter table owner add constraint pk_owner primary key(id);
alter table car add constraint pk_car primary key(id);
alter table advert add constraint pk_advert primary key(id);
alter table roles add constraint pk_roles primary key(id);

alter table car add constraint fk_owner_car foreign key(owner_id) references owner(id);
alter table user_roles add constraint fk_user foreign key (user_id) references users(id);
alter table user_roles add constraint fk_role foreign key (role_id) references roles(id);
alter table advert add constraint fk_advert_car foreign key (car_id) references car(id);

create sequence USER_SEQUENCE start with 4 increment by 1;
create sequence ROLE_SEQUENCE start with 3 increment by 1;
create sequence CAR_SEQUENCE start with 6 increment by 1;
create sequence OWNER_SEQUENCE start with 11 increment by 1;
create sequence ADVERT_SEQUENCE start with 4 increment by 1;
