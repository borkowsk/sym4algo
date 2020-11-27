Program Berek;
{Program "Berek", zmodyfikowany przez: Przemyslawa Zapedowskiego}

label 0001;
label 0002;

const
{Stale definiujace rozmiary planszy}
MaxX=500;
MaxY=500;
R=10;
{Stale opisujace zdarzenie generowane przez ALGO}
ZdarzenieKlawiatury=1;
ZdarzenieLewyPrzycisk=2;
ZdarzenieLewyWleczenie=3;
{Typ rekordowy dla gracza}

type
gracz=record
x,y:real; {Polozenie}
vx,vy:real;{Predkosc}
r,g,b:integer; {Kolor}
end;

procedure InicjujGracza(var gr:gracz;x,y:real;r,g,b:integer);
{Ustala poczatkowe parametry gracza}

begin
gr.x:=x;
gr.y:=y;
gr.r:=r;
gr.g:=g;
gr.b:=b;
gr.vx:=0;
gr.vy:=0;
end;

procedure GraczWchodzi(var gr:gracz);
{Rysuje gracza w aktualnej pozycji}
begin
brush(1,gr.r,gr.g,gr.b);
pen(10,gr.r,gr.g,gr.b);
ellipse( round(gr.x-R),round(gr.y-R),
round(gr.x+R),round(gr.y+R));
pen(5,0,0,0);
line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y));
line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy));
end;

procedure GraczZnika(var gr:gracz);
{Zamazuje gracza w aktualnej pozycji}
begin
brush(1,25,255,25);
pen(1,255,255,255);
ellipse( round(gr.x-R),round(gr.y-R),
round(gr.x+R),round(gr.y+R) );
pen(5,0,0,0);
end;

procedure RuchGracza(var gr:gracz);
{Przemieszcza gracza zgodnie z zasadami prostej fizyki}
var
vx,vy,nx,nx1,ny,ny1:real;

begin
if gr.vx>R then gr.vx:=R;
if gr.vx<-R then gr.vx:=-R;
if gr.vy>R then gr.vy:=R;
if gr.vy<-R then gr.vy:=-R;
 nx:=gr.x+gr.vx;
 ny:=gr.y+gr.vy;

{Z lewej}
if (nx-R<=1)then
begin
nx:=R+1; gr.vx:=0;
end;

{Przeszkoda nr 1}
if (nx-R<=400)and(ny-R<=70)and(nx-R>=100)and(ny-R>=50)then
begin
gr.vx:=0;
gr.vy:=0;
end;

{Przeszkoda nr 2}
if (nx-R<=400)and(ny-R<=450)and(nx-R>=100)and(ny-R>=430)then
begin
gr.vx:=0;
gr.vy:=0;
end;

{Przeszkoda nr 3}
if (nx-R<=70)and(ny-R<=400)and(nx-R>=50)and(ny-R>=100)then
begin
gr.vx:=0;
gr.vy:=0;
end;

{Przeszkoda nr 4}
if (nx-R<=450)and(ny-R<=400)and(nx-R>=430)and(ny-R>=100)then
begin
gr.vx:=0;
gr.vy:=0;
end;

{Przeszkoda nr 5}
if (nx-R<=332)and(ny-R<=332)and(nx-R>=166)and(ny-R>=166)then
begin
gr.vx:=0;
gr.vy:=0;
end;

{z prawej }
if nx+R>=MaxX then
begin
nx:=MaxX-R; gr.vx:=0;
end;

{z góry}
if ny-R<=1 then
begin
ny:=R+1; gr.vy:=0;
end;


{z dolu}
if ny+R>=MaxY then
begin
ny:=MaxY-R; gr.vy:=0;
end;


gr.x:=nx;
gr.y:=ny;
end;

function koniec(var uciek,pogon:gracz):boolean;
{Sprawdza czy uciekinier nie zostal zlapany}

begin
koniec:=(sqr(uciek.x-pogon.x)
+sqr(uciek.y-pogon.y))<sqr(2*R);
end;
 function sign(x:real):real;
{Zwraca:
 -1 dla liczb ujemnych,
 1 dla dodatnich i 0 dla 0}
begin
if x>0 then sign:=1
else if x<0 then sign:=-1
else sign:=0;
end;
 
