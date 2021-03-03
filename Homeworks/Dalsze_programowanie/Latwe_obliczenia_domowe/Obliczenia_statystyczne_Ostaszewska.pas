Program Zlicz_PsychTest;

type
 dane=array [1..100] of real;
var
 liczby: dane;
 menu: char;
ilosc: integer;

{w kroku pierwszym prosimy o dane liczbowe z testu}
procedure pobierzdane (var n:dane);
begin
 ilosc:=0;
repeat 
ilosc:=ilosc + 1;
write('Podaj liczbê lub 0, aby zakoñczyæ: ');
readln (n[ilosc]);
until (n[ilosc]=0) or (ilosc=100);
if n[ilosc]=0 then ilosc:=ilosc-1;
end;

{ta funkcja pozwoli na zsumowanie danych}
function razem (n:dane):real;
var
licznik: integer;
temp:real;
begin
temp:=0;
for licznik:=1 to ilosc do
temp:=temp+n[licznik];
razem:=temp;
end;

{wywo³uj¹c tê funkcjê z menu uzyskamy œredni¹ wprowadzonych danych}
function srednia (n:dane):real;
begin
srednia:=razem(n)/ilosc;
end;

{Aby dowiedzieæ siê, jaka jest najwiêkszy wprowadzony wynik}
function maks (n:dane):real;
var
licznik: integer;
najwieksza:real;

begin
najwieksza:=n[1];
for licznik:=2 to ilosc do
if n[licznik]>najwieksza then najwieksza:=n[licznik];
maks:=najwieksza;
end;

{Aby dwiedzieæ siê jaka jest wartoœæ najmniejsza z wprowadzonych danych}
function min (n:dane):real;
var
licznik: integer;
najmniejsza:real;

begin
najmniejsza:=n[1];
for licznik:=2 to ilosc do
if n[licznik]<najmniejsza then najmniejsza:=n[licznik];
min:=najmniejsza;
end;

{poni¿sza procedura nakreœli nam na prostym wykresie
s³upkowym - poziomym, wartoœci, które wprowadziliœmy.
"Na oko" ³atwiej siê zorientowaæ w rozk³adzie danych}
procedure wykres (n:dane);
var
licznik: integer;
linia: integer;

begin
for licznik:=1 to ilosc do
begin
for linia:=1 to round (n[licznik]) do 
write('_');
writeln (n[licznik]:0:2);
end;
end;
{a oto program g³ówny:}
BEGIN
{mi³e nieco starodawne, ale uspokajaj¹ce,zielone t³o :) }
brush(1,120,200,40);
fill(1,1);
textcolor(100,0,128); 
font(10,0,800); 
writeln ('Tu wprowadŸ dane liczbowe z badania *zmienne iloœciowe*:');
font(8,0,20);
pobierzdane (liczby);
repeat
writeln (' ');
textcolor(100,0,128);
font(10,0,800);
writeln (' Co chcesz wykonaæ z wprowadzonymi danymi? : ');
textcolor(10,0,200);
font(8,0,20);
{menu}
writeln ('Wykres wprowdzonych ju¿ danych (bardzo prosty :) poziomy)...1');
writeln ('Suma wprowadzonych ju¿ danych...............................2');
writeln ('Œrednia wprowadzonych ju¿ danych............................3');
writeln ('Maksimum....................................................4');
writeln ('Minimum.....................................................5');
writeln ('Zakoñcz program................................. ...........6');


readln(menu);
textcolor(255,0,20); 
font(9,0,800); 

{a teraz kwestia tego, co wybierze u¿ytkownik,
po pierwszym wyborze i wykonaniu zadania, dostanie
on ponown¹ szansê wyboru tak, aby móc przeœledziæ
na swoich danych wszystkie wymienione ni¿ej operacje.}
case menu of
'1': wykres (liczby);
'2': writeln ('Suma wszystkich liczb to: ', razem(liczby):0:2);
'3': writeln ('Œrednia wprowadzonych danych wynosi: ', srednia(liczby):0:2);
'4': writeln ('Najwy¿szy wynik to: ',maks(liczby):0:2);
'5': writeln ('Najni¿szy wynik to: ', min(liczby):0:2);
'6': writeln('Koñczymy. Zapraszamy ponownie!!!');
else writeln ('B³¹d. Proszê, wybierz ponownie pozycjê z menu');
end;
{a tak zakoñczmy pracê:}
until menu = '6';
END.


