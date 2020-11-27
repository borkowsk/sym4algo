Program BerekMyszyZKlawiatur¹; 
{"Poprawione" przez Adriana Gnatka} 

label 0001; 

label 0002; 
const 
   {Stale definiuj¹ce rozmiary planszy} 
   MaxX=500; 
   MaxY=500; 
   R=10; 
   {Stale opisuj¹ce zdarzenie generowane przez ALGO} 
   ZdarzenieKlawiatury=1; 
   ZdarzenieLewyPrzycisk=2; 
   ZdarzenieLewyWleczenie=3; 
   {Typ rekordowy dla gracza} 
type 
   gracz=record 
        x,y:real; 
        {Po³o¿enie} 
        vx,vy:real;
        {Prêdkoœæ} 
        r,g,b:integer; 
        {kolor} 
   end; 

procedure InicjujGracza(var gr:gracz;x,y:real;r,g,b:integer); 
{Ustala pocz¹tkowe parametry gracza} 

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
  ellipse( round(gr.x-R),round(gr.y-R), round(gr.x+R),round(gr.y+R)); 
  pen(5,0,0,0); 
  line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y)); 
  line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy)); 
end; 

procedure GraczZnika(var gr:gracz); 
{Zamazuje gracza w aktualnej pozycji} 

begin 
  brush(1,25,255,25); 
  pen(1,255,255,255); 
  ellipse( round(gr.x-R),round(gr.y-R), round(gr.x+R),round(gr.y+R) ); 
  pen(5,0,0,0); 
end; 

procedure RuchGracza(var gr:gracz); 
{Przemieszcza gracza zgodnie z zasadami prostej fizyki} 

var 
   vx,vy,nx,nx1,ny,ny1:real; 
begin 
  if gr.vx>R then 
    gr.vx:=R; 
  if gr.vx<-R then 
    gr.vx:=-R; 
  if gr.vy>R then 
    gr.vy:=R; 
  if gr.vy<-R then 
    gr.vy:=-R; 
  nx:=gr.x+gr.vx; 
  ny:=gr.y+gr.vy; 
  {Z lewej} 
  if (nx-R<=1)then 
    begin 
      nx:=R+1; 
      gr.vx:=0; 
    end; 
  {kwadrat} 
  if (nx-R<=332)and(ny-R<=332)and(nx-R>=166)and(ny-R>=166)then 
    begin 
      gr.vx:=0; 
      gr.vy:=0; 
    end; 
  {z prawej } 
  if nx+R>=MaxX then 
    begin 
      nx:=MaxX-R; 
      gr.vx:=0; 
    end; 
  {z góry} 
  if ny-R<=1 then 
    begin 
      ny:=R+1; 
      gr.vy:=0; 
    end; 
  {z do³u} 
  if ny+R>=MaxY then 
    begin 
      ny:=MaxY-R; 
      gr.vy:=0; 
    end; 
  gr.x:=nx; 
  gr.y:=ny; 
end; 

function koniec(var uciek,pogon:gracz):boolean; 
{Sprawdza czy uciekinier nie zosta³ z³apany} 

begin 
  koniec:=(sqr(uciek.x-pogon.x) +sqr(uciek.y-pogon.y))<sqr(2*R); 
end; 

function sign(x:real):real; 
{Zwraca:
 -1 dla liczb ujemnych,
 1 dla dodatnich i 0 dla 0} 

begin 
  if x>0 then 
    sign:=1 
  else 
    if x<0 then 
      sign:=-1 
    else 
      sign:=0; 
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
              37:
                uciek.vx:=uciek.vx-2; 
              38:
                uciek.vy:=uciek.vy-2; 
              39:
                uciek.vx:=uciek.vx+2; 
              40:
                uciek.vy:=uciek.vy+2; 
            end; 
          end; 
      end; 
    end; 
end; 
{G³ówne zmienne programu} 

var 
   uciekacz,poganiacz:gracz; 
   wynik:integer; 
   {Kod programu g³ównego} 

procedure GameOver(wynik:integer); 
{Procedurka efektów specjalnych koñca gry} 

const 
   width=500; 
   height=500; 

procedure dodaj_punkt; 

var 
   x,y:integer; 
begin 
  x:=random(width); 
  y:=random(height); 
  Point(x,y); 
end; 

procedure wylosuj_kolor; 

var 
   r,g,b:integer; 
begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Pen(500,r,g,b); 
end; 

label 0001; 

label 0002; 

label 0003; 
var 
   h:integer; 
begin 
  h:=0; 
  repeat 
    h:=h+1; 
    wylosuj_kolor; 
    dodaj_punkt; 
  until h>800000; 
  Font(40,10,60); 
  MoveTo(30,110); 
  write('GAME'); 
  Font(40,-10,60); 
  MoveTo(285,80); 
  write('OVER'); 
  Font(10,0,60); 
  MoveTo(28,280); 
  write('Uciekinier przetrwa³ ',wynik,' dziêsi¹tych sekundy'); 
  Font(20,15,60); 
  MoveTo(60,400); 
  write('Once Again?'); 
  Font(15,0,60); 
  MoveTo(280,430); 
  write('Y(1)/N(2):'); 
end; 

var 
   b:integer; 

begin 
  0001: Font(8,0,60); 
  moveto(0,MaxY+40); 
  writeln('Zasady gry:'); 
  writeln('Czerwony uciekinier sterowany strzalkami musi jak najd³u¿ej '); 
  writeln('wymykaæ siê niebieskiemu zaganiaczowi sterowanemu myszk¹.'); 
  wynik:=0; 
  InicjujGracza(uciekacz,50,50,255,0,0); 
  InicjujGracza(poganiacz,MaxX-50,MaxY-50,0,255,255); 
  brush(1,95,25,235); 
  pen(1,255,255,255); 
  rectangle(0,0,maxx,maxy); 
  brush(5,25,255,25); 
  pen(1,255,255,255); 
  rectangle(166,166,332,332); 
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
    delay(100); 
    wynik:=wynik+1; 
    Font(15,0,60); 
    moveto(0,MaxY+10); 
    writeln('Wynik uciekiniera:',Wynik); 
  until koniec(uciekacz,poganiacz); 
  GameOver(wynik); 
  read(b); 
  if b=1 then 
    goto 0001; 
  if b=2 then 
    goto 0002; 
  0002:write; 
end.