procedure ObslugaZdarzen(var uciek,pogon:gracz);
{Obsluguje sterowanie za pomoca zdarzen}
Var
typ_zdarzenia, x, y,oldx,oldy: integer;
Begin
while IsEvent do
begin
Event(typ_zdarzenia, x, y);
case typ_zdarzenia of
ZdarzenieLewyPrzycisk:
begin
pogon.vx:=pogon.vx+2*sign(x-pogon.x);
pogon.vy:=pogon.vy+2*sign(y-pogon.y);
end;
ZdarzenieLewyWleczenie:
begin
pogon.vx:=pogon.vx+sign(x-pogon.x);
pogon.vy:=pogon.vy+sign(y-pogon.y);
end;
ZdarzenieKlawiatury:
begin
case x of
37:uciek.vx:=uciek.vx-2;
38:uciek.vy:=uciek.vy-2;
39:uciek.vx:=uciek.vx+2;
40:uciek.vy:=uciek.vy+2;
end;
end;
end;
end;
end;
{Glówne zmienne programu}
var
uciekacz,poganiacz:gracz;
wynik:integer;
{Kod programu glownego}

procedure GameOver(wynik:integer);
{Procedurka efektów specjalnych konca gry}
const width=500;
height=500;
procedure dodaj_punkt;
var x,y:integer;
begin
x:=random(width);
y:=random(height);
Point(x,y);
end;
procedure wylosuj_kolor;
var r,g,b:integer;
begin
r:=random(256);
g:=random(256);
b:=random(256);
Pen(500,r,g,b);
end;
label 0001;
label 0002;
label 0003;

var h:integer;
begin
 h:=0;
 repeat
 h:=h+1;
 wylosuj_kolor;
 dodaj_punkt;
 until h>800000;
  Font(20,10,500);
  MoveTo(20,20);
  write('G');
  Font(20,10,500);
  MoveTo(60,60);
  write('A');
  Font(20,10,500);
  MoveTo(100,100);
  write('M');
  Font(20,10,500);
  MoveTo(140,140);
  write('E');
  Font(20,10,500);
  MoveTo(340,140);
  write('O');
  Font(20,10,500);
  MoveTo(380,100);
  write('V');
  Font(20,10,500);
  MoveTo(420,60);
  write('E');
  Font(20,10,500);
  MoveTo(460,20);
  write('R');
  Font(10,0,60);
  MoveTo(20,280);
  write('Uciekinier przetrwal ',wynik,' dziesiatych sekundy');
  Font(20,15,250);
  MoveTo(20,400);
  write('Zagrasz jeszcze raz?');
  Font(15,0,60);
  MoveTo(150,450);
  write('Tak(T)/Nie(N):');
end;



var
b:integer;

begin
0001:
Font(8,0,60);
moveto(0,MaxY+40);
writeln('Zasady gry:');
writeln('Czerwony uciekinier (GRACZ I) sterowany strzalkami musi');
writeln('jak najdluzej wymykac sie niebieskiemu zaganiaczowi');
writeln('(GRACZ II) sterowanemu myszka. Przeszkody("SPOWALNIACZE")');
writeln('powoduja wytracanie predkosci przez graczy.');

wynik:=0;
InicjujGracza(uciekacz,50,50,255,0,0);
InicjujGracza(poganiacz,MaxX-50,MaxY-50,0,255,255);

brush(1,95,25,235);
pen(1,255,255,255);
rectangle(0,0,maxx,maxy);

brush(1,50,25,235);
pen(1,255,255,255);
rectangle(100,50,400,70);

brush(1,50,25,235);
pen(1,255,255,255);
rectangle(100,430,400,450);

brush(1,50,25,235);
pen(1,255,255,255);
rectangle(50,100,70,400);

brush(1,50,25,235);
pen(1,255,255,255);
rectangle(430,100,450,400);

brush(1,50,25,235);
pen(1,255,255,255);
rectangle(166,166,332,332);


