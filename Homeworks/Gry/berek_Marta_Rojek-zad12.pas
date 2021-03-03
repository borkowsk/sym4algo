
program berek; 
{ prosta gra w berka - jeden gracz steruje uciekinierem strzalkami drugi berkiem za pomoca myszy } 

const 
   { rozmiary planszy } 
   maxx = 500 ; 
   maxy = 400 ; 
   r = 10 ; 
   { zdarzenie generowane przez algo } 
   zdarzenieklawiatury = 1 ; 
   zdarzenielewyprzycisk = 2 ; 
   zdarzenielewywleczenie = 3 ; 

   
type 
   gracz = record 
   {typ rekordowy dla gracza} 
        x , y : real ; 
        { polozenie } 
        vx , vy : real ; 
        { predkosc } 
        r , g , b : integer ; 
        { kolor } 
 
   end; 

procedure inicjujgracza ( var gr : gracz ; x , y : real ; r , g , b : integer ) ; 
{ ustala poczatkowe parametry gracza } 

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
{ rysuje gracza w aktualnej pozycji } 

begin 
  brush ( 1 , gr.r , gr.g , gr.b ) ; 
  pen ( 1 , gr.r , gr.g , gr.b ) ; 
  ellipse ( round ( gr.x - r ) , round ( gr.y - r ) , round ( gr.x + r ) , round ( gr.y + r ) ) ; 
  pen ( 1 , 0 , 0 , 0 ) ; 
  line ( round ( gr.x ) , round ( gr.y ) , round ( gr.x + gr.vx ) , round ( gr.y ) ) ; 
  line( round ( gr.x ) , round ( gr.y ) , round ( gr.x ) , round ( gr.y + gr.vy ) ) ; 
end ; 

procedure graczznika ( var gr : gracz ) ; 
{ zamazuje gracza w aktualnej pozycji } 

begin 
  brush ( 1 , 255 , 255 , 255 ) ; 
  pen ( 1 , 255 , 255 , 255 ) ; 
  ellipse ( round ( gr.x - r ) , round ( gr.y - r ) , round ( gr.x + r ) , round ( gr.y + r ) ) ; 
  pen ( 1 , 0 , 0 , 0 ) ; 
end ; 

procedure ruchgracza ( plansza : integer ; var gr : gracz ) ; 
{ przemieszcza gracza zgodnie z zasadami prostej fizyki } 

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
      nx := r + 1  ; 
      gr.vx := -gr.vx ; 
      { odbijanie } 
    end ; 
  if nx + r >= maxx then 
    begin 
      nx := maxx - r ; 
      gr.vx := -gr.vx ; 
      { odbijanie } 
    end; 
  if ny - r <= 1  then 
    begin 
      ny := r + 1  ; 
      gr.vy := -gr.vy ; 
      { odbijanie } 
    end ; 
  if ny + r >= maxy  then 
    begin 
      ny := maxy  - r ; 
      gr.vy := -gr.vy ; 
      { odbijanie } 
    end ; 
  
  if ( plansza = 2 ) then begin { druga plansza } 
  
    {b}
  if ( ( nx + r >= 240 ) and ( nx <= 260 ) and ( ny <= 90 ) and ( gr.x < 240 ) ) then
    begin
      nx := 240 - r ;
    gr.vx := -gr.vx ;
    end ;
    
  if ( ( nx - r <= 260 ) and ( nx >= 240 ) and ( ny <= 90 ) and ( gr.x > 260 ) ) then
    begin
      nx := 240 + r ;
    gr.vx := -gr.vx ;
    end ;
    
  if ( ( ny - r <= 90 ) and ( nx >= 240 ) and ( nx <= 260 ) and ( gr.y > 90 ) ) then
    begin
      ny := 90 + r ;
    gr.vy := -gr.vy ;
      end ;
  {c}
  
    {d}
  if ( ( nx + r >= 200 ) and ( nx <= 220 ) and ( ny >= 240 ) and ( gr.x < 200 ) ) then
    begin
      nx := 200 - r ;
    gr.vx := -gr.vx ;
    end ;
    
  if ( ( ny + r >= 240 ) and ( ny >= 200 ) and ( ny <= 220 ) and ( gr.y < 240 ) ) then
    begin
      ny := 240 - r ;
    gr.vy := -gr.vy ;
    end ;
    
  if ( ( nx - r <= 220 ) and ( nx >= 200 ) and ( ny >= 240 ) and ( gr.x > 220 ) ) then
    begin
      nx := 220 + r ;
    gr.vx := -gr.vx ;
    end ;
  {e}
  end ;
  

  
  gr.x := nx ; 
  gr.y := ny ; 
