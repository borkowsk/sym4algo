Program Zlicz_PsychTest;

type
 dane=array [1..100] of real;
var
 liczby: dane;
 menu: char;
ilosc: integer;

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

function srednia (n:dane):real;
begin
srednia:=razem(n)/ilosc;
end;

function wariancja (n:dane):real;
var
licznik: integer;
suma: real;
df: integer;
gora: real;
temp: real;
begin
suma:=0;
gora:=0;
df:=0;
for licznik:=1 to ilosc do
suma:=suma + sqr(n[licznik]-srednia(n));
df:=(ilosc-1);
begin
wariancja:=suma/df;
end;
end;

function odchylenie (n:dane):real;
begin
odchylenie:=sqrt(wariancja(n));
end;

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

procedure wykres (n:dane);
var
licznik: integer;
maxx: real;
begin
Clear;
brush(1,120,200,40);
fill(1,1);
textcolor(100,0,128);
font(10,0,800);
maxx:=maks(n)+30;
for licznik:=1 to ilosc do
begin
 write(n[licznik]:0:2);
 brush(155,100,10,10);
 Rectangle(round(500*(licznik-1)/ilosc),600-round(500*n[licznik]/maxx),round(500*licznik/ilosc),600);
brush(1,120,200,40);
end;
MoveTo(0,600);
end;

BEGIN
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
writeln ('Wykres wprowdzonych ju¿ danych .............................1');
writeln ('Suma wprowadzonych ju¿ danych...............................2');
writeln ('Œrednia wprowadzonych ju¿ danych............................3');
writeln ('Maksimum....................................................4');
writeln ('Minimum.....................................................5');
writeln ('Wariancja...................................................6');
writeln ('Odchylenie standardowe......................................7');
writeln ('Zakoñcz program.............................................8');


readln(menu);
textcolor(255,0,20); 
font(9,0,800); 

case menu of
'1': wykres (liczby);
'2': writeln ('Suma wszystkich liczb to: ', razem(liczby):0:2);
'3': writeln ('Œrednia wprowadzonych danych wynosi: ', srednia(liczby):0:2);
'4': writeln ('Najwy¿szy wynik to: ',maks(liczby):0:2);
'5': writeln ('Najni¿szy wynik to: ', min(liczby):0:2);
'6': writeln ('Wariancja wyników wynosi: ', wariancja(liczby):0:2);
'7': writeln ('Odchylenie standardowe wynosi: ',odchylenie(liczby):0:2);
'8': writeln('Koñczymy. Zpraszamy ponownie!!!');
else writeln ('B³¹d. Proszê, wybierz ponownie pozycjê z menu');
end;
until menu = '8';
END.

