Program BerekMyszyZKlawiatur¹; 
{Prosta gra w berka - jeden gracz steruje uciekinierem 
- strzalkami drugi berkiem za pomoca klikniec myszy}
const 
{Stale definiujace rozmiary planszy}
   MaxX=550; 
   MaxY=400; 
   R=10; 
{Stale opisujace zdarzenie generowane przez ALGO}   
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

procedure GraczZnika(var gr:gracz); 
{Zamazuje gracza w aktualnej pozycji}
begin 
  brush(1,255,255,255); 
  pen(1,255,255,255); 
  ellipse(round(gr.x-R),round(gr.y-R),round(gr.x+R),round(gr.y+R)); 
  pen(1,0,0,0); 
end; 

procedure GraczWchodzi(var gr:gracz); 
{Rysuje gracza w aktualnej pozycji}
begin 
  brush(1,gr.r,gr.g,gr.b); 
  pen(1,gr.r,gr.g,gr.b); 
  ellipse(round(gr.x-R),round(gr.y-R),round(gr.x+R),round(gr.y+R)); 
  pen(1,0,0,0); 
  line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y)); 
  line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy)); 
end; 

procedure RuchGracza(var gr:gracz); 
{Przemieszcza gracza zgodnie z zasadami prostej fizyki}
var 
   vx,vy,nx,ny:real; 
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
  if nx-R<=1 then 
    begin 
      nx:=R+1; 
      gr.vx:=0; 
    end; 
  if nx+R>=MaxX then 
    begin 
      nx:=MaxX-R; 
      gr.vx:=0; 
    end; 
  if ny-R<=1 then 
    begin 
      ny:=R+1; 
      gr.vy:=0; 
    end; 
  if ny+R>=MaxY then 
    begin 
      ny:=MaxY-R; 
      gr.vy:=0; 
    end; 
  gr.x:=nx; 
  gr.y:=ny; 
end; 

function sign(x:real):real; 
{Zwraca -1 dla liczb ujemnych, 1 dla dodatnich i 0 dla 0}
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
{Obsluguje sterowanie za pomoc¹ zdarzeñ}
Var 
   typ_zdarzenia, x, y,oldx,oldy: integer; 
Begin 
  while IsEvent do
    begin 
      Event(typ_zdarzenia, x, y); 
      case typ_zdarzenia of 
        ZdarzenieLewyPrzycisk: 
          begin 
            pogon.vx:=pogon.vx+sign(x-pogon.x); 
            pogon.vy:=pogon.vy+sign(y-pogon.y); 
          end; 
        ZdarzenieLewyWleczenie: 
          begin 
            pogon.vx:=pogon.vx+2*sign(x-pogon.x); 
            pogon.vy:=pogon.vy+2*sign(y-pogon.y); 
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

function koniec(var uciek,pogon:gracz):boolean; 
{Sprawdza czy uciekinier nie zosta³ z³apany}
begin 
  koniec:=(sqr(uciek.x-pogon.x)+sqr(uciek.y-pogon.y))<sqr(2*R); 
end; 

procedure GameOver(wynik:integer;var uciek,pogon:gracz); 
{Procedurka efektów specjalnych konca gry}
var 
   x,y,r:integer; 
begin 
  PlaySound(1,'c:\winnt\media\tada.wav');
  brush(0,0,0,0); 
  r:=1; 
  x:=round(uciek.x+pogon.x) div 2;
  y:=round(uciek.y+pogon.y) div 2;
  repeat 
    pen(1,random(255),random(255),random(255)); 
    ellipse(x-r,y-r,x+r,y+r); 
    r:=r+1; 
  until ((r>500)and(IsEvent))or(r>2000); 
  TextColor(random(255),random(255),random(255));
  Font(15,0,60);
  MoveTo(10,y);
  write('Uciekinier przetrwa³ ',wynik,' dziêsi¹tych sekundy');
end; 

{G³ówne zmienne programu}
var 
   uciekacz,poganiacz:gracz; 
   wynik:integer; 

begin 
  moveto(0,MaxY+40);   
  writeln('Zasady gry:');
  writeln('Czerwony uciekinier sterowany strzalkami musi jak najd³u¿ej ');
  writeln('wymykaæ siê niebieskiemu zaganiaczowi sterowanemu myszk¹.');
  wynik:=0; 
  InicjujGracza(uciekacz,50,50,255,0,0); 
  InicjujGracza(poganiacz,MaxX-50,MaxY-50,0,255,255); 
  Rectangle(0,0,MaxX+1,MaxY+1); 
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
    moveto(0,MaxY+10); 
    writeln('Wynik uciekiniera:',Wynik); 
  until koniec(uciekacz,poganiacz); 
  GameOver(wynik,uciekacz,poganiacz); 
end.
