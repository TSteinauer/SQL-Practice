DROP DATABASE IF EXISTS NHL;
CREATE DATABASE NHL;
USE NHL;

-- DROP TABLE IF EXISTS players CASCADE;
-- DROP TABLE IF EXISTS teams CASCADE;
-- DROP TABLE IF EXISTS games CASCADE; 
-- DROP TABLE IF EXISTS injury_report CASCADE; 

CREATE TABLE IF NOT EXISTS players (
player_id int not null auto_increment,
player_name  varchar(50) not null,
posistion    varchar(10) not null,
skill_level  int  null,
injury_record varchar(7000) null,
primary key (player_id)
);
insert into players values (12,'Chris Kreider', 'Captain', 87, null);
insert into players values (13,'Tony DeAngelo', 'Defense', 92, 'Pulled hamstring on 10/22/2020. Cannot play for two weeks.');

insert into players values (14,'Oliver Ekman-Larsson', 'Captain', 85, null);
insert into players values (15,'Lawson Crouse', 'Forward', 94, null);


CREATE TABLE IF NOT EXISTS teams (
team_id   int auto_increment not null,
name varchar(50) not null,
captain_id int not null,
city varchar(50) not null,
coach varchar(50) not null,
player_name varchar(50) null,
primary key (team_id),
foreign key (captain_id) references players(player_id)

);

insert into teams values(1, 'Rangers', 12, 'NY', 'David Quinn', null );
insert into teams values(2, 'Coyotes', 14, 'AZ', 'Rick Tocchet', null );

CREATE TABLE IF NOT EXISTS games (
id    int not null auto_increment,
date  datetime not null,
guest_team_id int not null,
home_team_id int not null,
home_cap_id  int not null,
guest_cap_id int not null,
score     char(3) not null,
primary key (id),
foreign key(guest_team_id) references teams(team_id),
foreign key(home_team_id) references teams(team_id),
foreign key(home_cap_id) references teams(captain_id),
foreign key(guest_cap_id) references teams(captain_id)
);
insert into games values(1, '2019-03-04' , 2, 1,12,14, '4-2');
insert into games values(2, '2020-10-22' , 1, 2,14,12, '3-4');

CREATE TABLE IF NOT EXISTS injury_records (
player_id  int not null auto_increment,
description varchar(7000) not null,
primary key(player_id),
foreign key(player_id) references players(player_id)
);
insert into injury_records values(13, 'Pulled hamstring on 10/22/2020. Cannot play for two weeks.');

