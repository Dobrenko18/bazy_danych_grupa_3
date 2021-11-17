lab_06
Zad 1 1)
select avg(waga) from kreatura where rodzaj='wiking';

2)
SELECT rodzaj,AVG(waga) from kreatura GROUP BY rodzaj;

3)
select (2021-Year(dataUr)) as wiek from kreatura;

Zad 2 1)
select count(waga),rodzaj from zasob group by rodzaj;

2)
select nazwa,avg(waga) 
from zasob where ilosc >=4
group by nazwa having avg (waga)>10;

3)
select rodzaj, count(distinct nazwa) 
from zasob
group by rodzaj having min(ilosc) > 1;

#zadanie 3 1)
select nazwa,count(ilosc) from kreatura k 
INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury
GROUP BY nazwa;

2)
select k.nazwa,z.nazwa from kreatura k 
INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury
INNER JOIN zasob z ON e.idZasobu=z.idZasobu;


#left join
select k.nazwa, k.idKreatury ,e.idKreatury from kreatura k 
LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury

czasami po prawej moga być nule

#left join
select k.nazwa, k.idKreatury ,e.idKreatury from kreatura k 
LEFT JOIN ekwipunek e ON k.idKreatury=e.idKreatury
where e.idKreatury is NULL;

# podzapytanie
select idKreatury from kreatura where idKreatury not in
(select distinct idKreatury from ekwipunek
where idKreatury is not NULL);

