program kik ; 
{ KOLKO I KRZYZYK } 

const 
   { WSPOLCZYNNIKI PRZYDATNE PRZY PRZESUWANIU } 
   mvx = 50 ; 
   mvy = 50 ; 
   labx = 147 ; 
   laby = 142 ; 
var 
   plansza : array [ 0..8 ] of integer ; 
   { PLANSZA } 
   pole, i : integer ; 
   { PRZYDATNE ZMIENNE , POLE - WCZYTYWANE Z KLAW, I - DO ITERACJI } 
   ip_1 : integer ; 
   { IDIOT PROOF1 } 
   r : integer ; 
   { ZMIENNA TYMCZASOWA , ZAPISUJE RUCH KOMPUTERA } 
   w_pole1 , w_pole2 , w_pole3 : integer ; 
   { WYGRANE POLA - PRZYDATNE DO RYSOWANIA ZAKONCZENIA } 
   { FUNKCJE GRAFICZNE } 

procedure rysuj_x ( pole : integer ) ; 
{ RYSUJE NA PLANSZY X - GRACZA } 

var 
   x1 , x2 , y1 , y2 : integer ; 
begin 
  x1 := ( pole mod 3 ) * 160 ; 
  x2 := 160 + x1 ; 
  y1 := ( pole div 3 ) * 160 ; 
  y2 := y1 + 160 ; 
  x1 := x1 + 30 ; 
  x2 := x2 - 30 ; 
  y1 := y1 + 30 ; 
  y2 := y2 - 30 ; 
  pen ( 4 , 0 , 0 , 0 ) ; 
  line ( x1 + mvx , y1 + mvy , x2 + mvx , y2 + mvy ) ; 
  line ( x1 + mvx , y2 + mvy , x2 + mvx , y1 + mvy ) ; 
end ; 

procedure rysuj_o ( pole : integer ) ; 
{ RYSUJE NA PLANSZY 0 - KOMPUTER } 

var 
   x1 , x2 , y1 , y2 : integer ; 
begin 
  x1 := ( pole mod 3 ) * 160 ; 
  x2 := 160 + x1 ; 
  y1 := ( pole div 3 ) * 160 ; 
  y2 := y1 + 160 ; 
  x1 := x1 + 30 ; 
  x2 := x2 - 30 ; 
  y1 := y1 + 30 ; 
  y2 := y2 - 30 ; 
  pen ( 4 , 0 , 0 , 0 ) ; 
  brush ( 0 , 255 , 255 , 255 ) ; 
  ellipse ( x1 + mvx , y1 + mvy , x2 + mvx , y2 + mvy ) ; 
end ; 

procedure zakresl ( pole : integer ) ; 
{ ZAKRESLA POLA PRZY ZAKONCZENIU } 

var 
   x1 , x2 , y1 , y2 : integer ; 
begin 
  x1 := ( pole mod 3 ) * 160 ; 
  x2 := 160 + x1 ; 
  y1 := ( pole div 3 ) * 160 ; 
  y2 := y1 + 160 ; 
  pen ( 3 , 250 , 0 , 150 ) ; 
  brush ( 0 , 250 , 250 , 250 ) ; 
  rectangle ( x1 + mvx , y1 + mvy , x2 + mvx , y2 + mvy ) ; 
end ; 

procedure rysuj_plansze ; 
{ RYSUJE PLANSZE } 

