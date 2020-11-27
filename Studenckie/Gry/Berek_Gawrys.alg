Program NiebieskiBerek;
{Wersja Ani Gawryœ}

const
 {Stale definiuj¹ce rozmiary planszy}
 MaxX=550;
 MaxY=550;
 R=12;
 {Stale opisuj¹ce zdarzenie generowane przez ALGO}
 ZdarzenieKlawiatury=1;
 ZdarzenieLewyPrzycisk=2;
 ZdarzenieLewyWleczenie=3;
 {Typ rekordowy dla gracza}

type
 gracz=record
 x,y:real; {Po³o¿enie}
 vx,vy:real;{Prêdkoœæ}
 r,g,b:integer; {kolor}
end;


procedure GameOver(wynik:integer);
 {Procedurka efektów specjalnych koñca gry}
const width=550;
 height=550;

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
    r:=random(56);
    g:=random(56);
    b:=random(56);
    Pen(10,r,g,b);
   end;


var h:integer;
begin
 h:=0;
 PlaySound(1,'sound.wav');
 repeat
 h:=h+1;
 wylosuj_kolor;
 dodaj_punkt;
 dodaj_punkt;
 until h>100000;

  Font(40,10,60);
  MoveTo(70,160);
  write('GAME');
  Font(40,10,60);
  MoveTo(285,120);
  write('OVER');
  Font(10,0,60);
  MoveTo(58,380);
  write('Uciekinier przetrwa³ ',wynik,' dziêsi¹tych sekundy');

end;

procedure InicjujGracza(var gr:gracz;x,y:real;r,g,b:integer);
{Ustala pocz¹tkowe parametry gracza}

  begin
   gr.x:=x;
   gr.y:=y;
   gr.r:=r;
   gr.g:=g;
   gr.b:=b;
   gr.vx:=-1;
   gr.vy:=1;
  end;

procedure GraczWchodzi(var gr:gracz);
{Rysuje gracza w aktualnej pozycji}

  begin
   brush(1,gr.r,gr.g,gr.b);
   pen(4,gr.r,gr.g,gr.b);
   ellipse( round(gr.x-R),round(gr.y-R),
   round(gr.x+R),round(gr.y+R));
   pen(5,0,0,0);
   line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y));
   line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy));
  end;

procedure GraczZnika(var gr:gracz);
{Zamazuje gracza w aktualnej pozycji}
  begin
   brush(1,0,0,0);
   pen(1,0,0,0);
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

   if (nx-R<=1)then
    begin
    nx:=R+1; gr.vx:=0;
    end;

   if nx+R>=MaxX then
    begin
    nx:=MaxX-R; gr.vx:=0;
    end;

   if ny-R<=1 then
    begin
    ny:=R+1; gr.vy:=0;
    end;

   if ny+R>=MaxY then
    begin
    ny:=MaxY-R; gr.vy:=0;
    end;

   if (nx-R<=170)and(ny-R<=240)and(nx-R>=160)and(ny-R>=160)then
    begin
    gr.vx:=0;
    gr.vy:=0;
    end;


  if (nx-R<=210)and(ny-R<=170)and(nx-R>=160)and(ny-R>=160)then
   begin
   gr.vx:=0;
   gr.vy:=0;
  end;

  if (nx-R<=360)and(ny-R<=420)and(nx-R>=350)and(ny-R>=330)then
   begin
   gr.vx:=0;
   gr.vy:=0;
   end;


  if (nx-R<=350)and(ny-R<=420)and(nx-R>=305)and(ny-R>=400)then
   begin
   gr.vx:=0;
   gr.vy:=0;
  end;

  gr.x:=nx;
  gr.y:=ny;
  end;
  
  
procedure RuchGracza2(var gr:gracz);
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

   if (nx-R<=1)then
    begin
    nx:=R+1; gr.vx:=0;
    end;

   if nx+R>=MaxX then
    begin
    nx:=MaxX-R; gr.vx:=0;
    end;

   if ny-R<=1 then
    begin
    ny:=R+1; gr.vy:=0;
    end;

   if ny+R>=MaxY then
    begin
    ny:=MaxY-R; gr.vy:=0;
    end;

   if (nx-R<=170)and(ny-R<=350)and(nx-R>=70)and(ny-R>=250)then
    begin
    gr.vx:=0;
    gr.vy:=0;
    end;


  if (nx-R<=330)and(ny-R<=350)and(nx-R>=230)and(ny-R>=250)then
   begin
   gr.vx:=0;
   gr.vy:=0;
  end;

  if (nx-R<=490)and(ny-R<=350)and(nx-R>=390)and(ny-R>=250)then
   begin
   gr.vx:=0;
   gr.vy:=0;
   end;


  gr.x:=nx;
  gr.y:=ny;
  end;
    

