--a
SELECT id_pracownika , nazwisko FROM ksiegowosc.pracownicy
--b
SELECT w.id_pracownika FROM ksiegowosc.wynagrodzenie as w
join ksiegowosc.pensja as p on p.id_pensji=w.id_pensji
where kwota >1000
--c
SELECT w.id_pracownika FROM ksiegowosc.wynagrodzenie as w
join ksiegowosc.pensja as p on p.id_pensji=w.id_pensji
where kwota >2000 and p.kwota is not null
--d
select imie,nazwisko from ksiegowosc.pracownicy where imie like 'J%'
--e
select imie,nazwisko from ksiegowosc.pracownicy where nazwisko like '%n%' and imie like '%a'
--f
select p.imie, p.nazwisko,GREATEST(sum(g.liczba_godzin) - 160, 0) as nadgodziny
from  ksiegowosc.pracownicy as p
join ksiegowosc.godziny as g ON p.id_pracownika = g.id_pracownika
group by  p.id_pracownika, p.imie, p.nazwisko
having sum(g.liczba_godzin) > 160;

--g
SELECT imie,nazwisko FROM ksiegowosc.wynagrodzenie as w
join ksiegowosc.pensja as p on p.id_pensji=w.id_pensji
join ksiegowosc.pracownicy as pr on pr.id_pracownika=w.id_pracownika
where p.kwota >= 1500 and p.kwota <= 3000 

--h
select p.imie, p.nazwisko
from ksiegowosc.pracownicy as p
join ksiegowosc.wynagrodzenie as w on p.id_pracownika = w.id_pracownika
JOIN ksiegowosc.godziny as g on p.id_pracownika = g.id_pracownika
left join ksiegowosc.premia as pr on w.id_premii = pr.id_premii
where w.id_premii is null
group by p.id_pracownika,p.imie,p.nazwisko
having  sum(g.liczba_godzin) > 160 
--i
SELECT  imie, nazwisko FROM ksiegowosc.wynagrodzenie as w
join ksiegowosc.pensja as p on p.id_pensji=w.id_pensji
join ksiegowosc.pracownicy as pr on pr.id_pracownika=w.id_pracownika
order by kwota desc

--j
SELECT p.imie, p.nazwisko, pen.kwota AS pensja, pr.kwota 
FROM  ksiegowosc.pracownicy AS p
JOIN  ksiegowosc.wynagrodzenie AS w ON p.id_pracownika = w.id_pracownika
JOIN  ksiegowosc.pensja AS pen ON w.id_pensji = pen.id_pensji
LEFT JOIN  ksiegowosc.premia AS pr ON w.id_premii = pr.id_premii
ORDER BY pen.kwota DESC, pr.kwota desc

--k
SELECT pen.stanowisko,count(p.id_pracownika)
FROM  ksiegowosc.pracownicy AS p
JOIN  ksiegowosc.wynagrodzenie AS w ON p.id_pracownika = w.id_pracownika
JOIN  ksiegowosc.pensja AS pen ON w.id_pensji = pen.id_pensji
LEFT JOIN  ksiegowosc.premia AS pr ON w.id_premii = pr.id_premii
group by stanowisko


--l
SELECT sum(pen.kwota),min(pen.kwota),max(pen.kwota)
FROM  ksiegowosc.pracownicy AS p
JOIN  ksiegowosc.wynagrodzenie AS w ON p.id_pracownika = w.id_pracownika
JOIN  ksiegowosc.pensja AS pen ON w.id_pensji = pen.id_pensji
LEFT JOIN  ksiegowosc.premia AS pr ON w.id_premii = pr.id_premii
where stanowisko='Kierownik'

--m
select sum(pen.kwota)
from  ksiegowosc.pracownicy as p
join  ksiegowosc.wynagrodzenie as w on p.id_pracownika = w.id_pracownika
join  ksiegowosc.pensja as pen on w.id_pensji = pen.id_pensji
left join  ksiegowosc.premia as pr on w.id_premii = pr.id_premii
--f2 lub n 
select pen.stanowisko, sum(pen.kwota) 
from  ksiegowosc.wynagrodzenie as w 
join  ksiegowosc.pensja as pen on w.id_pensji = pen.id_pensji
group by pen.stanowisko

--g2 lun o
select pen.stanowisko , count(w.id_premii)
from  ksiegowosc.wynagrodzenie as w 
join  ksiegowosc.pensja as pen on N w.id_pensji = pen.id_pensji
left join  ksiegowosc.premia as pr on w.id_premii = pr.id_premii
group by pen.stanowisko
--h2 lub p
delete from ksiegowosc.pracownicy p
using ksiegowosc.wynagrodzenie w, ksiegowosc.pensja pen
where p.id_pracownika = w.id_pracownika and w.id_pensji = pen.id_pensji and pen.kwota < 1200;