begin 
  line ( 160 + mvx , 0 + mvy , 160 + mvx , 480 + mvy ) ; 
  line ( 320 + mvx , 0 + mvy , 320 + mvx , 480 + mvy ) ; 
  line ( 0 + mvx , 160 + mvy , 480 + mvx , 160 + mvy ) ; 
  line ( 0 + mvx , 320 + mvy , 480 + mvx , 320 + mvy ) ; 
  brush ( 1 , 200 , 200 , 170 ) ; 
  rectangle ( 0 + mvx , 0 + mvy , 160 + mvx , 160 + mvy ) ; 
  brush ( 1 , 200 , 200 , 165 ) ; 
  rectangle ( 160 + mvx , 0 + mvy , 320 + mvx , 160 + mvy ) ; 
  brush ( 1 , 200 , 200 , 170 ) ; 
  rectangle ( 320 + mvx , 0 + mvy , 480 + mvx , 160 + mvy ) ; 
  brush ( 1 , 200 , 200 , 175 ) ; 
  rectangle ( 0 + mvx , 160 + mvy , 160 + mvx , 320 + mvy ) ; 
  brush ( 1 , 200 , 200 , 180 ) ; 
  rectangle ( 160 + mvx , 160 + mvy , 320 + mvx , 320 + mvy ) ; 
  brush ( 1 , 200 , 200 , 175 ) ; 
  rectangle ( 320 + mvx , 160 + mvy , 480 + mvx , 320 + mvy ) ; 
  brush ( 1 , 200 , 200 , 160 ) ; 
  rectangle ( 0 + mvx , 320 + mvy , 160 + mvx , 480 + mvy ) ; 
  brush ( 1 , 200 , 200 , 165 ) ; 
  rectangle ( 160 + mvx , 320 + mvy , 320 + mvx , 480 + mvy ) ; 
  brush ( 1 , 200 , 200 , 170 ) ; 
  rectangle ( 320 + mvx , 320 + mvy , 480 + mvx , 480 + mvy ) ; 
  moveto ( 2 + mvx + labx, 1 + mvy + laby ) ; 
  write ( '0' ) ; 
  moveto ( 162 + mvx + labx, 1 + mvy + laby ) ; 
  write ( '1' ) ; 
  moveto ( 322 + mvx + labx, 1 + mvy + laby ) ; 
  write ( '2' ) ; 
  moveto ( 2 + mvx + labx, 161 + mvy + laby ) ; 
  write ( '3' ) ; 
  moveto ( 162 + mvx + labx, 161 + mvy + laby ) ; 
  write ( '4' ) ; 
  moveto ( 322 + mvx + labx, 161 + mvy + laby) ; 
  write ( '5' ) ; 
  moveto ( 2 + mvx + labx, 321 + mvy + laby) ; 
  write ( '6' ) ; 
  moveto ( 162 + mvx + labx, 321 + mvy + laby) ; 
  write ( '7' ) ; 
  moveto ( 322 + mvx + labx, 321 + mvy + laby ) ; 
  write ( '8' ) ; 
  pen ( 1 , 255 , 255 , 255 ) ; 
  brush ( 0 , 200 , 200 , 200 ) ; 
  rectangle ( 1 + mvx , 1 + mvy , 159 + mvx , 159 + mvy ) ; 
  rectangle ( 161 + mvx , 1 + mvy , 319 + mvx , 159 + mvy ) ; 
  rectangle ( 321 + mvx , 1 + mvy , 479 + mvx , 159 + mvy ) ; 
  rectangle ( 1 + mvx , 161 + mvy , 159 + mvx , 319 + mvy ) ; 
  rectangle ( 161 + mvx , 161 + mvy , 319 + mvx , 319 + mvy ) ; 
  rectangle ( 321 + mvx , 161 + mvy , 479 + mvx , 319 + mvy ) ; 
  rectangle ( 1 + mvx , 321 + mvy , 159 + mvx , 479 + mvy ) ; 
  rectangle ( 161 + mvx , 321 + mvy , 319 + mvx , 479 + mvy ) ; 
  rectangle ( 321 + mvx , 321 + mvy , 479 + mvx , 479 + mvy ) ; 
end ; 

procedure rect ( x1 , x2 , y1 , y2 : integer ) ; 
{ RYSOWANIE PROSTOKATA - Z BARDZIEJ PRZYDATNA KOLEJNOSCIA I OPOZNIENIEM } 

begin 
  rectangle ( x1 + mvx , y1 + mvy , x2 + mvx , y2 + mvy ) ; 
  delay ( 50 ) ; 
end ; 

function ost_test ( i , j , w_pole : integer ) : integer ; 
{ FUNKCJA PRZYDATNA PRZY RYSOWANIU ZAKONCZENIA
  INTERPRETUJE WSPOLRZEDNE NA POLA } 
