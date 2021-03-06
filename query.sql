drop table artist cascade constraints;
drop table gallery cascade constraints;
drop table art cascade constraints;



create table artist(
user_id number(10) not null,
name varchar(20),
password number(20),
about varchar(50),
age number(3),
artist_pic BLOB
);

create table gallery(
gallery_id number(10) not null,
gallery_name varchar(50)
);

create table art(
art_id number(10) not null,
gallery_id number(10),
user_id number(10),
filename varchar(50),
artist_name varchar(20),
art_pic BLOB,
description varchar(50),
price integer,
rank number(10) unique,
upload_date date
);


describe artist;
describe gallery;
describe art;

-- Primary and foreign key section 
alter table artist add primary key(user_id);
alter table gallery add primary key(gallery_id);
alter table art add primary key(art_id);

alter table art add foreign key(gallery_id) references gallery(gallery_id) on delete cascade;
alter table art add foreign key(user_id) references artist(user_id) on delete cascade;
alter table art add foreign key(artist_name) references artist(name) on delete cascade;


-- Some values have been inserted
insert into artist values(1, 'Bikash', '12345','Developer',20,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img1.jpg'));
insert into artist values(2, 'Tusher', '11115','Good',40,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img2.jpg'));
insert into artist values(40, 'Dibbya', '49832','Atel',25,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img3.jpg'));
insert into artist values(45, 'Shorol', '13456','Gamer',28,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img4.jpg'));
insert into artist values(16, 'Dola', '35681','Studious',18,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img5.jpg'));
insert into artist values(17, 'Akif', '33721','Fatty',90,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img6.jpg'));
insert into artist values(57, 'Masud', '78392','Smallest',5,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img7.jpg'));


insert into gallery values(1,'Sculpture');
insert into gallery values(2,'Painting');
insert into gallery values(3,'Others');
insert into gallery values(4,'Images');


insert into art values(1,2,40,'Dibbya paint','Dibbya',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\p1.jpg'),'Painting of a girl and butterfly',12399,2,'14-JUNE-2017');
insert into art values(2,3,2,'Tusher bat','Tusher',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\o1.jpg'),'Bat of Sachin',20225,5,'12-MARCH-2017');
insert into art values(3,1,45,'Shorol sculp','Shorol',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\s3.jpg'),'Sculpture of Bibekananda',181000,4,'15-FEBRUARY-2017');
insert into art values(4,1,16,'Dola sculp','Dola',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\s1.jpg'),'Sculpture of ROBI Tagore',250000,1,'11-MAY-2017');
insert into art values(5,2,1,'Bikash paint','Bikash',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\p2.jpg'),'Painting of village view',50000,3,'19-JUNE-2017');
insert into art values(6,2,17,'Akif paint','Akif',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\s2.jpg'),'Sculpture of a big Monkey',450000,6,'20-MARCH-2017');



--Query