end ; 
  
function koniec ( var uciek , pogon : gracz ) : boolean ; 
{ sprawdza czy uciekinier nie zostal zlapany } 

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
{ obsluguje sterowanie za pomoca zdarzen } 

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

function gameover ( wynik : integer ; var uciek , pogon : gracz ) : integer ; 
{ procedurka efektow specjalnych konca gry } 

var 
   x , y , r : integer ; 
   xp , yp : integer; { przesuniecie }
   odp : integer ; { ponowne }
begin 
  clear ;
  playsound ( 1 , 'c:\winnt\media\tada.wav' ) ;
    brush ( 0 , 0 , 0 , 0 ) ;
    r := 1 ;
    x := round ( uciek.x + pogon.x ) div 2 ;
    y := round ( uciek.y + pogon.y ) div 2 ;

    repeat
        pen ( 1 , random ( 255 ) , random ( 255 ) , random ( 255 ) ) ;
        ellipse ( x - r , y - r , x + r , y + r ) ;
        r := r + 1;
    until ( ( r > 500 ) and ( isevent ) ) or ( r > 2000 ) ;
    
    textcolor ( random ( 255 ) , random ( 255 ) , random ( 255 ) ) ;
    font ( 15 , 0 , 60 ) ;
    moveto ( 10 , y ) ;
    write ( 'uciekinier przetrwal ' , wynik , ' dziesiatych sekundy' ) ;;
  
 
  writeln ( 'gramy kolejny raz? tak - 2 , nie - 1 ' ) ;

  repeat
    write ( 'odpowiedz: ' ) ;
    readln ( odp ) ;
  until ( ( odp >= 1 ) and ( odp <= 2 ) ) ;
  gameover := odp - 1 ;
  
  
end; 

procedure tytul ( ) ; 

var 
   pol_x , pol_y , i : integer; 

begin 
  pol_x := 240 ; 
  pol_y := 240 ; 
  
  
  for i:=1 to 10 do begin
    moveto ( pol_x , pol_y + i * 20 ) ;
    textcolor ( random(255) , random(255) , random(255) ) ;
  writeln ( 'uciekacz kontra poganiacz' );
  end ;  
  

end ; 

var 
   uciekacz,poganiacz:gracz; 
   wynik , predkosc , plansza :integer; 

begin 

  repeat
    clear;

    tytul ; 

    repeat
      write ( 'numer planszy? - 1 , 2 ?: ' ) ; 
      readln ( plansza ) ;
    until ( ( plansza >= 1 ) and ( plansza <= 2 ) ) ;
    
    clear ; 
    moveto ( 0 , maxy + 40 ) ; 
    writeln ( 'zasady gry:' ) ; 
    writeln ( 'czerwony uciekinier sterowany strzalkami musi jak najdluzej ' ) ; 
    writeln ( 'wymykac sie niebieskiemu zaganiaczowi sterowanemu myszka.' ) ; 
  
    wynik := 0 ; 

  
    inicjujgracza ( uciekacz , 50 , 50 , 255 , 0 , 0 ) ; 
    inicjujgracza ( poganiacz , maxx - 50 , maxy - 50 , 0 , 255 , 255 ) ; 
    rectangle ( 0 , 0  , maxx + 1, maxy + 1  ) ; 
    
  if ( plansza = 2 ) then begin
    
    rectangle ( 240 , 0 , 260 , 90 ) ;{b}

    rectangle ( 200 , 240 , 220 , 400 ) ;

  end
  else begin
   
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
      delay ( 50 ) ; 
      wynik := wynik+1 ; 

      moveto ( 0 , maxy + 10  ) ; 
      writeln ( 'czas uciekiniera:' , wynik ) ; 
    until koniec ( uciekacz , poganiacz) ;
  
  until ( gameover ( wynik , uciekacz , poganiacz ) = 0 ) ; 
end.