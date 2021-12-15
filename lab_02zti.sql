select * from pracownik order by nazwisko ASC;
select imie, nazwisko, pensja from pracownik where data_urodzenia>'1979-01-01';
select * from pracownik where pensja between 3500 AND 5000;
select * from stan_magazynowy where ilosc>10;
select * from towar where nazwa_towaru like 'A%'OR nazwa_towaru like'B%'or nazwa_towaru like'C%';
