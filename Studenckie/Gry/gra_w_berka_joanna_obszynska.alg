program berek; 
{ PROSTA GRA W BERKA - JEDEN GRACZ STERUJE UCIEKINIEREM STRZALKAMI DRUGI BERKIEM ZA POMOCA MYSZY } 

const 
   { ROZMIARY PLANSZY } 
   maxx = 500 ; 
   maxy = 400 ; 
   r = 10 ; 
   { ZDARZENIE GENEROWANE PRZEZ ALGO } 
   zdarzenieklawiatury = 1 ; 
   zdarzenielewyprzycisk = 2 ; 
   zdarzenielewywleczenie = 3 ; 
type 
   gracz = record 
   {TYP REKORDOWY DLA GRACZA} 
        x , y : real ; 
        { POLOZENIE } 
        vx , vy : real ; 
        { PREDKOSC } 
        r , g , b : integer ; 
        { KOLOR } 
   end; 

procedure inicjujgracza ( var gr : gracz ; x , y : real ; r , g , b : integer ) ; 
{ USTALA POCZATKOWE PARAMETRY GRACZA } 

begin 
  gr.x := x ; 
  gr.y := y ; 
  gr.r := r ; 
  gr.g := g ; 
  gr.b := b ; 
  gr.vx := 0 ; 
  gr.vy := 0 ; 
end ; 

procedure graczwchodzi ( var gr : gracz ) ; 
{ RYSUJE GRACZA W AKTUALNEJ POZYCJI } 

begin 
  brush ( 1 , gr.r , gr.g , gr.b ) ; 
  pen ( 1 , gr.r , gr.g , gr.b ) ; 
  ellipse ( round ( gr.x - r ) , round ( gr.y - r ) , round ( gr.x + r ) , round ( gr.y + r ) ) ; 
  pen ( 1 , 0 , 0 , 0 ) ; 
  line ( round ( gr.x ) , round ( gr.y ) , round ( gr.x + gr.vx ) , round ( gr.y ) ) ; 
  line( round ( gr.x ) , round ( gr.y ) , round ( gr.x ) , round ( gr.y + gr.vy ) ) ; 
end ; 

procedure graczznika ( var gr : gracz ) ; 
{ ZAMAZUJE GRACZA W AKTUALNEJ POZYCJI } 

begin 
  brush ( 1 , 255 , 255 , 255 ) ; 
  pen ( 1 , 255 , 255 , 255 ) ; 
  ellipse ( round ( gr.x - r ) , round ( gr.y - r ) , round ( gr.x + r ) , round ( gr.y + r ) ) ; 
  pen ( 1 , 0 , 0 , 0 ) ; 
end ; 

procedure ruchgracza ( plansza : integer ; var gr : gracz ) ; 
{ PRZEMIESZCZA GRACZA ZGODNIE Z ZASADAMI PROSTEJ FIZYKI } 

var 
   vx , vy , nx , ny : real ; 
