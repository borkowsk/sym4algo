Program BerekMyszyZKlawiatur¹; 
{Prosta gra w berka -
jeden gracz steruje uciekinierem
-
strza³kami drugi berkiem za pomoc¹ klikniêæ myszy} 

const 
   {Stale definiuj¹ce rozmiary planszy} 
   MaxX=500; 
   MaxY=400; 
   R=10; 
   {Stale opisuj¹ce zdarzenie generowane przez ALGO} 
   ZdarzenieKlawiatury=1; 
   ZdarzenieLewyPrzycisk=2; 
   ZdarzenieLewyWleczenie=3; 
   {Stale opisuj¹ce polozenie przeszkody - kwadrat o srodku (x,y) i boku a} 
   pX=250; 
   pY=200; 
   pR=40; 
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
  pen(1,gr.r,gr.g,gr.b); 
  ellipse( round(gr.x-R),round(gr.y-R), round(gr.x+R),round(gr.y+R)); 
  pen(1,0,0,0); 
  line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y)); 
  line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy)); 
end; 

procedure GraczZnika(var gr:gracz); 
{Zamazuje gracza w aktualnej pozycji} 

begin 
  brush(1,255,255,255); 
  pen(1,255,255,255); 
  ellipse( round(gr.x-R),round(gr.y-R), round(gr.x+R),round(gr.y+R) ); 
  pen(1,0,0,0); 
end; 

procedure RuchGracza(var gr:gracz; radius:integer); 
{Przemieszcza gracza zgodnie z zasadami prostej fizyki} 

var 
   vx,vy,nx,ny:real; 
   A,B,C,x,y,newX,newY:real; 
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
      gr.vx:=-gr.vx; 
    end; 
  if nx+R>=MaxX then 
    begin 
      nx:=MaxX-R; 
      gr.vx:=-gr.vx; 
    end; 
  if ny-R<=1 then 
    begin 
      ny:=R+1; 
      gr.vy:=-gr.vy; 
    end; 
  if ny+R>=MaxY then 
    begin 
      ny:=MaxY-R; 
      gr.vy:=-gr.vy; 
    end; 
  {odbicia od przeszkody} 
  if (sqrt(sqr(pX-nx)+sqr(pY-ny)) <= R+radius) then 
    begin 
      gr.vx := gr.vx +1; 
      gr.vy := gr.vy +1; 
      if (pX <> nx) then 
        begin 
          A:=-(pY-ny)/(pX-nx); 
          B:=1; 
          C:=-A*nx-ny; 
          x:=nx+gr.vx; 
          y:=ny+gr.vy; 
          newX:=(x*sqr(B)-x*sqr(A)-2*y*A*B-2*A*C)/(sqr(A)+sqr(B)); 
          newY:=(y*sqr(A)-y*sqr(B)-2*x*A*B-2*B*C)/(sqr(A)+sqr(B));; 
          gr.vx:=gr.x-newX; 
          gr.vy:=gr.y-newY; 
        end 
      else 
        begin 
          gr.vy:=-gr.vy; 
        end; 
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

procedure GameOver(wynik:integer;var uciek,pogon:gracz); 
{Procedurka efektów specjalnych koñca gry} 

var 
   x,y,r,i:integer; 
begin 
  PlaySound(1,'c:\winnt\media\tada.wav'); 
  brush(0,0,0,0); 
  for i:=1 to 2*maxX+2*maxY do 
    begin 
      pen(1,random(255), random(255), random(255)); 
      if (i<=maxX div 2) then 
        begin 
          Line(maxX div 2, maxY div 2, maxX div 2 + i, 0) 
        end 
      else 
        if (i<=(maxX div 2 + maxY)) then 
          begin 
            Line(maxX div 2, maxY div 2, maxX, i-maxX div 2) 
          end 
        else 
          if (i<=(maxX div 2 + maxY + maxX)) then 
            begin 
              Line(maxX div 2, maxY div 2, maxX div 2+maxY+maxX-i, maxY) 
            end 
          else 
            if (i<=(maxX div 2 + 2*maxY + maxX)) then 
              begin 
                Line(maxX div 2, maxY div 2, 0, maxX div 2+2*maxY+maxX-i) 
              end 
            else 
              if (i<=(2*maxY + 2*maxX)) then 
                begin 
                  Line(maxX div 2, maxY div 2, i-maxX div 2-2*maxY-maxX, 0) 
                end; 
      delay(1); 
    end; 
  TextColor(random(255),random(255),random(255)); 
  Font(10,0,60); 
  MoveTo(100,maxY div 2); 
  write('Uciekinier przetrwa³ ',wynik div 10,' sekund'); 
end; 

procedure CzyszczeniePlanszy(var radius:integer); 

var 
   r,g,b:integer; 
begin 
  brush(1,255,255,255); 
  pen(1,0,0,0); 
  Rectangle(0,0,MaxX+1,MaxY+1); 
  r := random(255); 
  g := random(255); 
  b := random(255); 
  brush(1,r,g,b); 
  pen(1,r,g,b); 
  ellipse(pX-radius,pY-radius,pX+radius,pY+radius); 
end; 
{G³ówne zmienne programu} 

var 
   uciekacz,poganiacz:gracz; 
   wynik,promien:integer; 
   {Kod programu g³ównego} 

begin 
  moveto(0,MaxY+40); 
  writeln('Zasady gry:'); 
  writeln('Czerwony uciekinier sterowany strzalkami musi jak najd³u¿ej '); 
  writeln('wymykaæ siê niebieskiemu zaganiaczowi sterowanemu myszk¹.'); 
  writeln('Z up³ywem czasu przeszkoda bêdzie rosn¹æ'); 
  wynik:=0; 
  promien := 40; 
  InicjujGracza(uciekacz,50,50,255,0,0); 
  InicjujGracza(poganiacz,MaxX-50,MaxY-50,0,255,255); 
  Rectangle(0,0,MaxX+1,MaxY+1); 
  GraczWchodzi(uciekacz); 
  GraczWchodzi(poganiacz); 
  repeat 
    if (promien < maxY div 2 - 35) then 
      begin 
        promien := 40 + wynik div 10; 
      end; 
    Obs³ugaZdarzeñ(uciekacz,poganiacz); 
    {GraczZnika(uciekacz);} 
    RuchGracza(uciekacz,promien); 
    {GraczZnika(poganiacz);} 
    RuchGracza(poganiacz,promien); 
    CzyszczeniePlanszy(promien); 
    GraczWchodzi(uciekacz); 
    GraczWchodzi(poganiacz); 
    delay(100); 
    wynik:=wynik+1; 
    moveto(0,MaxY+10); 
    writeln('Wynik uciekiniera:',Wynik); 
  until koniec(uciekacz,poganiacz); 
  GameOver(wynik,uciekacz,poganiacz); 
end.