function koniec(var uciek,pogon:gracz):boolean;
{Sprawdza czy uciekinier nie zosta³ z³apany}

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
 
procedure Obs³ugaZdarzeñ(var uciek,pogon:gracz);
{Obs³uguje sterowanie za pomoc¹ zdarzeñ}
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

{G³ówne zmienne programu}
var
 uciekacz,poganiacz:gracz;
 wynik,wynik2:integer;

{Kod programu g³ównego}

var
b:integer;

begin

 Font(10,0,400);
 moveto(0,MaxY+40);
 TextColor( 0, 95, 140 );
 writeln('Zasady gry:');
 Font(8,0,60);
 writeln('Zielony uciekinier sterowany strza³kami musi jak najd³u¿ej ');
 writeln('wymykaæ siê pomarañczowemu zaganiaczowi sterowanemu myszk¹.');

 wynik:=0;
 InicjujGracza(uciekacz,50,50,24,205,12);
 InicjujGracza(poganiacz,MaxX-50,MaxY-50,255,102,0);

 brush(1,188,214,223);
 pen(3,137,191,209);
 rectangle(0,0,maxx,maxy);

 brush(5,12,154,200);
 pen(1,0,0,0);
 rectangle(160,160,170,240);


 brush(5,12,154,200);
 pen(1,0,0,0);
 rectangle(160,160,210,170);


 brush(5,12,154,200);
 pen(1,0,0,0);
 rectangle(350,330,360,420);


 brush(5,12,154,200);
 pen(1,0,0,0);
 rectangle(305,410,350,420);

 GraczWchodzi(uciekacz);
 GraczWchodzi(poganiacz);

  repeat
   Obs³ugaZdarzeñ(uciekacz,poganiacz);
   GraczZnika(uciekacz);
   RuchGracza(uciekacz);
   GraczWchodzi(uciekacz);
   GraczZnika(poganiacz);
   RuchGracza(poganiacz);
   GraczWchodzi(poganiacz);
    delay(50);
   wynik:=wynik+1;
   writeln;
   Font(15,0,80);
   moveto(0,MaxY+10);
   TextColor( 0, 0, 0 );
   writeln('Poziom 1 - wynik uciekiniera:',Wynik);
 until koniec(uciekacz,poganiacz);
 
 If wynik>1000 then


  begin
 Font(10,0,400);
 moveto(0,MaxY+40);
 TextColor( 0, 95, 140 );

 writeln('Brawo, awansowa³eœ na drugi poziom!');
 Font(8,0,60);
 
 wynik2:=0;
 InicjujGracza(uciekacz,50,50,24,205,12);
 InicjujGracza(poganiacz,MaxX-50,MaxY-50,255,102,0);

 brush(1,188,214,223);
 pen(3,137,191,209);
 rectangle(0,0,maxx,maxy);

 brush(5,12,154,200);
 pen(1,0,0,0);
 rectangle(70,250,170,350);

 brush(5,12,154,200);
 pen(1,0,0,0);
 rectangle(230,250,330,350);
 
 brush(5,12,154,200);
 pen(1,0,0,0);
 rectangle(390,250,490,350);
 

 GraczWchodzi(uciekacz);
 GraczWchodzi(poganiacz);

  repeat
   Obs³ugaZdarzeñ(uciekacz,poganiacz);
   GraczZnika(uciekacz);
   RuchGracza2(uciekacz);
   GraczWchodzi(uciekacz);
   GraczZnika(poganiacz);
   RuchGracza2(poganiacz);
   GraczWchodzi(poganiacz);
    delay(50);
   wynik:=wynik+1;
   writeln;
   Font(15,0,80);
   moveto(0,MaxY+10);
   TextColor( 0, 0, 0 );
   writeln('Poziom 2 - wynik uciekiniera:',Wynik2);
 until koniec(uciekacz,poganiacz);
 
  GameOver(wynik+wynik2);
  end;
  
  if wynik<=1000 then
  Gameover(wynik);
 
end.