var 
   i1 , i2 , j1 , j2 : integer ; 
begin 
  j1 := ( w_pole div 3 ) * 2 ; 
  j2 := ( w_pole div 3 ) * 2 + 1 ; 
  i1 := ( w_pole mod 3 ) * 2 ; 
  i2 := ( w_pole mod 3 ) * 2 + 1 ; 
  if ( ( ( i = i1 ) AND ( j = j1 ) ) OR ( ( i = i2 ) AND ( j = j1 ) ) OR ( ( i = i1 ) AND ( j = j2 ) ) OR ( ( i = i2 ) AND ( j = j2 ) ) ) then 
    ost_test := 1 
  else 
    ost_test := 0 ; 
end ; 

function ost_test_all ( i , j , wynik : integer ) : integer ; 
{ FUNKCJA WYKORZYSTUJACA 
FUNKCJE POW. DLA WSZYSTKICH WPOL WYGRANYCH } 
begin 
  if ( wynik <> 0 ) then 
    if ( (ost_test ( i , j , w_pole1 ) = 1 ) OR ( ost_test ( i , j , w_pole2 )= 1 ) OR ( ost_test ( i , j , w_pole3 ) = 1) ) then 
      ost_test_all := 1 
    else 
      ost_test_all := 0 
  else 
    ost_test_all := 0 ; 
end ; 

procedure rysuj_zakonczenie ( wynik : integer ) ; 
{ RYSOWANIE ZAKONCZENIA ROZGRYWKI } 
var 
   r , g , b , wspol : integer ; 
   a2 , b2 : array [ 0..5 ] of integer ; 
   i , j : integer ; 
begin 
  delay ( 150 ) ; 
  a2 [ 0 ] := 2 ; 
  b2 [ 0 ] := 80 ; 
  a2 [ 1 ] := 80 ; 
  b2 [ 1 ] := 158 ; 
  a2 [ 2 ] := 162 ; 
  b2 [ 2 ] := 240 ; 
  a2 [ 3 ] := 240 ; 
  b2 [ 3 ] := 318 ; 
  a2 [ 4 ] := 322 ; 
  b2 [ 4 ] := 400 ; 
  a2 [ 5 ] := 400 ; 
  b2 [ 5 ] := 478 ; 
  pen ( 1 , 0 , 0 , 0 ) ; 
  r := 200 ; 
  g := 200 ; 
  b := 200 ; 
  wspol := 1 ; 
  j := 0 ; 
  while ( j < 6 ) do 
    begin 
      for i:=5 downto 0 do 
        begin 
          brush ( 1 , r , g , b ) ; 
          b := b - wspol ; 
          if ( ost_test_all ( i , j , wynik ) <> 1 ) then 
            rect ( a2 [ i ] , b2 [ i ] , a2 [ j ] , b2 [ j ] ) ; 
        end; 
      j := j + 1 ; 
      for i:=0 to 5 do 
        begin 
          brush ( 1 , r , g , b ) ; 
          b := b - wspol ; 
          if ( ost_test_all ( i , j , wynik ) <> 1 ) then 
            rect ( a2 [ i ] , b2 [ i ] , a2 [ j ] , b2 [ j ] ) ; 
        end ; 
      j := j + 1 ; 
    end; 
  pen ( 1 , 255 , 255 , 255 ) ; 
  brush ( 1 , 255 , 255 , 255 ) ; 
  rectangle ( 0 + mvx , 500 + mvy , 160 + mvx , 600 + mvy ) ; 
  moveto ( 160 + mvx , 500 + mvy ) ; 
  case wynik of 
    0 : 
      write ( '!Nierozegrane!' ) ; 
    1 : 
      write ( '!Gracz Wygrywa!' ) ; 
    2 : 
      write ( '!Komputer Wygrywa!' ) ; 
  end ; 
end; 
{ FUNKCJE + PROCEDURY LOGICZNE } 

