Program berekMyszyZKlawiatura;
const
maxx=550;
maxy=450;
R=20;
zdarzenieklawiatury=1;
zdarzenieLewyPrzycisk=2;
zdarzenieLewyWleczenie=3;
type
gracz=record
x,y:real;
vx,vy:real;
r,g,b:integer;
end;
procedure inicjujGracza(var gr:gracz;x,y:real;r,g,b:integer);
begin
gr.x:=x;
gr.y:=y;
gr.r:=r;
gr.g:=g;
gr.b:=b;
gr.vx:=0;
gr.vy:=0;
end;
procedure graczWchodzi(var gr:gracz);
begin
brush(1,gr.r,gr.g,gr.b);
pen(1,gr.r,gr.g,gr.b);
ellipse(round(gr.x-R),round(gr.y-R),
        round(gr.x+R),round(gr.y+R));
pen(5,0,0,0);
line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y));
line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy));
end;

procedure graczZnika(var gr:gracz);
begin
brush(1,255,255,255);
pen(1,255,255,255);
ellipse(round(gr.x-R),round(gr.y-R),
        round(gr.x+R),round(gr.y+R));
pen(1,0,0,0);
end;

procedure ruchGracza(var gr:gracz);
var
vx,vy,nx,ny:real;
begin
if gr.vx>R then gr.vx:=R;
if gr.vx<-R then gr.vx:=-R;
if gr.vy>R then gr.vy:=R;
if gr.vx<-R then gr.vx:=-R;

nx:=gr.x+gr.vx;
ny:=gr.y+gr.vy;
if nx-R<=1 then
begin
nx:=R+1; gr.vx:=0;
end;
if nx+R>=maxx then
begin
nx:=maxx-R;gr.vx:=0;
end;
if ny-R<=1 then
begin
nx:=R+1; gr.vy:=0;
end;
if ny+R>=maxy then
begin
ny:=maxy-R;gr.vy:=0;
end;
gr.x:=nx;
gr.y:=ny;
end;

function koniec(var uciek,pogon:gracz):boolean;
begin
koniec:=(sqr(uciek.x-pogon.x)+sqr(uciek.y-pogon.y))<sqr(2*R);
end;

procedure obslugaZdarzen(var uciek,pogon:gracz);
var
typ_zdarzenia,x,y,oldx,oldy:integer;
begin 
while isevent do 
begin
event(typ_zdarzenia,x,y);
case typ_zdarzenia of
zdarzenieLewyPrzycisk:
begin
pogon.vx:=pogon.vx+2*sin(x-pogon.x);
pogon.vy:=pogon.vy+2*sin(y-pogon.y);
end;
zdarzenieLewyWleczenie:
begin
pogon.vx:=pogon.vx+sin(x-pogon.x);
pogon.vy:=pogon.vy+sin(y-pogon.y);
end;
zdarzenieklawiatury:
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
procedure GameOver(wynik:integer;var uciek,pogon:gracz);
var
x,y,r:integer;
begin
brush(0,0,0,0);
r:=1;
x:=round(uciek.x+pogon.x);
y:=round(uciek.y+pogon.y);
textColor(random(255),random(255),random(255));
font(12,0,60);
moveto(10,y);
write('Uciekinier przetrwal ',wynik,' dziesiatych sekundy');
writeln;
writeln;
if wynik<=60 then
begin
font(25,0,60);
moveto(20,y);
writeln;
writeln(' YOU ARE THE BEST !!! ');
end;
If wynik>60 then 
begin
font(25,0,60);
moveto(20,y);
writeln;
writeln(' MÓGLBYS SIE BARDZIEJ POSTARAC');
end;
end;



var
uciekacz,poganiacz,gr:gracz;
wynik,odp:integer;
x,y:real;
z:string[100];
begin
gr.x:=100;
gr.y:=150;
begin
brush(1,gr.r,gr.g,gr.b);
pen(1,gr.r,gr.g,gr.b);
ellipse(round(gr.x-R),round(gr.y-R),
        round(gr.x+R),round(gr.y+R));
pen(5,0,0,0);
line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y));
line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy));
end;

begin

moveto(0,maxy+40);
writeln('Zasady gry:');
writeln('Rózowy uciekinier sterowany strzalkami musi jak najdluzej');
writeln('wymykac sie zielonemu zaganiaczowi sterowanemu myszka.');
wynik:=0;
inicjujGracza(uciekacz,50,50,255,0,255);
inicjujGracza(poganiacz,maxx-50,maxy-50,0,255,0);
rectangle(0,0,maxx+1,maxy+1);
graczWchodzi(uciekacz);
graczWchodzi(poganiacz);
repeat
obslugaZdarzen(uciekacz,poganiacz);
graczZnika(uciekacz);
ruchGracza(uciekacz);
graczWchodzi(uciekacz);
graczZnika(poganiacz);
ruchGracza(poganiacz);
graczWchodzi(poganiacz);
delay(100);
wynik:=wynik+1;
moveto(0,maxy+10);
writeln('wynik uciekiniera:',wynik);
until koniec(uciekacz,poganiacz);
GameOver(wynik,uciekacz,poganiacz);
z:='Czy chcesz zagrac jeszcze raz?. Wpisz 1 jesli Tak lub 2 jesli Nie.';
writeln;
textColor(random(255),random(255),random(255));
font(15,0,60);
writeln('Czy chcesz zagrac jeszcze raz?. Wpisz 1 jesli Tak lub 2 jesli Nie.');    
read(odp);
If odp=2 then
begin 
writeln;
writeln;
writeln;
textColor(random(255),random(255),random(255));
font(50,0,50);
writeln('GAME OVER');
end;
if odp=1 then
begin
delete(z,1,66);
graczZnika(uciekacz);
graczZnika(poganiacz);
begin
gr.x:=100;
gr.y:=150;
begin
brush(1,gr.r,gr.g,gr.b);
pen(1,gr.r,gr.g,gr.b);
ellipse(round(gr.x-R),round(gr.y-R),
        round(gr.x+R),round(gr.y+R));
pen(5,0,0,0);
line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y));
line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy));
end;
wynik:=0;
inicjujGracza(uciekacz,50,50,255,0,255);
inicjujGracza(poganiacz,maxx-50,maxy-50,0,255,0);
rectangle(0,0,maxx+1,maxy+1);
graczWchodzi(uciekacz);
graczWchodzi(poganiacz);
repeat
obslugaZdarzen(uciekacz,poganiacz);
graczZnika(uciekacz);
ruchGracza(uciekacz);
graczWchodzi(uciekacz);
graczZnika(poganiacz);
ruchGracza(poganiacz);
graczWchodzi(poganiacz);
delay(100);
wynik:=wynik+1;
moveto(0,maxy+10);
writeln('wynik uciekiniera:',wynik);
until koniec(uciekacz,poganiacz);
GameOver(wynik,uciekacz,poganiacz);
textColor(random(255),random(255),random(255));
font(15,0,60);
writeln('Czy chcesz zagrac jeszcze raz?. Wpisz 1 jesli Tak lub 2 jesli Nie.');
end;
end;
end;
end.