GraczWchodzi(uciekacz);
GraczWchodzi(poganiacz);
repeat
ObslugaZdarzen(uciekacz,poganiacz);
GraczZnika(uciekacz);
RuchGracza(uciekacz);
GraczWchodzi(uciekacz);
GraczZnika(poganiacz);
RuchGracza(poganiacz);
GraczWchodzi(poganiacz);
Font(0,0,60);
moveto(20,5);
writeln('GRACZ I');
Font(0,0,60);
moveto(420,480);
writeln('GRACZ II');
Font(0,0,60);
moveto(170,170);
writeln('S');
Font(0,0,60);
moveto(185,185);
writeln('P');
Font(0,0,60);
moveto(200,200);
writeln('0');
Font(0,0,60);
moveto(215,215);
writeln('W');
Font(0,0,60);
moveto(230,230);
writeln('A');
Font(0,0,60);
moveto(245,245);
writeln('L');
Font(0,0,60);
moveto(260,260);
writeln('N');
Font(0,0,60);
moveto(275,275);
writeln('I');
Font(0,0,60);
moveto(290,290);
writeln('A');
Font(0,0,60);
moveto(305,305);
writeln('C');
Font(0,0,60);
moveto(320,320);
writeln('Z');

Font(0,0,60);
moveto(55,100);
writeln('S');
Font(0,0,60);
moveto(55,125);
writeln('P');
Font(0,0,60);
moveto(55,150);
writeln('0');
Font(0,0,60);
moveto(55,175);
writeln('W');
Font(0,0,60);
moveto(55,200);
writeln('A');
Font(0,0,60);
moveto(55,225);
writeln('L');
Font(0,0,60);
moveto(55,250);
writeln('N');
Font(0,0,60);
moveto(55,275);
writeln('I');
Font(0,0,60);
moveto(55,300);
writeln('A');
Font(0,0,60);
moveto(55,325);
writeln('C');
Font(0,0,60);
moveto(55,350);
writeln('Z');

Font(0,0,60);
moveto(435,100);
writeln('S');
Font(0,0,60);
moveto(435,125);
writeln('P');
Font(0,0,60);
moveto(435,150);
writeln('0');
Font(0,0,60);
moveto(435,175);
writeln('W');
Font(0,0,60);
moveto(435,200);
writeln('A');
Font(0,0,60);
moveto(435,225);
writeln('L');
Font(0,0,60);
moveto(435,250);
writeln('N');
Font(0,0,60);
moveto(435,275);
writeln('I');
Font(0,0,60);
moveto(435,300);
writeln('A');
Font(0,0,60);
moveto(435,325);
writeln('C');
Font(0,0,60);
moveto(435,350);
writeln('Z');

Font(0,0,60);
moveto(105,50);
writeln('S');
Font(0,0,60);
moveto(130,50);
writeln('P');
Font(0,0,60);
moveto(155,50);
writeln('0');
Font(0,0,60);
moveto(180,50);
writeln('W');
Font(0,0,60);
moveto(205,50);
writeln('A');
Font(0,0,60);
moveto(230,50);
writeln('L');
Font(0,0,60);
moveto(255,50);
writeln('N');
Font(0,0,60);
moveto(280,50);
writeln('I');
Font(0,0,60);
moveto(305,50);
writeln('A');
Font(0,0,60);
moveto(330,50);
writeln('C');
Font(0,0,60);
moveto(355,50);
writeln('Z');

Font(0,0,60);
moveto(105,430);
writeln('S');
Font(0,0,60);
moveto(130,430);
writeln('P');
Font(0,0,60);
moveto(155,430);
writeln('0');
Font(0,0,60);
moveto(180,430);
writeln('W');
Font(0,0,60);
moveto(205,430);
writeln('A');
Font(0,0,60);
moveto(230,430);
writeln('L');
Font(0,0,60);
moveto(255,430);
writeln('N');
Font(0,0,60);
moveto(280,430);
writeln('I');
Font(0,0,60);
moveto(305,430);
writeln('A');
Font(0,0,60);
moveto(330,430);
writeln('C');
Font(0,0,60);
moveto(355,430);
writeln('Z');

delay(100);
wynik:=wynik+1;
Font(15,0,60);
moveto(0,MaxY+10);
writeln('Wynik uciekiniera:',Wynik);
until koniec(uciekacz,poganiacz);
GameOver(wynik);
 
   read(b);
  if b=1 then goto 0001;
  if b=2 then goto 0002;

0002:write;

end.