begin 
  if gr.vx > r then 
    gr.vx := r ; 
  if gr.vx < -r then 
    gr.vx := -r ; 
  if gr.vy > r then 
    gr.vy := r ; 
  if gr.vy < -r then 
    gr.vy := -r ; 
  nx := gr.x + gr.vx ; 
  ny := gr.y + gr.vy ; 
  if nx - r <= 1 then 
    begin 
      nx := r + 1 ; 
      gr.vx := -gr.vx ; 
      { ODBIJANIE } 
    end ; 
  if nx + r >= maxx then 
    begin 
      nx := maxx - r ; 
      gr.vx := -gr.vx ; 
      { ODBIJANIE } 
    end; 
  if ny - r <= 1 then 
    begin 
      ny := r + 1 ; 
      gr.vy := -gr.vy ; 
      { ODBIJANIE } 
    end ; 
  if ny + r >= maxy then 
    begin 
      ny := maxy - r ; 
      gr.vy := -gr.vy ; 
      { ODBIJANIE } 
    end ; 
  if ( plansza <> 1 ) then 
    begin 
      { PLANSZA 2 } 
      if ( ( ny + r >= 100 ) AND ( ny <= 150 ) AND ( nx <= 200 ) AND ( gr.y < 100 ) ) then 
        begin 
          ny := 100 - r; 
          gr.vy := -gr.vy ; 
          { ODBIJANIE } 
        end; 
      if ( ( ny - r <= 150 ) AND ( ny >= 100 ) AND ( nx <= 200 ) AND ( gr.y > 150 ) ) then 
        begin 
          ny := 150 + r ; 
          gr.vy := -gr.vy ; 
          { ODBIJANIE } 
        end; 
      if ( ( nx - r <= 200 ) AND ( ny >= 100 ) AND ( ny <= 150 ) AND ( gr.x > 200 ) ) then 
        begin 
          nx := 200 + r ; 
          gr.vx := -gr.vx ; 
          { ODBIJANIE } 
        end ; 
      if ( ( ny + r >= 250 ) AND ( ny <= 300 ) AND ( nx >= 300 ) AND ( gr.y < 250 ) ) then 
        begin 
          ny := 250 - r ; 
          gr.vy := -gr.vy ; 
        end; 
      if ( ( ny - r <= 300 ) AND ( ny >= 250 ) AND ( nx >= 300 ) AND ( gr.y > 300 ) ) then 
        begin 
          ny := 300 + r ; 
          gr.vy := - gr.vy ; 
        end ; 
      if ( ( nx + r >= 300 ) AND ( ny >= 250 ) AND ( ny <= 300 ) AND ( gr.x < 300 ) ) then 
        begin 
          nx := 300 -r ; 
          gr.vx := -gr.vx ; 
        end ; 
    end ; 
  gr.x := nx ; 
  gr.y := ny ; 
end ; 

function koniec ( var uciek , pogon : gracz ) : boolean ; 
{ SPRAWDZA CZY UCIEKINIER NIE ZOSTAL ZLAPANY } 

begin 
  koniec := ( sqr ( uciek.x - pogon.x ) + sqr ( uciek.y - pogon.y ) ) < sqr ( 2*r ) ; 
end ; 

function sign ( value : real ) : real ; 

begin 
  if ( value >= 0 ) then 
    sign := 1 
  else 
    sign := -1 ; 
end ; 

procedure obslugazdarzen ( var uciek , pogon : gracz ) ; 
{ OBSLUGUJE STEROWANIE ZA POMOCA ZDARZEN } 

var 
   typ_zdarzenia , x , y , oldx , oldy : integer ; 
begin 
  while isevent do 
    begin 
      event ( typ_zdarzenia , x , y ) ; 
      case typ_zdarzenia of 
        zdarzenielewyprzycisk: 
          begin 
            pogon.vx := pogon.vx + 2*sign ( x - pogon.x ) ; 
            pogon.vy := pogon.vy + 2*sign ( y - pogon.y ) ; 
          end ; 
        zdarzenielewywleczenie: 
          begin 
            pogon.vx := pogon.vx + sign ( x - pogon.x ) ; 
            pogon.vy := pogon.vy + sign ( y - pogon.y ) ; 
          end ; 
        zdarzenieklawiatury: 
          begin 
            case x of 
              37 : 
                uciek.vx := uciek.vx - 2 ; 
              38 : 
                uciek.vy := uciek.vy - 2 ; 
              39 : 
                uciek.vx := uciek.vx + 2 ; 
              40 : 
                uciek.vy := uciek.vy + 2 ; 
            end ; 
          end; 
      end; 
    end; 
end; 

function gameover ( punkty , wynik : integer ; var uciek , pogon : gracz ) : integer ; 
{ PROCEDURKA EFEKTOW SPECJALNYCH KONCA GRY } 

var 
   x , y , r : integer ; 
   xp , yp : integer; 
   { przesuniecie } 
   odp : integer ; 
   { ponowne } 
