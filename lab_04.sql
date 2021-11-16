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

#zadanie 3 c)

SELECT * from postac WHERE wiek>1000;

#zadanie 4 a)
1. Dodajemy nowy rodzaj postaci - wąż (raczej waz lub wonsz)
2. INSERT INTO ...

ALTER TABLE postac MODIFY  rodzaj enum('wiking','ptak','kobieta','syrena','wonsz');

INSERT INTO postac(id_postaci,nazwa,rodzaj, data_ur,wiek,pesel) VALUES
(9,'Loko','wonsz','1658-05-02', 15,'12345678910');

#zadanie 4 b)
Sp 1:
CREATE TABLE marynarz LIKE postac;
# tylko struktura, bez danych, odtwarza również klucz główny
INSERT INTO marynarz SELECT * FROM postac WHERE nazwa_statku is not NULL;

zrobiłem 1

Sp 2:
CREATE TABLE marynarz2 SELECT * FROM postac WHERE statek is not NULL;
# ale nie ma klucza głównego
ALTER TABLE marynarz2 ADD PRIMARY KEY(id_postaci);

#zadanie 4 c)
c) opcjonalnie należy dodać PRIMARY KEY (jeżeli użyto sposobu nr 2)
i dodać klucze obce bez względu na wybrany sposób.

Alter table marynarz add FOREIGN KEY (nazwa_statku) REFERENCES statek(nazwa_statku);

#zadania 5
a)

UPDATE marynarz SET nazwa_statku=NULL WHERE nazwa_statku is not null;

b)
DELETE FROM postac where nazwa='Ragnar';

c) 

ALTER TABLE marynarz
DROP FOREIGN KEY marynarz_ibfk_1;


ALTER TABLE postac
DROP FOREIGN KEY postac_ibfk_1;

DELETE  FROM statek ;


d)

DROP TABLE statek;

e)

CREATE TABLE zwierz
(id int auto_increment primary key, 
nazwa VARCHAR(50),
wiek INT);
