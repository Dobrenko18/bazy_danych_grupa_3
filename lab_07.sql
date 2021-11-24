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
