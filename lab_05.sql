Lab 5 
zadanie 1 a)
#aktywna imienna baza
Create table kreatura Select * From wikingowie.kreatura;
#aktywna baza wikin
Create table dobrenkon.zasoby Select * from zasoby;

CREATE TABLE dobrenkon.kreatura SELECT * from kreatura;
CREATE TABLE dobrenkon.zasob SELECT * from zasob;
CREATE TABLE dobrenkon.ekwipunek SELECT * from ekwipunek;

#zadanie 1 b)
select * from zasob;

#zadanie 1 c)
select * from zasob where rodzaj='jedzenie';
#zadanie 1 d)
select idZasobu , nazwa from zasob where idZasobu IN(3,5,7);

#zadanie 2 a)

SELECT * from kreatura where rodzaj IN( 'ryba', 'wiking','waz','ptak','malpa') AND udzwig>=50;
SELECT * from kreatura where rodzaj NOT IN( 'wiedzma') AND udzwig>=50;

#zadanie 2 b)
SELECT * from zasob WHERE waga BETWEEN 2 AND 5;
SELECT * from zasob where waga>=2 and waga<=5;

#zadanie 2 c)
SELECT * from kreatura  WHERE waga BETWEEN 30 AND 70 AND nazwa LIKE '%or%'  ;

#zadanie 3 a)
select dataPozyskania from zasob where month(datapozyskania) in (7,8);

select nazwa from zasob where month(datapozyskania) in (7,8);

#zadanie 3 b)

select nazwa from zasob where rodzaj is not null order by waga asc;

#zadanie 3 c)

select data_Ur , nazwa from krestura order by data_ur asc limit 5;

select data_Ur , nazwa from krestura order by data_ur asc limit 5,3;

#zadanie 4 a)
Select distinct rodzaj from kreatura;
lub
Select distinct(rodzaj) from kreatura;

#zadanie 4 b)
metoda concat(kolumna, 'tekst', funkcja());
