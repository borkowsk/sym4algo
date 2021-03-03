program Statystyki;
const maxTablica=50;
type Tablica=array[1..maxTablica] of real;



procedure wczytaj(var tab:Tablica; var dlugosc:integer);
  var i:integer;
begin
  write('Ile bedzie liczb? <1..',maxTablica,'>: ') ;
  readln(dlugosc);
  writeln('Podaj wartoœci: ');
  for i:=1 to dlugosc do
  begin
    write('Wartosc ',i :3,': ');
    readln(tab[i]);
  end;
end;
 
function suma(tab:Tablica; dlugosc:integer):real;
  var i:integer;
  s:real;
begin
  s:=0;
  for i:=1 to dlugosc do
    s:=(s+tab[i]);
  suma:=s;
end; 
  
function srednia(tab:Tablica; dlugosc:integer):real;
begin
  srednia:=suma(tab, dlugosc)/dlugosc;
end;

function liczbaZer(tab:Tablica; dlugosc:integer):integer;
  var i, ile:integer;
begin
  ile:=0;
  for i:=1 to dlugosc do
    if(tab[i]=0) then ile:=ile+1;
  liczbaZer:=ile;
end; 
  
function sredniaZn(tab:Tablica; dlugosc:integer; znak:integer):real;
  var i, ile:integer;
  s:real;
begin
  ile:=0;
  s:=0;
  for i:=1 to dlugosc do
    if(znak*tab[i]>0) then
    begin
      ile:=ile+1;
      s:=s+tab[i];
    end;
  if(ile<>0) then
    sredniaZn:=s/ile
  else
    write('Brak wartosci o tym znaku!');
end; 

function odchStand(tab:Tablica; dlugosc:integer):real;
  var i:integer;
  sred, s:real;
begin
  s:=0;
  sred:=srednia(tab, dlugosc);
  for i:=1 to dlugosc do
    s:=s+(tab[i]-sred)*(tab[i]-sred);
  odchStand:=sqrt(s/dlugosc);
end;



var tab:Tablica;
  rozmTab, z:integer;

begin
  wczytaj(tab, rozmTab);
  writeln;
  writeln('Suma:              ', suma(tab, rozmTab) :8:2);
  writeln('Srednia:           ', srednia(tab, rozmTab) :8:2);
  writeln('Liczba zer:        ', liczbaZer(tab, rozmTab) :5);
  writeln('Srednia ujemnych:  ', sredniaZn(tab, rozmTab, -1) :8:2);
  writeln('Srednia dodatnich: ', sredniaZn(tab, rozmTab, 1) :8:2);
  writeln('Odch. standardowe: ', odchStand(tab, rozmTab) :8:2);
end.
