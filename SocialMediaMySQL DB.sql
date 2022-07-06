create database SocialMedia ;
use SocialMedia ; 

create table users (
id  int NOT NULL auto_increment ,
first_name varchar(100) NOT NULL ,
last_name varchar(100) NOT NULL ,
user_name varchar(50) NOT NULL ,
email  varchar(100) NOT NULL ,
pass_word varchar(100) NOT NULL ,
city varchar(25) NOT NULL ,
state varchar(2) ,
zipcode varchar(5) ,
country varchar (25) NOT NULL ,
profile_picture_url varchar(255),
primary key (id) 
) ;
desc users ;
insert into users(first_name,last_name,user_name,email,pass_word,city,state,zipcode,country,profile_picture_url) values ('chris', 'will', 'chod', 'test@test.com', '123456', 'brooklyn', 'NY', '11209', 'usa', 'C:\Users\Pictures' ) ;
 select * from users ;
 
create table posts ( 
id int NOT NULL auto_increment primary key ,
user_id int NOT NULL ,
post_content varchar(255)  NOT NULL , 
date_created datetime NOT NULL default current_timestamp ,
foreign key (user_id) references users(id)  
 ) ;
 
alter table posts rename column post_id to user_id ;
desc posts ;

create table comments (  
id int NOT NULL auto_increment primary key ,
user_id int NOT NULL , 
post_id int NOT NULL , 
comment_content varchar(255)  NOT NULL , 
date_created datetime NOT NULL default current_timestamp ,
foreign key (user_id) references users(id) ,
foreign key (post_id) references posts(id) 
) ;
desc users ;
show tables ;
desc posts ;
insert into posts ( user_id,post_content) values (1, 'My first DB') ;
desc comments ;
insert into comments(user_id,post_id,comment_content) values (1,1,'good luck') ;

select u.first_name,u.last_name,p.post_content,p.date_created,c.comment_content, c.date_created from ((users u
 inner join posts p on u.id= p.user_id)
 inner join comments c on p.id = c.post_id) ;
