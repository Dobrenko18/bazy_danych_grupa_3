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
