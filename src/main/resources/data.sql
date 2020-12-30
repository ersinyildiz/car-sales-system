insert into users(id,username,password,email,enabled) values (1,'user1','{bcrypt}$2a$10$Va4RO4eaRQgYpw3YcY5cfOsE4RemdFUaZ1w6zs.ZnTvUfxiKpBBX6','user1@gmail.com',true);
insert into users(id,username,password,email,enabled) values (2,'user2','{bcrypt}$2a$10$1Um7zcStnAr83eqjMFTrf.rdzucR2xhNCu2/LwqqdEhGcIEgFmhk.','user2@gmail.com',false);
insert into users(id,username,password,email,enabled) values (3,'user3','{bcrypt}$2a$10$D/o18NwfCjWh3KT56Sp3xeQ5ZPbCBH0vR9cEAjK98AipbEFTQZS2y','user3@gmail.com',true);

insert into roles values (1,'ROLE_USER');
insert into roles values (2,'ROLE_ADMIN');

insert into user_roles values ( 1,2 );
insert into user_roles values ( 2,1 );
insert into user_roles values ( 3,1 );

insert into owner(id,first_name,last_name,phone_number) values (1,'Ziya','Ferit','0531');
insert into owner(id,first_name,last_name,phone_number) values (2,'Beşir','Dal','0532');
insert into owner(id,first_name,last_name,phone_number) values (3,'Eda','Rize','0533');
insert into owner(id,first_name,last_name,phone_number) values (4,'Eda','Duru','0534');
insert into owner(id,first_name,last_name,phone_number) values (5,'Pınar','Mus','0535');
insert into owner(id,first_name,last_name,phone_number) values (6,'Çiğdem','Su','0536');
insert into owner(id,first_name,last_name,phone_number) values (7,'Aslı','Zor','0537');
insert into owner(id,first_name,last_name,phone_number) values (8,'Murat','Eski','0538');
insert into owner(id,first_name,last_name,phone_number) values (9,'Eda','Saz','0539');
insert into owner(id,first_name,last_name,phone_number) values (10,'Kadir','Mutlu','0530');

insert into car(id,brand,model,year,km,color,owner_id) values (1,'BMW','116d',2017,10000,'Kırmızı',1);
insert into car(id,brand,model,year,km,color,owner_id) values (2,'Audi','A3',2016,85000,'Siyah',2);
insert into car(id,brand,model,year,km,color,owner_id) values (3,'Mercedes','GLE 350',2018,1000,'Füme',1);
insert into car(id,brand,model,year,km,color,owner_id) values (4,'Seat','Leon',2019,210000,'Beyaz',4);
insert into car(id,brand,model,year,km,color,owner_id) values (5,'Ford','Fiesta',2007,100000,'Gri',5);

insert into advert(id,car_id,title,description,createdAt,price)
values (1,1,'Bu bir başlık','Bu bir açıklama',current_date(),250000);
insert into advert(id,car_id,title,description,createdAt,price)
values (2,3, 'Bu bir başlık', 'Bu bir açıklama',current_date(),250000);
insert into advert(id,car_id,title,description,createdAt,price)
values (3,5,'Bu bir başlık','Bu bir açıklama',current_date(),100000);