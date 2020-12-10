Program BerekMyszyZKlawiatur¹; 
{Myslinska:
    Prosta gra w berka - 
    1 RUNDA
    Gracz1 (czerwony) - strza³ki (uciekinier)
    Gracz2 (zielony)  - myszka   (poganiacz)
    2 RUNDA
    Gracz1 (zielony)  - strza³ki (poganiacz)
    Gracz2 (czerwony) - myszka   (uciekinier)
} 

Const 
   {Stale definiujšce rozmiary planszy} 
   MaxX=500; 
   MaxY=400; 
   R=10; 
   {Stale opisujšce zdarzenie generowane przez ALGO} 
   ZdarzenieKlawiatury=1; 
   ZdarzenieLewyPrzycisk=2; 
   ZdarzenieLewyWleczenie=3; 
Type 
   gracz=record 
        x,y:real; 
        {Po³o¿enie} 
        vx,vy:real;
        {Prêdko?æ} 
        r,g,b:integer; 
        {kolor} 
        s:integer; 
   end; 

Procedure InicjujGracza(Var gr:gracz;x,y:real;r,g,b:integer); 
{Ustala poczštkowe parametry gracza} 

Begin 
  gr.x:=x; 
  gr.y:=y; 
  gr.r:=r; 
  gr.g:=g; 
  gr.b:=b; 
  gr.vx:=0; 
  gr.vy:=0; 
end; 

Procedure GraczWchodzi(Var gr:gracz); 
{Rysuje gracza w aktualnej pozycji} 

Begin 
  Brush(1,gr.r,gr.g,gr.b); 
  Pen(1,gr.r,gr.g,gr.b); 
  Ellipse( round(gr.x-R),round(gr.y-R), round(gr.x+R),round(gr.y+R)); 
  Pen(1,0,0,0); 
  Line(round(gr.x),round(gr.y),round(gr.x+gr.vx),round(gr.y)); 
  Line(round(gr.x),round(gr.y),round(gr.x),round(gr.y+gr.vy)); 
end; 

Procedure GraczZnika(Var gr:gracz); 
{Zamazuje gracza w aktualnej pozycji} 

Begin 
  Brush(1,255,255,255); 
  Pen(1,255,255,255); 
  Ellipse( round(gr.x-R),round(gr.y-R), round(gr.x+R),round(gr.y+R) ); 
  Pen(1,0,0,0); 
end; 

Procedure RuchGracza(Var gr:gracz); 
{Przemieszcza gracza zgodnie z zasadami prostej fizyki} 

Var 
   vx,vy,nx,ny:real; 
Begin 
  If gr.vx>R then 
    gr.vx:=R; 
  If gr.vx<-R then 
    gr.vx:=-R; 
  If gr.vy>R then 
    gr.vy:=R; 
  If gr.vy<-R then 
    gr.vy:=-R; 
  nx:=gr.x+gr.vx; 
  ny:=gr.y+gr.vy; 
  If nx-R<=1 then 
    Begin 
      nx:=R+1; 
      gr.vx:=R; 
      {--odbicie od lewej krawedzi--} 
    end; 
  If nx+R>=MaxX then 
    Begin 
      nx:=MaxX-R; 
      gr.vx:=-R; 
      {--odbicie od prawej krawedzi--} 
    end; 
  If ny-R<=1 then 
    Begin 
      ny:=R+1; 
      gr.vy:=R; 
      {--odbicie od gornej krawedzi--} 
    end; 
  If ny+R>=MaxY then 
    Begin 
      ny:=MaxY-R; 
      gr.vy:=-R; 
      {--odbicie od dolnej krawedzi--} 
    end; 
  gr.x:=nx; 
  gr.y:=ny; 
end; 

Function koniec(Var uciek,pogon:gracz):boolean; 
{Sprawdza czy uciekinier nie zosta³ z³apany} 

Begin 
  koniec:=(sqr(uciek.x-pogon.x)+sqr(uciek.y-pogon.y))<sqr(2*R); 
end; 

Function sign(x:real):real; 
{Zwraca: -1 dla liczb ujemnych, 1 dla dodatnich i 0 dla 0} 

Begin 
  If x>0 then 
    sign:=1 
  else 
    If x<0 then 
      sign:=-1 
    else 
      sign:=0; 
end; 

Procedure Obs³ugaZdarzeñ(Var uciek,pogon:gracz); 
{Obs³uguje sterowanie za pomocš zdarzeñ} 

Var 
   typ_zdarzenia, x, y,oldx,oldy: integer; 
Begin 
  While IsEvent do 
    Begin 
      Event(typ_zdarzenia, x, y); 
      Case typ_zdarzenia of 
        ZdarzenieLewyPrzycisk: 
          Begin 
            pogon.vx:=pogon.vx+2*sign(x-pogon.x); 
            pogon.vy:=pogon.vy+2*sign(y-pogon.y); 
          end; 
        ZdarzenieLewyWleczenie: 
          Begin 
            pogon.vx:=pogon.vx+sign(x-pogon.x); 
            pogon.vy:=pogon.vy+sign(y-pogon.y); 
          end; 
        ZdarzenieKlawiatury: 
          Begin 
            Case x of 
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

