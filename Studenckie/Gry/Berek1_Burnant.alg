Program BerekMyszyZKlawiatur¹; 
{Prosta gra w berka - jeden gracz steruje uciekinierem 
- strza³kami drugi berkiem za pomoc¹ klikniêæ myszy}

const 
{Stale definiuj¹ce rozmiary planszy}
   MaxX=500; 
   MaxY=400; 
   R=10;

{Stale opisuj¹ce zdarzenie generowane przez ALGO}   
   ZdarzenieKlawiatury=1; 
   ZdarzenieLewyPrzycisk=2; 
   ZdarzenieLewyWleczenie=3;

{Typ rekordowy dla gracza}   
type 
   gracz=record 
        x,y:real;   {Po³o¿enie} 
        vx,vy:real;{Prêdkoœæ} 
        r,g,b:integer; {kolor}
   end;
   
label 88;

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

Var v: real; {prêdkoœæ wypadkowa}
    k: integer; {kolor "g³ówki"}
begin
  v:= sqrt(sqr(gr.vx)+sqr(gr.vy));
  brush(1,gr.r,round(255 - v*15),gr.b); 
  pen(1,gr.r,gr.g,gr.b); 
  ellipse( round(gr.x-R),round(gr.y-R), round(gr.x+R),round(gr.y+R)); 
  k := round(v*(255/sqrt(2*sqr(R))));
  pen(2,k,k,k);
  if v <> 0 then
  line(round(gr.x+gr.vx*(R/4)/v),round(gr.y+gr.vy*(R/4)/v),round(gr.x+gr.vx*(R/1.25)/v),round(gr.y+gr.vy*(R/1.25)/v)); 
end;

procedure GraczZnika(var gr:gracz); 
{Zamazuje gracza w aktualnej pozycji}
begin 
  brush(1, 255,228,220); 
  pen(1,255,228,220); 
  ellipse( round(gr.x-R),round(gr.y-R),round(gr.x+R),round(gr.y+R)   ); 
  pen(1,0,0,0); 
end;

procedure RuchGracza(var gr:gracz); 
{Przemieszcza gracza zgodnie z zasadami prostej fizyki}
var 
   vx,vy,nx,ny:real; 
begin
  gr.vy:= gr.vy + 0.2; {dodanie grawitacji}
  if gr.vx>R then     gr.vx:=R; 
  if gr.vx<-R then    gr.vx:=-R; 
  if gr.vy>R then     gr.vy:=R; 
  if gr.vy<-R then    gr.vy:=-R; 
  nx:=gr.x+gr.vx; 
  ny:=gr.y+gr.vy; 
  if nx-R<=1 then 
    begin 
      nx:=R+1;  gr.vx:=0; 
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
  gr.x:=nx; 
  gr.y:=ny; 
end;

function sign(x:real):real; 
{Zwraca: -1 dla liczb ujemnych,  1 dla dodatnich i 0 dla 0}
begin 
  if x>0 then sign:=1 
  else  if x<0 then sign:=-1 
    else sign:=0; 
end;


function koniec(var uciek,pogon:gracz):boolean; 
{Sprawdza czy uciekinier nie zosta³ z³apany}
begin 
  koniec:=(sqr(uciek.x-pogon.x)
               +sqr(uciek.y-pogon.y))<sqr(2*R);
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

procedure GameOver(var uciek:gracz; var pogon:gracz; wynik:integer); 
{Procedurka efektów specjalnych koñca gry}
var 
   x,y,i:integer; 
begin 
  PlaySound(1,'c:\winnt\media\tada.wav');
  uciek.vy:= R;
  pogon.vy:= R;
  repeat  
       GraczZnika(uciek); 
       RuchGracza(uciek); 
       GraczWchodzi(uciek); 
       GraczZnika(pogon); 
       RuchGracza(pogon); 
       GraczWchodzi(pogon); 
       delay(100);
  until ((uciek.y > MaxY - R - 1)and(pogon.y > MaxY - R - 1));
  for i:=0 to 125 do
   begin
    pen(2, 255-i, i*2, 125);
    line(i*4, 0, i*4, MaxY);
    line(MaxX-i*4+2,0, MaxX-i*4+2, MaxY);
    delay(60);
   end;
  brush(1, 255, 180, 200);
  rectangle(100, 140, 400, 230);
  font(8, 0, 600);
  pen(1, 255, 0, 125);
  moveto(140, 150);
  Write('Wynik uciekiniera: ', wynik );
  Moveto(115, 175);
  font(8, 0, 400);
  Write(' aby zagrac jeszcze raz wcisnij ''s''');
  Moveto(115, 200);
  Write(' aby zakonczyc ''q''');
  
end;



{G³ówne zmienne programu}
var 
   uciekacz:gracz;
   poganiacz:gracz; 
   wynik:integer;
   granie:boolean;
   k,x,y:integer;
{Kod programu g³ównego}
begin
  brush(1, 255,228,220);
  pen(1, 255,228, 220);
  Rectangle(0,MaxY+5, MaxX, MaxY+100);
  moveto(0,MaxY+40);
  pen(1, 0,0,0);   
  writeln('Zasady gry:');
  writeln('Czerwony uciekinier sterowany strzalkami musi jak najd³u¿ej ');
  writeln('wymykaæ siê niebieskiemu zaganiaczowi sterowanemu myszk¹.');
  granie:= true;
  while granie do
   begin
    {czysc obraz gry}
     brush(1, 255,228,220);
     pen(1, 255,228, 220);
     Rectangle(0,0, MaxX+3, MaxY+3);
     wynik:=0; 
     InicjujGracza(uciekacz,50,50,255,0,0);
     pen(1,0,0,0);
     InicjujGracza(poganiacz,MaxX-50,MaxY-50,0,0,255); 
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
       Brush( 0, 1,1,1);
       Font(10, 0, 400); 
       writeln('Wynik uciekiniera:',Wynik); 
     until koniec(uciekacz,poganiacz); 
     GameOver(uciekacz,poganiacz,wynik);
     88:Event(k,x,y); {czekanie na decyzje gracza}
     if x = Ord('q') then
       begin
         granie:= false;
       end
     else
       begin
         if x <> Ord('s') then goto 88;
       end;
   end;
  brush(1, 255, 180, 200);
  rectangle(100, 140, 400, 230);
  font(8, 0, 600);
  pen(1, 255, 0, 125);
  moveto(200, 175);
  Write('KONIEC!' );
end.