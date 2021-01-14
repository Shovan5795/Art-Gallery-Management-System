drop table artist cascade constraints;
drop table gallery cascade constraints;
drop table art cascade constraints;
drop table myaudit cascade constraints;



create table artist(
user_id number(10) not null,
name varchar(20),
password number(20),
about varchar(50),
age number(3),
artist_pic BLOB,
category number(2)
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
art_pic BLOB,
description varchar(50),
price integer,
rank number(10) unique,
upload_date date
);


describe artist;
describe gallery;
describe art;


alter table artist add primary key(user_id);
alter table gallery add primary key(gallery_id);
alter table art add primary key(art_id);

alter table art add foreign key(gallery_id) references gallery(gallery_id) on delete cascade;
alter table art add foreign key(user_id) references artist(user_id) on delete cascade;




insert into artist values(1, 'Bikash', 12345,'Developer',20,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img1.jpg'),1);
insert into artist values(2, 'Tusher', 11115,'Good',40,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img2.jpg'),1);
insert into artist values(40, 'Dibbya', 49832,'Atel',25,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img3.jpg'),1);
insert into artist values(45, 'Shorol', 13456,'Gamer',28,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img4.jpg'),1);
insert into artist values(16, 'Dola', 35681,'Studious',18,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img5.jpg'),1);
insert into artist values(17, 'Akif', 33721,'Fatty',90,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img6.jpg'),1);
insert into artist values(57, 'Masud', 78392,'Smallest',5,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img7.jpg'),0);


insert into gallery values(1,'Sculpture');
insert into gallery values(2,'Painting');
insert into gallery values(3,'Others');
insert into gallery values(4,'Images');



insert into art values(1,2,'Dibbya paint',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\p1.jpg'),'Painting of a girl and butterfly',12399,2,'14-JUNE-2017');
insert into art values(2,3,'Tusher bat',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\o1.jpg'),'Bat of Sachin',20225,5,'12-MARCH-2017');
insert into art values(3,1,'Shorol sculp',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\s3.jpg'),'Sculpture of Bibekananda',181000,4,'15-FEBRUARY-2017');
insert into art values(4,1,'Dola sculp',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\s1.jpg'),'Sculpture of ROBI Tagore',250000,1,'11-MAY-2017');
insert into art values(5,2,'Bikash paint',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\p2.jpg'),'Painting of village view',50000,3,'19-JUNE-2017');
insert into art values(6,2,'Akif paint',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\s2.jpg'),'Sculpture of a big Monkey',450000,6,'20-MARCH-2017');

--Queries on aggregate functions and select operations
select count(user_id), count(age) from artist;
select count(gallery_id) from gallery where gallery_id>1;
select art_id,price,filename from art;
select sum(price) as p_sum from art;
select avg(price) from art;
select (price/10) as pricedivision from art where art_id=3;
select max(price) as maxprice from art;
select min(price) as minprice from art;
select name,about from artist where user_id=40 or user_id=45;
select filename from art where price>=100000 and price<=200000;
select user_id,age from artist where name like '%Dola%';
select rank,art_id,user_id,filename,description from art order by rank;




-- Set operations and subqueries
select a.user_id,a.artist_name from art a union all  select  aa.user_id,aa.name from artist aa where aa.user_id in(select user_id from artist where user_id>16);
select a.user_id,a.artist_name from art a union  select  aa.user_id,aa.name from artist aa where aa.user_id in(select user_id from artist where user_id>16);

select a.user_id,a.artist_name from art a intersect  select  aa.user_id,aa.name from artist aa where aa.user_id in(select user_id from artist where user_id>16);

select a.user_id,a.artist_name from art a minus select  aa.user_id,aa.name from artist aa where aa.user_id in(select user_id from artist where user_id>16);

select g.gallery_id,g.gallery_name from gallery g where gallery_id<3 union all select aaa.gallery_id, aaa.filename from art aaa where aaa.gallery_id in(select gallery_id from art where gallery_id<3);
select g.gallery_id,g.gallery_name from gallery g where gallery_id<3 union select aaa.gallery_id, aaa.filename from art aaa where aaa.gallery_id in(select gallery_id from art where gallery_id<3);

select g.gallery_id,g.gallery_name from gallery g where gallery_id<3 intersect select aaa.gallery_id, aaa.filename from art aaa where aaa.gallery_id in(select gallery_id from art where gallery_id<3); 

select g.gallery_id,g.gallery_name from gallery g where gallery_id<3 minus select aaa.gallery_id, aaa.filename from art aaa where aaa.gallery_id in(select gallery_id from art where gallery_id<3);  





--Join operations start here
select a.gallery_id,a.user_id,a.filename from art a join gallery g on a.gallery_id=g.gallery_id;
select gallery_id,filename,rank from art a join gallery g using(gallery_id);
select aa.name,aa.age,aa.about from artist aa join art aaa on aa.user_id= aaa.user_id;
select name,age,about from artist a join art aa using(user_id);


select user_id,name,user_id,filename from artist  natural join art;


select a.user_id,a.name,a.about,a.age,b.gallery_id,b.filename,b.upload_date from artist a cross join art b;


select aa.name,aa.age,aa.about from artist aa left outer join art aaa on aa.user_id= aaa.user_id;
select aa.name,aa.age,aa.about from artist aa right outer join art aaa on aa.user_id= aaa.user_id;
select aa.name,aa.age,aa.about from artist aa full outer join art aaa on aa.user_id= aaa.user_id;


--PLSQL part starts here


--For login with user_id and password
set serveroutput on;
declare
u_id artist.user_id%type :=1;
u_name artist.name%type :='Bikash';
u_pass artist.password%type :=12345;
passw artist.password%type;

begin
select password into passw from artist where user_id=u_id and name=u_name;
if u_pass=passw then
dbms_output.put_line('Login successful');
else
dbms_output.put_line('Access Denied');
end if;
end;
/



--PLSQL code for discounted price of an art
set serveroutput on;
declare
full_price art.price%type;
file_title art.filename%type;
discount_price art.price%type;

begin
file_title := 'Tusher bat';
select price into full_price from art where filename like file_title;
if full_price<30000 then
    discount_price := full_price;
elsif full_price >= 30000 and full_price <50000 then
    discount_price := full_price - (full_price* 0.30);
elsif full_price >= 50000 and full_price <150000 then
    discount_price := full_price - (full_price* 0.50);
else
    discount_price := full_price - (full_price* 0.60);
end if;

dbms_output.put_line ( file_title || '  Full price is : ' || full_price || ' and the final Discounted price is : ' || round(discount_price,2));

exception
     when others then
         dbms_output.put_line(sqlerrm);
end;
/



--Cursor function starts here
--Showing arts of one gallery using PLSQL
set serveroutput on;
declare
cursor art_cur is select filename,upload_date from art where gallery_id in(select gallery_id from gallery where gallery_name='Painting');
art_pointer art_cur%rowtype;
begin
open art_cur;
loop
fetch art_cur into art_pointer;
dbms_output.put_line('Painting includes  ' || art_pointer.filename||'  and was uploaded in   '||art_pointer.upload_date);
exit when art_cur%rowcount>2;
end loop;
close art_cur;
end;
/




--Showing arts by ranking
set serveroutput on;
declare
cursor art_cur is select art_id,filename,description,upload_date,rank from art order by rank;
art_pointer art_cur%rowtype;
begin
open art_cur;
loop
fetch art_cur into art_pointer;
dbms_output.put_line('Rank: '||art_pointer.rank||'  art no. : '||art_pointer.art_id|| ' Filename: '||art_pointer.filename||'  Description: '||art_pointer.description|| ' Upload date: '||art_pointer.upload_date);
exit when art_cur%rowcount>5;
end loop;
close art_cur;
end;
/



create table myaudit
	(
		new_name varchar2(30),
		old_name varchar2(30),
		user_name varchar2(30),
		entry_date varchar2(30),
		operation varchar2(30)
		);

--Trigger for artist table
set serveroutput on
CREATE OR REPLACE TRIGGER user1audit
BEFORE INSERT OR DELETE OR UPDATE ON artist
FOR EACH ROW  

BEGIN 

  IF INSERTING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(:NEW.NAME, Null , user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'), 'Insert');
  ELSIF DELETING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(NULL,:OLD.NAME, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Delete');
  ELSIF UPDATING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(:NEW.NAME, :OLD.NAME, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'),'Update');
  END IF;
END;
 /





--Trigger for gallery table
set serveroutput on
CREATE OR REPLACE TRIGGER galleryaudit
BEFORE INSERT OR DELETE OR UPDATE ON gallery
FOR EACH ROW  

BEGIN 

  IF INSERTING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(:NEW.GALLERY_NAME, Null , user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'), 'Insert');
  ELSIF DELETING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(NULL,:OLD.GALLERY_NAME, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Delete');
  ELSIF UPDATING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(:NEW.GALLERY_NAME, :OLD.GALLERY_NAME, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'),'Update');
  END IF;
END;
 /



--Trigger for art table
set serveroutput on
CREATE OR REPLACE TRIGGER artaudit
BEFORE INSERT OR DELETE OR UPDATE ON art
FOR EACH ROW  

BEGIN 

  IF INSERTING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(:NEW.FILENAME, Null , user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'), 'Insert');
  ELSIF DELETING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(NULL,:OLD.FILENAME, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS') , 'Delete');
  ELSIF UPDATING THEN
  INSERT INTO myaudit (new_name,old_name, user_name, entry_date, operation) VALUES(:NEW.FILENAME, :OLD.FILENAME, user, TO_CHAR(sysdate, 'DD/MON/YYYY HH24:MI:SS'),'Update');
  END IF;
END;
 /





--Procedure for updating user_picture
create or replace procedure update_user_picture(
	u_name artist.name%type,
	u_pass artist.password%type,
                     a_pic artist.artist_pic%type,
                     c_gory artist.category%type) IS
begin
  if c_gory=1 then
    Update artist set artist_pic=a_pic  where name=u_name and password=u_pass;
  else
    dbms_output.put_line('The user is not admin');
  end if;
end;
/  


set serveroutput on;
begin
  update_user_picture('Bikash',12345,utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\img1.jpg'),1);
end;
/  
show errors;

select * from myaudit;








--procedure for insert any art
create or replace procedure insert_art(
                     u_name artist.name%type,
	u_pass artist.password%type,
	ar_id art.art_id%type,
	g_id art.gallery_id%type,
	f_name art.filename%type,
                     ar art.art_pic%type,
	des art.description%type,
	rnk art.rank%type,
                     prc art.price%type,
	up_date art.upload_date%type) IS
uu_id artist.user_id%type;
cat artist.category%type;

begin
select user_id,category into uu_id,cat from artist where name=u_name and password=u_pass;
   if cat=1 then
     insert into art values(ar_id,g_id,f_name,ar,des,rnk,prc,up_date);
   else
     dbms_output.put_line('You have no authority to add any art');
   end if;
end;
/
show errors;

set serveroutput on;
begin
insert_art('Akif',33721,7,3,'Fattys pic',utl_raw.cast_to_raw('F:\3-1 Works\Database Project- Art Gallery database management system\o2.jpg') ,'This is a great creature',250652,7,'3-AUGUST-2017');
end;
/
show errors;


select art_id, gallery_id,filename,description,price,rank from art;
select * from myaudit;