function same_test ( pole_a , pole_b , pole_c : integer ) : integer; 
{ SPRAWDZA CZY 3 POLA  MAJA IDENTYCZNE WARTOSCI ZWRACA 1 - TAK , 0 - NIE } 
begin 
  if ( ( plansza [ pole_a ] = plansza [ pole_b ] ) AND ( plansza [ pole_b ] = plansza [ pole_c ] ) ) then 
    same_test := 1 
  else 
    same_test := 0 ; 
end ; 

function same2 ( pole_a , pole_b , pole_c , wart : integer ) : integer ; 
{ SPRAWDZA CZY POLA MAJA PODANA WARTOSC ZWRACA 1 - TAK , 0 - NIE } 
begin 
  if ( ( plansza [ pole_a ] = wart ) AND ( plansza [ pole_b ] = wart ) AND ( plansza [ pole_c ] = wart ) ) then 
    begin 
      same2 := 1 ; 
      w_pole1 := pole_a ; 
      w_pole2 := pole_b ; 
      w_pole3 := pole_c ; 
      zakresl ( pole_a ) ; 
      zakresl ( pole_b ) ; 
      zakresl ( pole_c ) ; 
    end 
  else 
    same2 := 0 ; 
end ; 
{ RUCH } 

function ruch ( gracz , pozycja : integer ) : integer ; 
{ WYKONUJE RUCH GRACZA 
                                                            ZWRACA 1 - JESLI WYKONA
                                                            ZWRACA 2 - JESLI NIE } 

begin 
  if ( plansza [ pozycja ] = 0 ) then 
    begin 
      { SPRAWDZANIE CZY POZYCJA JEST WOLNA } 
      plansza [ pozycja ] := gracz ; 
      rysuj_x ( pozycja ) ; 
      ruch := 1 ; 
    end 
  else 
    ruch := 0 ; 
end; 

function koniec : integer ; 
{ FUNKCJA KTORA JEST WARUNKIEM ZAKONCZENIA PETLI GRY 
                                SPRAWDZA CZY GRACZ LUB KOMPUTER WYGRAL, 
                                BADZ BRAK MOZLIWYCH RUCHOW } 

begin 
  if ( ( ( plansza [ 0 ] <> 0 ) AND ( ( same_test ( 0 , 1 , 2 ) = 1 ) OR ( same_test ( 0 , 4 , 8 ) = 1 ) OR ( same_test ( 0 , 3 , 6 ) = 1 ) ) ) OR ( ( plansza [ 1 ] <> 0 ) AND ( same_test ( 1 , 4 , 7 ) = 1 ) ) OR ( ( plansza [ 2 ] <> 0 ) AND ( ( same_test ( 2 , 5 , 8 ) = 1 ) OR ( same_test ( 2 , 4 , 6 ) = 1 ) ) ) OR ( ( plansza [ 3 ] <> 0 ) AND ( same_test ( 3 , 4 , 5 ) = 1 ) ) OR ( ( plansza [ 6 ] <> 0 ) AND ( same_test ( 6 , 7 , 8 ) = 1 ) ) OR ( ( plansza [ 0 ] <> 0 ) AND ( plansza [ 1 ] <> 0 ) AND ( plansza [ 2 ] <> 0 ) AND ( plansza [ 3 ] <> 0 ) AND ( plansza [ 4 ] <> 0 ) AND ( plansza [ 5 ] <> 0 ) AND ( plansza [ 6 ] <> 0 ) AND ( plansza [ 7 ] <> 0 ) AND ( plansza [ 8 ] <> 0 ) ) ) then 
    koniec := 1 
  else 
    koniec := 0 ; 
end ; 

function test ( pole_a , pole_b , pole_c , wart_a , wart_b , wart_c : integer ) : integer ; 
{ FUNKCJA SPRAWDZA CZY 3 POLA MAJA 3 PODANE WARTOSCI , ZWRACA 0 , 1 } 

begin 
  if ( ( plansza [ pole_a ] = wart_a ) AND ( plansza [ pole_b ] = wart_b ) AND ( plansza [ pole_c ] = wart_c ) ) then 
    test := 1 
  else 
    test := 0 ; 
