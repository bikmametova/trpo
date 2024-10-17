create database demo;
use demo;
create table post(
post_id int primary key auto_increment,
name_post varchar(50) not null);

create table user(
user_id int primary key auto_increment,
surname varchar(50) not null,
name varchar(50) not null,
patronymic varchar(50),
post_id int not null, foreign key(post_id) references post(post_id),
login varchar(10),
password1 varchar(10));

create table categ(
categ_id int primary key auto_increment,
categ_name varchar(100) not null,
description_1 varchar(555) not null,
price decimal(6,2) not null);

create table service(
service_id int primary key auto_increment,
service_name varchar(100) not null);

create table service_categ(
service_categ_id int primary key auto_increment,
categ_id int not null, foreign key(categ_id) references categ(categ_id),
service_id int not null, foreign key(service_id) references service(service_id));

create table elev(
elev_id int primary key auto_increment,
elev_name varchar(10) not null);

create table status_room(
status_id int primary key auto_increment,
status_name varchar(50) not null);

create table room(
room_id int primary key auto_increment,
room_name varchar(10) not null,
categ_id int not null, foreign key(categ_id) references categ(categ_id),
status_id int, foreign key(status_id) references status_room(status_id));

create table elev_room(
elev_room_id int primary key auto_increment,
elev_id int not null, foreign key(elev_id) references elev(elev_id),
room_id int not null, foreign key(room_id) references room(room_id));

create table clients(
client_id int primary key auto_increment,
surname varchar(50) not null,
name varchar(50) not null,
patronymic varchar(50),
phone_number varchar(11) not null,
date_of_birth DATE not null,
place_of_birth varchar(100) not null,
passport_data varchar(10) not null,
date_and_who_issue varchar(100) not null,
address varchar(100) not null);

create table view_price (
view_price_id int primary key auto_increment,
name_view_price varchar(100) not null);

create table additional_service (
service_id int primary key auto_increment,
name_service varchar(100) not null,
description_1 varchar(500) not null,
price decimal(6,2) not null,
view_price_id int not null, foreign key(view_price_id) references view_price(view_price_id));

create table counts (
count_id int primary key auto_increment,
name_count varchar(100) not null);

create table chart_day (
chart_day_id int primary key auto_increment,
chart_day DATE not null);

create table housemaid(
housemaid_id int primary key auto_increment,
surname varchar(50) not null,
name varchar(50) not null,
patronymic varchar(50),
phone_number varchar(11));

create table chart (
chart_id int primary key auto_increment,
chart_day_id int not null, foreign key(chart_day_id) references chart_day(chart_day_id),
housemaid_id int not null, foreign key(housemaid_id ) references housemaid(housemaid_id ),
elev_id int not null, foreign key(elev_id) references elev(elev_id));

create table checks (
checks_id int primary key auto_increment,
client_id int not null, foreign key(client_id) references clients(client_id),
user_id int not null, foreign key(user_id) references user(user_id),
check_in_date DATE not null,
eviction_date DATE,
itog_price decimal(6,2) not null);

create table additional_service_room(
additional_service_room_id int primary key auto_increment,
checks_id int not null, foreign key(checks_id) references checks(checks_id),
service_id int, foreign key(service_id) references additional_service(service_id),
room_id int, foreign key(room_id) references room(room_id),
count int not null,
count_id int not null, foreign key(count_id) references counts(count_id));