begin 
  clear ; 
  brush ( 0 , 0 , 0 , 0 ) ; 
  xp := 80 ; 
  yp := 80 ; 
  { FFF } 
  brush ( 1 , 100 , 100 , 200 ) ; 
  rectangle ( 0 + xp , 20 + yp , 40 + xp , 60 + yp ) ; 
  brush ( 1 , 100 , 100 , 190 ) ; 
  rectangle ( 0 + xp , 60 + yp , 40 + xp , 100 + yp ) ; 
  brush ( 1 , 100 , 100 , 180 ) ; 
  rectangle ( 0 + xp , 100 + yp , 40 + xp , 140 + yp ) ; 
  brush ( 1 , 100 , 100 , 170 ) ; 
  rectangle ( 0 + xp , 140 + yp , 40 + xp , 180 + yp ) ; 
  brush ( 1 , 100 , 100 , 160 ) ; 
  rectangle ( 0 + xp , 180 + yp , 40 + xp , 220 + yp ) ; 
  brush ( 1 , 100 , 100 , 200 ) ; 
  rectangle ( 40 + xp , 20 + yp , 80 + xp , 60 + yp) ; 
  rectangle ( 80 + xp , 20 + yp , 120 + xp , 60 + yp) ; 
  brush ( 1 , 100 , 100 , 180 ) ; 
  rectangle ( 40 + xp , 100 + yp , 80 + xp , 140 + yp ) ; 
  { CIEN } 
  line ( 0 + xp , 20 + yp , 20 + xp , 0 + yp ) ; 
  line ( 40 + xp , 20 + yp , 60 + xp , 0 + yp ) ; 
  line ( 80 + xp , 20 + yp , 100 + xp , 0 + yp ) ; 
  line ( 120 + xp , 20 + yp , 140 + xp , 0 + yp ) ; 
  line ( 120 + xp , 60 + yp , 140 + xp , 40 + yp) ; 
  line ( 40 + xp , 100 + yp , 60 + xp , 80 + yp ) ; 
  line ( 80 + xp , 100 + yp , 100 + xp , 80 + yp ) ; 
  line ( 80 + xp , 140 + yp , 100 + xp , 120 + yp ) ; 
  line ( 40 + xp , 180 + yp , 60 + xp , 160 + yp ) ; 
  line ( 40 + xp , 220 + yp , 60 + xp , 200 + yp ) ; 
  line ( 20 + xp , 0 + yp, 140 + xp , 0 + yp ) ; 
  line ( 140 + xp , 0 + yp , 140 + xp , 40 + yp ) ; 
  line ( 60 + xp , 60 + yp , 60 + xp , 80 + yp ) ; 
  line ( 60 + xp , 80 + yp , 100 + xp , 80 + yp ) ; 
  line ( 100 + xp , 80 + yp , 100 + xp , 120 + yp ) ; 
  line ( 60 + xp , 140 + yp , 60 + xp , 200 + yp ) ; 
  brush ( 1 , 255 , 255 , 255 ) ; 
  moveto ( 0 + yp , 240 + yp ) ; 
  writeln ( 'Fin / End / Koniec' ) ; 
  textcolor ( random ( 255 ) , random ( 255 ) , random ( 255 ) ) ; 
  moveto ( 0 + yp , 260 + yp ) ; 
  writeln ( 'uciekinier przetrwal ' , wynik , ' dziesiatych sekundy' ) ; 
  moveto ( 0 + yp , 280 + yp ) ; 
  writeln ( 'ilosc punktow: ' , punkty ) ; 
  textcolor ( 0 , 0 , 0 ) ; 
  writeln ( 'Czy chcesz zagrac jeszcze raz? ' ) ; 
  repeat 
    writeln ( '(1) TAK | (0) NIE' ) ; 
    write ( 'Wybor: ' ) ; 
    readln ( odp ) ; 
  until ( ( odp >= 0 ) AND ( odp <= 1 ) ) ; 
  gameover := odp ; 
end; 

procedure rysuj_tytul ( ) ; 

var 
   x , y : integer; 
   { przesuwanie } 
