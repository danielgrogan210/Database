drop table if exists stadiums cascade ;
drop table if exists conferences cascade ;
drop table if exists divisions cascade ;
drop table if exists teams cascade ;
drop table if exists players cascade ;
drop table if exists university cascade ;
drop table if exists positions cascade ;
drop table if exists teamRec cascade ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Conferences --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table conferences(
	conf		text not null unique,
	primary key (conf)
) ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Divisions -- 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table divisions(
	div			text not null unique,
	conf		text not null references conferences(conf),
	primary key(div)
) ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stadiums --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table stadiums(
	sid			serial,
	sName		text not null,
	city			text not null,
	state		text not null,
	primary key (sid)
) ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Teams -- 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table teams (
	tid			serial,
	tName 		text not null,
	sid			int not null references stadiums(sid),
	conf		text not null references conferences(conf),
	div			text not null references divisions(div),
	yearEst		int not null,
	headCoach	text not null,
	gMgr		text not null,
	wins		int not null,
	loss			int not null,
	tie			int not null,
	primary key (tid)
) ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- University --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table university(
	uid			serial,
	uName		text not null,
	primary key (uid)
) ;
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Positions --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table positions(
	pos			text not null unique,
	team		text not null,
	primary key (pos)
) ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Players --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

create table players(
	pid			serial,
	fName		text not null,
	lName		text not null,
	num		int not null,
	tid 			int not null references teams(tid),
	pos			text not null references positions(pos),
	uid			int references university(uid),
	rec			int,
	recYds		int,
	recTD		int,
	rushAtt		int,
	rushYds		int,
	rushTD		int,
	passAtt		int,
	passYds		int,
	passTD		int,
	fum			int,
	intThrown	int,
	tackles		int,
	assists		int,
	sacks		float(2),
	pDef		int,
	intCaught	int,
	ff			int,
	defTD		int,	
	primary key (pid)
) ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Conferences Insert Statements --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Insert into conferences (conf) values ('AFC') ;
Insert into conferences (conf) values ('NFC') ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Divisions Insert Statements --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Insert into divisions (div, conf) values ('AFCN', 'AFC') ;
Insert into divisions (div, conf) values ('AFCS', 'AFC') ;
Insert into divisions (div, conf) values ('AFCE', 'AFC') ;
Insert into divisions (div, conf) values ('AFCW', 'AFC') ;
Insert into divisions (div, conf) values ('NFCN', 'NFC') ;
Insert into divisions (div, conf) values ('NFCS', 'NFC') ;
Insert into divisions (div, conf) values ('NFCE', 'NFC') ;
Insert into divisions (div, conf) values ('NFCW', 'NFC') ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stadiums Insert Statements--
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into stadiums (sName, city, state) values ('Arrowhead Stadium', 'Kansas City', 'Missouri');
insert into stadiums (sName, city, state) values ('AT&T Stadium', 'Arlington', 'Texas');
insert into stadiums (sName, city, state) values ('Bank of America Stadium', 'Charlotte', 'North Carolina');
insert into stadiums (sName, city, state) values ('CenturyLink Field', 'Seattle', 'Washington');
insert into stadiums (sName, city, state) values ('EverBank Field', 'Jacksonville', 'Florida');
insert into stadiums (sName, city, state) values ('FedEx Field', 'Landover', 'Maryland');
insert into stadiums (sName, city, state) values ('FirstEnergy Stadium', 'Cleaveland', 'Ohio');
insert into stadiums (sName, city, state) values ('Ford Field', 'Detroit', 'Michigan');
insert into stadiums (sName, city, state) values ('Georgia Dome', 'Atlanta', 'Georgia');
insert into stadiums (sName, city, state) values ('Gillette Stadium', 'Foxborough', 'Massachusetts');
insert into stadiums (sName, city, state) values ('Hard Rock Stadium', 'Miami Gardens', 'Florida');
insert into stadiums (sName, city, state) values ('Heinz Field', 'Pittsburgh', 'Pennsylvania');
insert into stadiums (sName, city, state) values ('Lambeau Field', 'Green Bay', 'Wisconsin');
insert into stadiums (sName, city, state) values ('Levis Stadium', 'Santa Clara', 'California');
insert into stadiums (sName, city, state) values ('Lincoln Financial Field', 'Philadelphia', 'Pennsylvania');
insert into stadiums (sName, city, state) values ('Los Angeles Memorial Coliseum', 'Los Angeles', 'California');
insert into stadiums (sName, city, state) values ('Lucas Oil Stadium', 'Indianapolis', 'Indiana');
insert into stadiums (sName, city, state) values ('M&T Bank Stadium', 'Baltimore', 'Maryland');
insert into stadiums (sName, city, state) values ('Mercedes-Benz Superdome', 'New Orleans', 'Louisiana');
insert into stadiums (sName, city, state) values ('MetLife Stadium', 'East Rutherford', 'New Jersey');
insert into stadiums (sName, city, state) values ('New Era Field', 'Orchard Park', 'New York');
insert into stadiums (sName, city, state) values ('Nissan Stadium', 'Nashville', 'Tennessee');
insert into stadiums (sName, city, state) values ('NRG Stadium', 'Houston', 'Texas');
insert into stadiums (sName, city, state) values ('Oakland Alameda Coliseum', 'Oakland', 'California');
insert into stadiums (sName, city, state) values ('Paul Brown Stadium', 'Cincinnati', 'Ohio');
insert into stadiums (sName, city, state) values ('Qualcomm Stadium', 'San Diego', 'California');
insert into stadiums (sName, city, state) values ('Raymond James Stadium', 'Tampa', 'Florida');
insert into stadiums (sName, city, state) values ('Soldier Field', 'Chicago', 'Illinois');
insert into stadiums (sName, city, state) values ('Sports Authority Field at Mile High', 'Denver', 'Colorado');
insert into stadiums (sName, city, state) values ('University of Pheonix Stadium', 'Glendale', 'Arizona');
insert into stadiums (sName, city, state) values ('U.S. Bank Stadium', 'Minneapolis', 'Minnesota');

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Teams Insert Statements --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Baltimore Ravens', 18, 'AFC', 'AFCN',1996, 'John Harbaugh', 'Ozzie Newsome', 7, 5, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Pittsburgh Steelers', 12, 'AFC', 'AFCN',1933, 'Mike Tomlin', 'Kevin Colbert', 7, 5, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Cincinnati Bengals', 25, 'AFC', 'AFCN',1968, 'Marvin Lewis', 'Mike Brown', 4, 7, 1);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Cleaveland Browns', 7, 'AFC', 'AFCN',1946, 'Hue Jackson', 'Sashi Brown', 0, 12, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Houston Texans', 23, 'AFC', 'AFCS',2002, 'Bill OBrien', 'Rick Smith', 6, 6, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Indianapolis Colts', 17, 'AFC', 'AFCS',1953, 'Chuck Pagano	', 'Ryan Grigson', 6, 6, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Tennessee Titans', 22, 'AFC', 'AFCS',1960, 'Mike Mularkey', 'Jon Robinson', 6, 6, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Jacksonville Jaguars', 5, 'AFC', 'AFCS',1993, 'Gus Bradley', 'Dave Caldwell', 2, 10, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('New England Patriots', 10, 'AFC', 'AFCE',1960, 'Bill Belichick', 'Bill Belichick', 10, 2, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Miami Dolphins', 11, 'AFC', 'AFCE',1966, 'Adam Gase', 'Mike Tannenbaum', 7, 5, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Buffalo Bills', 21, 'AFC', 'AFCE',1960, 'Rex Ryan', 'Doug Whaley', 6, 6, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('New York Jets', 20, 'AFC', 'AFCE',1960, 'Todd Bowles', 'Mike Maccagnan', 3, 9, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Oakland Raiders', 24, 'AFC', 'AFCW',1960, 'Jack Del Rio', 'Reggie McKenzie', 10, 2, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Kansas City Chiefs', 1, 'AFC', 'AFCW',1960, 'Andy Reid', 'John Dorsey', 9, 3, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Denver Broncos', 29, 'AFC', 'AFCW',1960, 'Gary Kubiak', 'John Elway', 8, 4, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('San Diego Chargers', 26, 'AFC', 'AFCW',1960, 'Mike McCoy', 'Tom Telesco', 5, 7, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Detroit Lions', 8, 'NFC', 'NFCN',1929, 'Jim Caldwell', 'Bob Quinn', 8, 4, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Minnesota Vikings', 31, 'NFC', 'NFCN',1961, 'Mike Zimmer', 'Rick Spielman', 6, 6, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Green Bay Packers', 13, 'NFC', 'NFCN',1919, 'Mike McCarthy', 'Ted Thompson', 6, 6, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Chicago Bears', 28, 'NFC', 'NFCN',1919, 'John Fox', 'Ryan Pace', 3, 9, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Atlanta Falcons', 9, 'NFC', 'NFCS',1965, 'Dan Quinn', 'Thomas Dimitroff', 7, 5, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Tampa Bay Buccaneers', 27, 'NFC', 'NFCS',1976, 'Dirk Koetter', 'Jason Licht', 7, 5, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('New Orleans Saints', 19, 'NFC', 'NFCS',1967, 'Sean Payton', 'Mickey Loomis', 5, 7, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Carolina Panthers', 3, 'NFC', 'NFCS',1995, 'Ron Rivera', 'Dave Gettleman', 4, 8, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Dallas Cowboys', 2, 'NFC', 'NFCE',1960, 'Jason Garrett', 'Jerry Jones', 11, 1, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('New York Giants', 20, 'NFC', 'NFCE',1925, 'Ben McAdoo', 'Jerry Reese', 8, 4, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Washington Redskins', 6, 'NFC', 'NFCE',1932, 'Jay Gruden', 'Scot McCloughan', 6, 5, 1);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Philadelphia Eagles', 15, 'NFC', 'NFCE',1933, 'Doug Pederson', 'Howie Roseman', 5, 7, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Seattle Seahawks', 4, 'NFC', 'NFCW',1974, 'Pete Carroll', 'John Schneider', 8, 3, 1);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Arizona Cardinals', 30, 'NFC', 'NFCW',1898, 'Bruce Arians', 'Steve Keim', 5, 6, 1);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('Los Angeles Rams', 16, 'NFC', 'NFCW',1936, 'Jeff Fisher', 'Les Snead', 4, 8, 0);
insert into teams (tName, sid, conf, div, yearEst, headCoach, gMgr, wins, loss, tie) Values ('San Fransisco 49ers', 14, 'NFC', 'NFCW',1946, 'Chip Kelly', 'Trent Baalke', 1, 11, 0);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- University Insert Statements --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into university (uName) Values ('California') ;
insert into university (uName) Values ('Central Michigan') ;
insert into university (uName) Values ('Cincinnati') ;
insert into university (uName) Values ('Clemson') ;
insert into university (uName) Values ('Coastal Carolina') ;
insert into university (uName) Values ('Connecticut') ;
insert into university (uName) Values ('Alabama') ;
insert into university (uName) Values ('Arizona') ;
insert into university (uName) Values ('Arizona State') ;
insert into university (uName) Values ('Arkansas') ;
insert into university (uName) Values ('Auburn') ;
insert into university (uName) Values ('Baylor') ;
insert into university (uName) Values ('Boise State') ;
insert into university (uName) Values ('Boston College') ;
insert into university (uName) Values ('Florida') ;
insert into university (uName) Values ('Florida State') ;
insert into university (uName) Values ('Georgia') ;
insert into university (uName) Values ('Georgia Tech') ;
insert into university (uName) Values ('Iowa') ;
insert into university (uName) Values ('Kansas') ;
insert into university (uName) Values ('Kentucky') ;
insert into university (uName) Values ('Louisiana Tech') ;
insert into university (uName) Values ('Louisville') ;
insert into university (uName) Values ('LSU') ;
insert into university (uName) Values ('Maryland') ;
insert into university (uName) Values ('Miami') ;
insert into university (uName) Values ('Michigan') ;
insert into university (uName) Values ('Michigan State') ;
insert into university (uName) Values ('Mississippi State') ;
insert into university (uName) Values ('Missouri') ;
insert into university (uName) Values ('NC State') ;
insert into university (uName) Values ('Nebraska') ;
insert into university (uName) Values ('Marist') ;
insert into university (uName) Values ('North Carolina') ;
insert into university (uName) Values ('Notre Dame') ;
insert into university (uName) Values ('Ohio State') ;
insert into university (uName) Values ('Oklahoma') ;
insert into university (uName) Values ('Ole Miss') ;
insert into university (uName) Values ('Oregon') ;
insert into university (uName) Values ('Oregon State') ;
insert into university (uName) Values ('Penn State') ;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Positions Insert Statements --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Insert into positions (pos, team) Values ('QB', 'offense');
Insert into positions (pos, team) Values ('WR', 'offense');
Insert into positions (pos, team) Values ('TE', 'offense');
Insert into positions (pos, team) Values ('RB', 'offense');
Insert into positions (pos, team) Values ('FB', 'offense');
Insert into positions (pos, team) Values ('OT', 'offense');
Insert into positions (pos, team) Values ('OG', 'offense');
Insert into positions (pos, team) Values ('C', 'offense');
Insert into positions (pos, team) Values ('DE', 'defense');
Insert into positions (pos, team) Values ('DT', 'defense');
Insert into positions (pos, team) Values ('LB', 'defense');
Insert into positions (pos, team) Values ('ILB', 'defense');
Insert into positions (pos, team) Values ('OLB', 'defense');
Insert into positions (pos, team) Values ('NT', 'defense');
Insert into positions (pos, team) Values ('CB', 'defense');
Insert into positions (pos, team) Values ('FS', 'defense');
Insert into positions (pos, team) Values ('SS', 'defense');
Insert into positions (pos, team) Values ('K', 'specialTeams');
Insert into positions (pos, team) Values ('P', 'specialTeams');
Insert into positions (pos, team) Values ('LS', 'specialTeams');
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Player Insert Statements --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Matt' , 'Ryan' , 2 , 21,'QB',14, NULL,NULL ,NULL , 21, 116,NULL , 443, 3613, 27, 2, 7,NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL );
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Drew', 'Brees',9, 23,'QB', NULL, NULL, NULL, NULL, 9, 26, 2, 514, 3746, 30, 3, 10, NULL,NULL ,NULL ,NULL ,NULL ,NULL , NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Dak ', 'Prescott',4, 25,'QB',29, NULL, NULL, NULL, 35, 234, 5, 375, 2874, 19, 5, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Derek', 'Carr',4, 13,'QB', NULL, NULL, NULL, NULL, 17, 69, NULL, 468, 3316, 24, 3, 5,NULL ,NULL ,NULL ,NULL ,NULL ,NULL ,NULL );
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Eli', 'Manning',10, 26,'QB',38,NULL ,NULL ,NULL , 19, -7, NULL, 452, 3097, 22, 5, 12, NULL,NULL ,NULL ,NULL ,NULL ,NULL ,NULL );
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Ezekiel', 'Elliott',21, 25,'RB',36, 28, 322, 1, 263, 1285, 12,NULL , NULL, NULL, 4,NULL , NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Demarco', 'Murray',29, 7,'RB',37, 45, 3096, 3, 229, 1043, 8, NULL,NULL ,NULL , 3,NULL ,NULL ,NULL ,NULL ,NULL , NULL,NULL ,NULL );
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Jay', 'Ajayi',23, 10,'RB',13, 22, 113, NULL, 173, 908, 7, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Jordan', 'Howard',24, 20,'RB', NULL, 22, 242, 1, 181, 883, 5, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Jeremy', 'Hill',32, 3,'RB',24, 17, 135, NULL, 170, 677, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Travis', 'Kelce',87, 14,'TE',3, 65, 815, 3, 1, -5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Greg', 'Olsen',88, 24,'TE',26, 61, 820, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Dennis', 'Pitta',88, 1,'TE', NULL, 61, 529, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Jordan', 'Reed',86, 27,'TE',13, 59, 630, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Jimmy', 'Graham',88, 29,'TE',26, 57, 769, 5, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Antonio', 'Brown',84, 2,'WR',2, 88, 1052, 11, 3, 9, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Larry', 'Fitzgerald',11, 30,'WR', NULL, 88, 880, 5, 2, 5, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Mike', 'Evans',13, 22,'WR', NULL, 76, 1058, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Odell', 'Beckham',13, 26,'WR',24, 75, 1015, 8, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Stefon', 'Diggs',14, 18,'WR',25, 75, 806, 2, 3, 10, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Landon', 'Collins',21, 26,'SS',7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 76, 18, 3, 13, 5, NULL, 1);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Johnathan', 'Cyprien',37, 8,'SS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 65, 19, 1, 1, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Antoine', 'Bethea',41, 32,'SS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 68, 10, NULL, 3, 1, 1, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('T.J.', 'Ward',43, 15,'SS',39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 62, 13, 1, 7, 1, 3, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Rodney', 'McLeod',23, 28,'FS', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 59, 9, 1, 6, 3, 1, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Damon', 'Harrison',98, 26,'DT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 45, 27, 1.5, 1, NULL, 1, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Khalil', 'Mack',52, 13,'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 42, 16, 10, 3, 1, 4, 1);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('DeForest', 'Buckner',99, 32,'DE',39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 28, 26, 3, NULL, NULL, NULL, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Linval', 'Joseph',98, 18,'DT', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 29, 24, 3, NULL, NULL, 2, NULL);
insert into players (fName, lName, num, tid, pos, uid, rec, recYds, recTD, rushAtt, rushYds, rushTD, passAtt, passYds, passTD, fum, intThrown, tackles, assists, sacks, pDef, intCaught, ff, defTD)
values ('Jason', 'Pierre-Paul',90, 26,'DE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, 18, 7, 8, NULL, 3, 1);

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Views --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
Drop view if exists bestRecordInNFC;

create view bestRecordInNFC as
	select tName, div, wins, loss, tie 
	from teams
	where wins = (Select MAX(teams.wins) from teams) ;
	
select * 
from bestRecordInNFC;

Drop view if exists topThreeWR;

create view topThreeWR as
	select fName,lName, rec, recYds, recTD
	from players
	where pos='WR'
	order by recYds Desc
	limit 3;

select *
from topThreeWR;


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Roles --
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Create role Admin;
Create role Commissioner;
Create role frontOffice;

grant select, insert, update, delete on players to Admin;
grant select, insert, update, delete on teams to Admin;
grant select, insert, update, delete on divisions to Admin;
grant select, insert, update, delete on conferences to Admin;
grant select, insert, update, delete on positions to Admin;
grant select, insert, update, delete on university to Admin;
grant select, insert, update, delete on stadiums to Admin;

revoke all privileges on players to Commissioner;
revoke all privileges on teams to Commissioner;
revoke all privileges on divisions to Commissioner;
revoke all privileges on conferences to Commissioner;
revoke all privileges on positions to Commissioner;
revoke all privileges on university to Commissioner;
revoke all privileges on stadiums to Commissioner;

grant select, insert, update, delete on divisions to Commissioner;
grant select, insert, update, delete on conferences to Commissioner;
grant select, update on teams to Commissioner;
grant select on players to Commissioner;

revoke all privileges on players to frontOffice;
revoke all privileges on teams to frontOffice;
revoke all privileges on divisions to frontOffice;
revoke all privileges on conferences to frontOffice;
revoke all privileges on positions to frontOffice;
revoke all privileges on university to frontOffice;
revoke all privileges on stadiums to frontOffice;

grant select, insert, update, delete on players to frontOffice;
grant select on teams to frontOffice;

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Stored Procedures--
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Create or replace function getAlumni(text) returns 
Table(school Text, fname text, lname text) as
$$
declare
	schoolInQuestion ALIAS for $1;
BEgin
	return QUERY
	select university.uName, players.fName, players.lName
	from university, players
	where university.uid = players.uid
	and university.uName = schoolInQuestion;
End;
$$ Language plpgsql;

select *
from getAlumni('LSU');

Create or replace function teamRoster(text) returns 
Table(lname text, fname text, pos TEXT, num Int) as
$$
declare
	team ALIAS for $1;
BEgin
	return QUERY
	select players.lName, players.fName, players.pos, players.num
	from teams, players
	where teams.tid = players.tid
	and teams.tName = team
	order by players.lName asc;
End;
$$ Language plpgsql;

select *
from teamRoster('New York Giants');
