Program CA_1D_pseudo_life;
Const
p0=0.75;
Last=301; {nieparzyste wieksze od 1}
Steps=400;
Var
Swiat:array[1..Last]of integer;
NowyS:array[1..Last]of integer;
krok:integer;
plik:text;

Procedure zeruj;
Var
i:integer;
Begin
For i:=1 to Last do
Swiat[i]:=0;
end;


Procedure przepisz;
Var
i:integer;
Begin
For i:=1 to Last do
Swiat[i]:=NowyS[i];
end;


Procedure wypisz(linia:integer);
Var
i:integer;
Begin
For i:=1 to Last do
begin
If Swiat[i]=0 then
Pen(1,0,0,0)
else
Pen(1,255,0,0);
Point(i,linia);
end;
end;


procedure wyrysuj;
var i:integer;
begin
for i:=1 to Last do
begin
if Swiat[i]=0 then
Pen(1,0,0,1)
else
Pen(1,255,255,0);
Line(i,15,i,24);
end;
end;



Procedure losuj;
Var
i:integer;
Begin
For i:=1 to Last do
If random < p0 then
Swiat[i]:=0
else
Swiat[i]:=1;
end;


Procedure zrob_krok;
Var
i,j,k:integer;
sas:integer;
Begin
For j:=1 to Last do
Begin
sas:=0;
i:=j-1;
k:=j+1;
If(i>0)and(Swiat[i]>0)then
sas:=sas+1;
If(k<=Last)and(Swiat[k]>0)then
sas:=sas+1;
If sas=1 then
NowyS[j]:=1
else
NowyS[j]:=0;
end;
end;


function ile_zywych:integer;
var
i:integer;
licznik:integer;
begin
licznik:=0;
for i:=1 to Last do
licznik:=licznik+Swiat[i];
ile_zywych:=licznik;
end;




{Begin}
{Zeruj;}
{Swiat[1]:=1;}
Begin
assign(plik,'c:\ca.out');
rewrite(plik);
writeln(plik,'N=',Last,'P0=',p0);
{Zeruj;}
losuj;
WriteLn('Automat jednomiarowe zycie o ',Last,' kamorkach i PO=',p0);

For krok:=0 to Steps do
Begin
wyrysuj;
{Write(krok : 3,')');}
wypisz(25+krok);;
writeln(plik,ile_zywych);
{Zrob_i_zapisz_statystyke;}
zrob_krok;
przepisz;

end;
close(plik);
writeln;
Writeln('Dziekuje i polecam');

end.