end ; 

function ruch_komp : integer ; 
{ FUNKCJA ODPOWIADAJACA ZA RUCH KOMPUTERA } 

var 
   r , a , i , ost : integer ; 
   ruch_podst : array [ 0 .. 8 ] of integer ; 
begin 
  {
        1. WYSZUKIWANIE POZYCJI WYGRYWAJACEJ
    } 
  if ( ( test ( 0 , 1 , 2 , 0 , 2 , 2 ) = 1 ) OR ( test ( 0 , 4 , 8 , 0 , 2 , 2 ) = 1 ) OR ( test ( 0 , 3 , 6 , 0 , 2 , 2 ) = 1 ) ) then 
    ruch_komp := 0 
  else 
    if ( ( test ( 0 , 1 , 2 , 2 , 0 , 2 ) = 1 ) OR ( test ( 1 , 4 , 7 , 0 , 2 , 2 ) = 1 ) ) then 
      ruch_komp := 1 
    else 
      if ( ( test ( 0 , 1 , 2 , 2 , 2 , 0 ) = 1 ) OR ( test ( 2 , 5 , 8 , 0 , 2 , 2 ) = 1 ) OR ( test ( 2 , 4 , 6 , 0 , 2 , 2 ) = 1 ) ) then 
        ruch_komp := 2 
      else 
        if ( ( test ( 0 , 3 , 6 , 2 , 0 , 2 ) = 1 ) OR ( test ( 3 , 4 , 5 , 0 , 2 , 2 ) = 1 ) ) then 
          ruch_komp := 3 
        else 
          if ( ( test ( 0 , 4 , 8 , 2 , 0 , 2 ) = 1 ) OR ( test ( 1 , 4 , 7 , 2 , 0 , 2 ) = 1 ) OR ( test ( 2 , 4 , 6 , 2 , 0 , 2 ) = 1 ) OR ( test ( 3 , 4 , 5 , 2 , 0 , 2 ) = 1 ) ) then 
            ruch_komp := 4 
          else 
            if ( ( test ( 2 , 5 , 8 , 2 , 0 , 2 ) = 1 ) OR ( test ( 3 , 4 , 5 , 2 , 2 , 0 ) = 1 ) ) then 
              ruch_komp := 5 
            else 
              if ( ( test ( 0 , 3 , 6 , 2 , 2 , 0 ) = 1 ) OR ( test ( 2 , 4 , 6 , 2 , 2 , 0 ) = 1 ) OR ( test ( 6 , 7 , 8 , 0 , 2 , 2 ) = 1 ) ) then 
                ruch_komp := 6 
              else 
                if ( ( test ( 1 , 4 , 7 , 2 , 2 , 0 ) = 1 ) OR ( test ( 6 , 7 , 8 , 2 , 0 , 2 ) = 1 ) ) then 
                  ruch_komp := 7 
                else 
                  if ( ( test ( 0 , 4 , 8 , 2 , 2 , 0 ) = 1 ) OR ( test ( 2 , 5 , 8 , 2 , 2 , 0 ) = 1 ) OR ( test ( 6 , 7 , 8 , 2 , 2 , 0 ) = 1 ) ) then 
                    ruch_komp := 8 
                    {
                            2. NIWELOWANIE WYGRANEJ GRACZA
                        } 
                  else 
                    if ( ( test ( 0 , 1 , 2 , 0 , 1 , 1 ) = 1 ) OR ( test ( 0 , 4 , 8 , 0 , 1 , 1 ) = 1 ) OR ( test ( 0 , 3 , 6 , 0 , 1 , 1 ) = 1 ) ) then 
                      ruch_komp := 0 
                    else 
                      if ( ( test ( 0 , 1 , 2 , 1 , 0 , 1 ) = 1 ) OR ( test ( 1 , 4 , 7 , 0 , 1 , 1 ) = 1 ) ) then 
                        ruch_komp := 1 
                      else 
                        if ( ( test ( 0 , 1 , 2 , 1 , 1 , 0 ) = 1 ) OR ( test ( 2 , 5 , 8 , 0 , 1 , 1 ) = 1 ) OR ( test ( 2 , 4 , 6 , 0 , 1 , 1 ) = 1 ) ) then 
                          ruch_komp := 2 
                        else 
                          if ( ( test ( 0 , 3 , 6 , 1 , 0 , 1 ) = 1 ) OR ( test ( 3 , 4 , 5 , 0 , 1 , 1 ) = 1 ) ) then 
                            ruch_komp := 3 
                          else 
                            if ( ( test ( 0 , 4 , 8 , 1 , 0 , 1 ) = 1 ) OR ( test ( 1 , 4 , 7 , 1 , 0 , 1 ) = 1 ) OR ( test ( 2 , 4 , 6 , 1 , 0 , 1 ) = 1 ) OR ( test ( 3 , 4 , 5 , 1 , 0 , 1 ) = 1 ) ) then 
                              ruch_komp := 4 
                            else 
                              if ( ( test ( 2 , 5 , 8 , 1 , 0 , 1 ) = 1 ) OR ( test ( 3 , 4 , 5 , 1 , 1 , 0 ) = 1 ) ) then 
                                ruch_komp := 5 
                              else 
                                if ( ( test ( 0 , 3 , 6 , 1 , 1 , 0 ) = 1 ) OR ( test ( 2 , 4 , 6 , 1 , 1 , 0 ) = 1 ) OR ( test ( 6 , 7 , 8 , 0 , 1 , 1 ) = 1 ) ) then 
                                  ruch_komp := 6 
                                else 
                                  if ( ( test ( 1 , 4 , 7 , 1 , 1 , 0 ) = 1 ) OR ( test ( 6 , 7 , 8 , 1 , 0 , 1 ) = 1 ) ) then 
                                    ruch_komp := 7 
                                  else 
                                    if ( ( test ( 0 , 4 , 8 , 1 , 1 , 0 ) = 1 ) OR ( test ( 2 , 5 , 8 , 1 , 1 , 0 ) = 1 ) OR ( test ( 6 , 7 , 8 , 1 , 1 , 0 ) = 1 ) ) then 
                                      ruch_komp := 8 
                                    else 
                                      {
                                                  3. MOJ ULUBIONY RUCH
                                              } 
                                      if ( ( plansza [ 0 ] = 2 ) AND ( plansza [ 8 ] = 0 ) ) then 
                                        ruch_komp := 8 
                                      else 
                                        if ( ( plansza [ 0 ] = 0 ) AND ( plansza [ 8 ] = 2 ) ) then 
                                          ruch_komp := 0 
                                        else 
                                          if ( ( plansza [ 2 ] = 0 ) AND ( plansza [ 6 ] = 2 ) ) then 
                                            ruch_komp := 2 
                                          else 
                                            if ( ( plansza [ 2 ] = 2 ) AND ( plansza [ 6 ] = 0 ) ) then 
                                              ruch_komp := 6 
                                            else 
                                              if ( ( plansza [ 0 ] = 0 ) OR ( plansza [ 2 ] = 0 ) OR ( plansza [ 6 ] = 0 ) OR ( plansza [ 8 ] = 0 ) ) then 
                                                begin 
                                                  ost := 0 ; 
                                                  if ( plansza [ 0 ] = 0 ) then 
                                                    begin 
                                                      ruch_podst [ ost ] := 0 ; 
                                                      ost := ost + 1 ; 
                                                    end ; 
                                                  if ( plansza [ 2 ] = 0 ) then 
                                                    begin 
                                                      ruch_podst [ ost ] := 2 ; 
                                                      ost := ost + 1 ; 
                                                    end ; 
                                                  if ( plansza [ 6 ] = 0 ) then 
                                                    begin 
                                                      ruch_podst [ ost ] := 6 ; 
                                                      ost := ost + 1 ; 
                                                    end ; 
                                                  if ( plansza [ 8 ] = 0 ) then 
                                                    begin 
                                                      ruch_podst [ 3 ] := 8 ; 
                                                      ost := ost + 1 ; 
                                                    end ; 
                                                  randomize ; 
                                                  ruch_komp := ruch_podst [ random ( ost - 1 ) ] ; 
                                                end 
                                              else 
                                                begin 
                                                  ost := 0 ; 
                                                  for i:=0 to 8 do 
                                                    if ( plansza [ i ] = 0 ) then 
                                                      begin 
                                                        ruch_podst [ ost ] := i ; 
                                                        ost := ost + 1 ; 
                                                      end ; 
                                                  randomize ; 
                                                  ruch_komp := ruch_podst [ random( ost - 1 ) ] ; 
                                                end ; 
