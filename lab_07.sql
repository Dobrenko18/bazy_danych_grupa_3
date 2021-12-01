#zadanie 1
2.
select * from kreatura k
left join uczestnicy u on k.idKreatury=u.id_uczestnika
where u.id_uczestnika is null;
3.
select w.nazwa, sum(e.ilosc) from wyprawa w 
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on u.id_uczestnika=e.idKreatury
group by w.id_wyprawy;

bardziej fajniej 

select w.nazwa, sum(e.ilosc), group_concat(z.nazwa,'->',e.ilosc) from wyprawa w 
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join ekwipunek e on u.id_uczestnika=e.idKreatury
inner join zasob z on e.idZasobu=z.idZasobu
group by w.id_wyprawy;

#zadanie 2
1.
select w.nazwa, count(u.id_uczestnika), group_concat(k.nazwa) 
from wyprawa w
inner join uczestnicy u on w.id_wyprawy=u.id_wyprawy
inner join kreatura k on k.idKreatury=u.id_uczestnika
group by w.id_wyprawy;

2.
select w.data_rozpoczecia, w.nazwa, k.nazwa, ew.kolejnosc
from kreatura k
inner join wyprawa w on w.kierownik=k.idKreatury
inner join etapy_wyprawy ew on ew.idWyprawy=w.id_wyprawy
inner join sektor s on ew.sektor=s.id_sektora
order by w.data_rozpoczecia, ew.kolejnosc;

#zadanie 3
1.
select s.nazwa, ifnull(cout(ew.sektor),0)
from sektor s 
left join etapy_wyprawy ew on s.id_sektora=ew.sektor
group by s.id_sektora;

cos zle

2.
select s.nazwa ,
if(count(ew.sektor) is null, 0, count(ew.sektor))
from sektor s
left join etapy_wyprawy ew on s.id_sektora=ew.sektor
group by s.id_sektora;

#zadanie 4
1.
select idWyprawy ,sum(length(dziennik)) suma_dlugosci
from etapy_wyprawy
group by idWyprawy
having suma_dlugosci < 400;

2.