begin 
  x := 160 ; 
  y := 160 ; 
  rectangle ( 0+x , 0+y , 40+x , 40+y ) ; 
  rectangle ( 0+x , 40+y , 40+x , 80+y ) ; 
  rectangle ( 0+x , 80+y , 40+x , 120+y ) ; 
  rectangle ( 0+x , 120+y , 40+x , 160+y ) ; 
  rectangle ( 0+x , 160+y , 40+x , 200+y ) ; 
  rectangle ( 40+x , 160+y , 80+x , 200+y ) ; 
  rectangle ( 80+x , 160+y , 120+x , 200+y ) ; 
  rectangle ( 120+x , 160+y , 160+x , 200+y ) ; 
  rectangle ( 120+x , 0+y , 160+x , 40+y ) ; 
  rectangle ( 120+x , 40+y , 160+x , 80+y) ; 
  rectangle ( 120+x , 80+y , 160+x , 120+y ) ; 
  rectangle ( 120+x , 120+y , 160+x , 160+y ) ; 
  rectangle ( 200+x , 0+y , 240+x , 40+y ) ; 
  rectangle ( 200+x , 40+y , 240+x , 80+y ) ; 
  rectangle ( 200+x , 80+y , 240+x , 120+y ) ; 
  rectangle ( 200+x , 160+y , 240+x , 200+y ) ; 
  moveto ( 0+x , 240+y ) ; 
end ; 

var 
   uciekacz,poganiacz:gracz; 
   wynik , punkty , predkosc , wspol_predkosci , plansza :integer; 

begin 
  repeat 
    clear ; 
    rysuj_tytul ; 
    writeln ( 'Ucieczka!' ) ; 
    repeat 
      write ( 'Predkosc ( 1..5 ): ' ) ; 
      readln ( predkosc ) ; 
    until ( ( predkosc <= 5 ) AND ( predkosc >= 1 ) ); 
    case predkosc of 
      1 : 
        wspol_predkosci := 100 ; 
      2 : 
        wspol_predkosci := 70 ; 
      3 : 
        wspol_predkosci := 50 ; 
      4 : 
        wspol_predkosci := 30 ; 
      5 : 
        wspol_predkosci := 10 ; 
    end ; 
    { WSPOLCZYNNIK WPLYWA NA ILOSC PUNKTOW } 
    writeln ( 'Wybierz plansze: ' ) ; 
    writeln ( '1) PROSTA' ) ; 
    writeln ( '2) UTRUDNIONA' ) ; 
    repeat 
      write ( 'Wybor: ' ) ; 
      readln ( plansza ) ; 
    until ( ( plansza >= 1 ) AND ( plansza <= 2 ) ) ; 
    clear ; 
    moveto ( 0 , maxy + 40 ) ; 
    writeln ( 'zasady gry:' ) ; 
    writeln ( 'czerwony uciekinier sterowany strzalkami musi jak najdluzej ' ) ; 
    writeln ( 'wymykac sie niebieskiemu zaganiaczowi sterowanemu myszka.' ) ; 
    wynik := 0 ; 
    punkty := 0 ; 
    inicjujgracza ( uciekacz , 50 , 50 , 255 , 0 , 0 ) ; 
    inicjujgracza ( poganiacz , maxx - 50 , maxy - 50 , 0 , 255 , 255 ) ; 
    rectangle ( 0 , 0 , maxx + 1, maxy + 1 ) ; 
    if ( plansza <> 1 ) then 
      begin 
        rectangle ( 0 , 100 , 200 , 150 ) ; 
        rectangle ( 300 , 250 , 500 , 300 ) ; 
      end ; 
    graczwchodzi ( uciekacz ) ; 
    graczwchodzi ( poganiacz ) ; 
    repeat 
      obslugazdarzen ( uciekacz , poganiacz ) ; 
      graczznika ( uciekacz ) ; 
      ruchgracza ( plansza , uciekacz ) ; 
      graczwchodzi ( uciekacz ) ; 
      graczznika ( poganiacz ) ; 
      ruchgracza ( plansza , poganiacz ) ; 
      graczwchodzi ( poganiacz ) ; 
      delay ( wspol_predkosci ) ; 
      wynik := wynik+1 ; 
      punkty := punkty + 1 + wspol_predkosci ; 
      moveto ( 0 , maxy + 10 ) ; 
      writeln ( 'czas uciekiniera:' , wynik ) ; 
      writeln ( 'punkty:' , punkty ) ; 
    until koniec ( uciekacz , poganiacz) ; 
  until ( gameover ( punkty , wynik , uciekacz , poganiacz ) = 0 ) ; 
end.