end; 

function wynik : integer ; 
{ ZWRACA WYNIK KONCOWY ROZGRYWKI
                                0 - NIEROZEGRANE
                                1 - WYGRYWA GRACZ
                                2 - WYGRYWA KOMPUTER } 

begin 
  if ( ( same2 ( 0 , 1 , 2 , 1 ) = 1 ) OR ( same2 ( 0 , 4 , 8 , 1 ) = 1 ) OR ( same2 ( 0 , 3 , 6 , 1 ) = 1 ) OR ( same2 ( 1 , 4 , 7 , 1 ) = 1 ) OR ( same2 ( 2 , 4 , 6 , 1 ) = 1 ) OR ( same2 ( 2 , 5 , 8 , 1 ) = 1 ) OR ( same2 ( 3 , 4 , 5 , 1 ) = 1 ) OR ( same2 ( 6 , 7 , 8 , 1 ) = 1 ) ) then 
    wynik := 1 
  else 
    if ( ( same2 ( 0 , 1 , 2 , 2 ) = 1 ) OR ( same2 ( 0 , 4 , 8 , 2 ) = 1 ) OR ( same2 ( 0 , 3 , 6 , 2 ) = 1 ) OR ( same2 ( 1 , 4 , 7 , 2 ) = 1 ) OR ( same2 ( 2 , 4 , 6 , 2 ) = 1 ) OR ( same2 ( 2 , 5 , 8 , 2 ) = 1 ) OR ( same2 ( 3 , 4 , 5 , 2 ) = 1 ) OR ( same2 ( 6 , 7 , 8 , 2 ) = 1 ) ) then 
      wynik := 2 
    else 
      wynik := 0 ; 