Procedure GameOver(nwynik:integer;Var uciek,pogon:gracz;i:integer;ngracz:string); 
{Procedurka efektów specjalnych koñca gry} 

Var 
   x,y,r:integer; 
Begin 
  PlaySound(1,'c:\winnt\media\tada.wav'); 
  Brush(0,0,0,0); 
  r:=1; 
  x:=round(uciek.x+pogon.x) div 2; 
  y:=round(uciek.y+pogon.y) div 2; 
  Repeat 
    Pen(2,80,80,random(255)); 
    Ellipse(x-r,y-r,x+r,y+r); 
    r:=r+1; 
  until ((r>500)and(IsEvent))or(r>2000); 
  TextColor(random(255),random(255),random(255)); 
  Font(15,0,60); 
  MoveTo(10,y); 
  writeln('WYGRAL : ',ngracz,', Z WYNIKIEM : ',nwynik); 
end; 
{G³ówne zmienne programu} 

Var 
   uciekacz,poganiacz:gracz; 
   wynik,nwynik:integer; 
   opcja,szybkosc,s,x,i:integer; 
   gracz1,gracz2,ngracz,wybor:string; 

   Label 6,7,8,9; 
{Kod programu g³ównego} 

begin 
  Write('Wpisz imie 1 gracza (uciekiniera) : '); 
  ReadLn(gracz1); 
  Write('Wpisz imie 2 gracza (poganiacza)  : '); 
  ReadLn(gracz2); 
  begin 
    {-----------OPCJE GRY-----------} 
    s:=80; 
    szybkosc:=0; 
    6: 
    { LABEL 6 } clear; 
    Writeln(' OPCJE GRY '); 
    Writeln('-----------'); 
    Writeln(''); 
    writeln(' Wybierz opcje '); 
    Writeln('  1 - START'); 
    Writeln('  2 - Zmiana szybkosci gry'); 
    Writeln('  3 - KONIEC'); 
    read(opcja); 
    CASE opcja OF 
    {OPCJA 1} 
      1 : 
        begin 
          if szybkosc=1 then 
            s:=10; 
          if szybkosc=2 then 
            s:=80; 
          if szybkosc=3 then 
            s:=150; 
        end; 
      {OPCJA 2} 
      2 : 
        begin 
          writeln('--- Wybierz tryb'); 
          writeln('     1 - Szybki'); 
          writeln('     2 - Normalny'); 
          writeln('     3 - Wolny'); 
          read(szybkosc); 
          clear; 
          goto 6; 
        end; 
      {OPCJA 3} 
      3 : 
        begin 
          clear; 
          write('   KONIEC PROGRAMU'); 
          goto 7; 
        end; 
    end; 
    {------------------------------} 
  end; 
  i:=0; 
  nwynik:=0; 
  ngracz:=''; 
  8: 
  { LABEL 8 } wynik:=0; 
  clear; 
  moveto(0,MaxY+100); 
  writeln(''); 
  writeln('Zasady gry:'); 
  writeln('Czerwony uciekinier musi jak najd³u¿ej '); 
  writeln('wymykaæ siê zielonemu zaganiaczowi.'); 
  writeln('Sa 2 RUNDY'); 
  writeln('-----------------------------------------------------'); 
  writeln(''); 
  if i mod 2 = 0 then 
    begin 
      writeln('Uciekinier : ',gracz1); 
      writeln('Poganiacz  : ',gracz2); 
    end 
  else 
    begin 
      writeln('Uciekinier : ',gracz2); 
      writeln('Poganiacz  : ',gracz1); 
    end; 
  writeln('Najlepszy wynik : ',nwynik,' - Gracz ',ngracz); 
  InicjujGracza(uciekacz,MaxX-50,MaxY-50,0,255,50); 
  InicjujGracza(poganiacz,50,50,255,50,0); 
  Rectangle(0,0,MaxX+1,MaxY+1); 
  GraczWchodzi(uciekacz); 
  GraczWchodzi(poganiacz); 
  repeat 
    if i=1 then 
      Obs³ugaZdarzeñ(uciekacz,poganiacz) 
    else 
      Obs³ugaZdarzeñ(poganiacz,uciekacz); 
    GraczZnika(uciekacz); 
    RuchGracza(uciekacz); 
    GraczWchodzi(uciekacz); 
    GraczZnika(poganiacz); 
    RuchGracza(poganiacz); 
    GraczWchodzi(poganiacz); 
    delay(s); 
    wynik:=wynik+1; 
    moveto(0,MaxY+10); 
    writeln('Wynik uciekiniera:',Wynik); 
  until koniec(uciekacz,poganiacz); 
  i:=i+1; 
  if nwynik < wynik then 
    begin 
      nwynik:=wynik; 
      if i mod 2 = 0 then 
        ngracz:=gracz2 
      else 
        ngracz:=gracz1; 
    end; 
  writeln(''); 
  writeln('Wynik uciekiniera : ',Wynik); 
  writeln(''); 
  writeln('Najlepszy wynik : ',nwynik,', uzyskal ',ngracz); 
  delay(2500); 
  if i=1 then 
    goto 8; 
  GameOver(nwynik,uciekacz,poganiacz,i,ngracz); 
  7: 
  { LABEL 7 } 
end.
