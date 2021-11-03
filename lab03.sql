#zadanie 1.1
create table postac( id_postaci int auto_increment primary key, nazwa varchar (40), rodzaj enum('wiking','ptak','kobieta'), data_ur date, wiek int unsigned);

#zadanie 1.2
INSERT INTO postac VALUES(default, 'Bjorn', 'wiking', '2000-02-03', '21');
INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES('Drozd', 'ptak', '2001-02-03', '20');
INSERT INTO postac (nazwa, rodzaj, data_ur, wiek) VALUES('Tesciowa', 'kobieta', '1999-06-01', '22');

#zadanie 1.3
UPDATE postac SET wiek=88 WHERE nazwa='Tesciowa';

#zadanie 2.1
create table walizka
( id_walizki int auto_increment primary key,
pojemnosc int unsigned,
kolor enum('rozowy','czerwony','teczowy','zolty'),
id_wlasciciela int, foreign key (id_wlasciciela) REFERENCES postac(id_postaci) ON DELETE CASCADE);

#zadanie 2.2
ALTER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';

#zadanie 2.3
INSERT INTO walizka(pojemnosc, id_wlasciciela) VALUES(15,1),(30,3);

#zadanie 3.1
create table izba(
adres_budynku varchar(100),
nazwa_izby varchar(100),
metraz int unsigned,
wlasciciel int, foreign key (wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL,
PRIMARY KEY(adres_budynku, nazwa_izby));

#zadanie 3.2
ALTER TABLE izba ADD COLUMN kolor_izby varchar(100) DEFAULT 'czarny' AFTER metraz;

#zadanie 3.3
insert INTO izba(adres_budynku, nazwa_izby, metraz, wlasciciel) VALUES ('Naglady13', 'spizarnia', 50, 1);

#zadanie 4.1
create table przetwory(
id_przetworu int auto_increment PRIMARY KEY,
rok_produkcji INT(4) DEFAULT 1654,
id_wykonawcy int, FOREIGN KEY (id_wykonawcy) REFERENCES postac(id_postaci),
zawartosc varchar(100),
dodatek varchar(100) DEFAULT 'papryczka chilli',
id_konsumenta int, FOREIGN KEY (id_konsumenta) REFERENCES postac(id_postaci));

#zadanie 4.2
insert INTO przetwory(id_wykonawcy, zawartosc, id_konsumenta) VALUES (1,'bigos z papryczka chilli', 3);

#zadanie 5.1
INSERT INTO postac(nazwa, rodzaj, data_ur, wiek) VALUES
    ('Rudy', 'wiking', '1990-02-04', 31 ),
    ('Czarny', 'wiking', '1990-01-02', 31),
    ('Torvi', 'wiking', '1990-05-04', 31),
	('Rollo', 'wiking', '1990-03-19', 31),
	('Kebab', 'wiking', '1990-02-19', 31);
#zadanie 5.2
CREATE TABLE statek
(nazwa_statku varchar(255) primary key, 
rodzaj_statku enum("maly","sredni","duzy"),
data_wodowania INT(4) DEFAULT 1654,
max_ladownosc int unsigned);

#zadanie 5.3
INSERT INTO statek(nazwa_statku, rodzaj_statku,max_ladownosc) VALUES
    ('Tytanik', 'sredni',500 ),
    ('Mors', 'maly',  300);
	
#zadanie 5.4
ALTER TABLE postac ADD funkcja varchar(255);

#zadanie 5.5
UPDATE postac SET funkcja='kapitan' WHERE nazwa='Bjorn';

#zadanie 5.6 
ALTER TABLE postac ADD COLUMN nazwa_statku varchar(255);
ALTER TABLE postac add foreign key(nazwa_statku) REFERENCES statek(nazwa_statku);

#zadanie 5.7
UPDATE postac SET nazwa_statku='tytanik' WHERE nazwa='RUDY' OR nazwa='Drozd' OR nazwa='Rollo';
UPDATE postac SET nazwa_statku='Mors' WHERE nazwa='Czarny' OR nazwa='Torvi' OR nazwa='Kebab';

\\UPDATE postac set nazwa_statku='tytanik' WHERE id_postaci int (1,2,3,4,5)\\

#zadanie 5.8 
DELETE FROM izba WHERE nazwa_izby='spizarnia';

#zadanie 5.9
DROP TABLE izba;

lab04
#zadanie 1 a)
select * from postac where rodzaj='wiking' order by data_ur asc limit 2;

delete from postac where nazwa='czarny' OR nazwa='rudy';

#zadanie 1 b)
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_2;
ALTER TABLE postac MODIFY id_postaci int;
ALTER TABLE postac DROP PRIMARY KEY;

#zadanie 2 a)
ALTER TABLE postac ADD COLUMN pesel char(11);
UPDATE postac set pesel=12345678901 + id_postaci;
ALTER TABLE postac add primary key (pesel);

#zadanie 2 b)
ALTER TABLE postac MODIFY rodzaj enum('wiking','ptak','kobieta','syrena');

#zadanie 2 c)
INSERT INTO postac(id_postaci, nazwa, rodzaj, data_ur, wiek,pesel) VALUES
    (9,'Gertruda Nieszczera', 'syrena', '1921-01-22', 100, '12345678910');

#zadanie 3 a)
select nazwa from postac where nazwa like '%a%';
UPDATE postac SET nazwa_statku='tytanik' Where nazwa like'%a%';

#zadanie 3 b)
UPDATE statek set max_ladownosc*0,7; WHERE data_wodowania >= '1990-02-01' and data_wodowania <= '1990-06-01';

