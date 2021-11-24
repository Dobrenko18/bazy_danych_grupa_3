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

#zadanie 4
4.2
select * from kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
where z.rodzaj='jedzenie' order by k.dataUr desc limit 5;
4.3
select nazwa, idKreatury, nazwa, idKreatury from kreatura;
select * from kreatura k
inner join kreatura k2 on k2.idKreatury-k1.idKreatury=5;

#zadanie 5
1.
select k.rodzaj, sum(e.ilosc), avg(e.ilosc*z.waga)
from kreatura k
inner join ekwipunek e on k.idKreatury=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
where k.rodzaj not in ('malpa','waz') and e.ilosc <30
group by k.rodzaj having sum(e.ilosc) < 30;
2.
select k.nazwa, k.rodzaj, k.dataUr from kreatura k,
(select rodzaj, min(dataUr) as min, max(dataUr) as max from kreatura 
group by rodzaj) as pod
where k.dataUr=pod.min or k.dataUr=pod.max and k.rodzaj=pod.rodzaj;