end ; 
{ GLOWNY PROGRAM } 

begin 
  for i:=0 to 8 do 
    plansza [ i ] := 0 ; 
  rysuj_plansze ; 
  repeat 
  { GLOWNA PETLA GRY } 
    ip_1 := 1 ; 
    repeat 
    { WPROWADZANIE + RUCH } 
      pen ( 1 , 255 , 255 , 255 ) ; 
      brush ( 1 , 255 , 255 , 255 ) ; 
      rectangle ( 0 + mvx , 500 + mvy , 160 + mvx , 600 + mvy ) ; 
      moveto ( 0 + mvx , 500 + mvy ) ; 
      write ( 'ruch gracza: ' ); 
      read ( pole ) ; 
      if ( ( pole >= 0 ) AND ( pole <= 8 ) AND ( ruch ( 1 , pole ) = 1 ) ) then 
        ip_1 := 0 ; 
    until ip_1 = 0 ; 
    if ( koniec <> 1 ) then 
      begin 
        { RUCH KOMPUTERA } 
        pen ( 1 , 255 , 255 , 255 ) ; 
        brush ( 1 , 255 , 255 , 255 ) ; 
        rectangle ( 0 + mvx , 500 + mvy , 160 + mvx , 600 + mvy ) ; 
        moveto ( 0 + mvx , 500 + mvy ) ; 
        writeln ( 'ruch komputera' ) ; 
        delay ( 100 ) ; 
        r := ruch_komp ; 
        plansza [ r ] := 2 ; 
        rysuj_o ( r ) ; 
      end; 
  until ( koniec = 1 ) ; 
  { WARUNEK KONCA PETLI } 
  rysuj_zakonczenie ( wynik ) ; 
  { RYSOWANIE ZAKONCZENIA GRY } 
end .
