program BazaAdresowa ; 
{(c)2007 Marta Rojek SWPS}
type 
   wpis = record 
        klucz : integer ; 
        imie , nazwisko : string [ 100 ] ; 
        ulica , miasto : string [ 100 ] ; 
        kod : string [ 6 ] ; 
        telefon : string [ 100 ] ; 
   end ; 
var 
   wszystkie : array [ 0..50 ] of wpis ; 
   { wartosci 500 - algo nie udzwignelo } 
   ilosc , ost_klucz : integer ; 
   tmp : wpis ; 
   m_var : integer ; 

procedure rec ( x1 , x2 , y1 , y2 : integer ) ; 
{ rysowanie prostokata - wygodniejsze wspolrzedne } 

begin 
  rectangle ( x1 , y1 , x2 , y2 ) ; 
end ; 

procedure lin ( x1 , x2 , y1 , y2 : integer ) ; 
{ rysowanie linii - wygodniejsze wspolrzedne } 

begin 
  line ( x1 , y1 , x2 , y2 ) ; 
end ; 

procedure kopiuj ( z : wpis ; var doc : wpis ) ; 
{ kopiowanie wartosci z jednego obiektu 'wpis' do drugiego } 

begin 
  doc.imie := z.imie ; 
  doc.nazwisko := z.nazwisko ; 
  doc.ulica := z.ulica ; 
  doc.miasto := z.miasto ; 
  doc.kod := z.kod ; 
  doc.telefon := z.telefon ; 
  doc.klucz := z.klucz ; 
end; 

procedure sortuj ; 
{ sortowanie tablicy wedlug nazwiska } 

var 
   i , ch , last : integer ; 
   tmp : wpis ; 
begin 
  last := ilosc ; 
  while ( last <> 0 ) do 
    begin 
      ch := 0 ; 
      for i := last downto 1 do 
        begin 
          if ( wszystkie [ last ].nazwisko < wszystkie [ i ].nazwisko ) then 
            begin 
              kopiuj ( wszystkie [ last ] , tmp ) ; 
              kopiuj ( wszystkie [ i ] , wszystkie [ last ] ) ; 
              kopiuj ( tmp , wszystkie [ i ] ) ; 
              ch := 1 ; 
            end ; 
        end ; 
      if ( ch = 0 ) then 
        last := last - 1 ; 
    end ; 
end ; 

procedure dodaj ( tmp : wpis ) ; 
{ dodawanie pozycji do tablicy } 

begin 
  ost_klucz := ost_klucz + 1 ; 
  tmp . klucz := ost_klucz ; 
  kopiuj ( tmp , wszystkie [ ilosc ] ) ; 
  sortuj ; 
  ilosc := ilosc + 1; 
end ; 

procedure usun ( klucz : integer ) ; 
{ usuwanie pozycji z tablicy } 

var 
   i , k : integer; 
   tmp : wpis ; 
begin 
  i := 0 ; 
  k := 0 ; 
  while ( ( wszystkie [ i ] . klucz <> klucz ) AND ( i < ilosc ) ) do 
    i := i + 1 ; 
  if ( wszystkie [ i ] . klucz = klucz ) then 
    k := i ; 
  for i := k to ( ilosc - 1 ) do 
    kopiuj ( wszystkie [ i + 1 ] , wszystkie [ i ] ) ; 
  wszystkie [ ilosc ] . imie := '' ; 
  wszystkie [ ilosc ] . nazwisko := '' ; 
  wszystkie [ ilosc ] . ulica := '' ; 
  wszystkie [ ilosc ] . miasto := '' ; 
  wszystkie [ ilosc ] . kod := '' ; 
  wszystkie [ ilosc ] . klucz := 0 ; 
  ilosc := ilosc - 1 ; 
end ; 

procedure drukuj1 ( i : integer ) ; 

begin 
  write ( wszystkie [ i ] . klucz , ': ' ) ; 
  write ( wszystkie [ i ] . imie , ' , ' ) ; 
  write ( wszystkie [ i ] . nazwisko , ' , ' ) ; 
  write ( wszystkie [ i ] . ulica , ' , ' ) ; 
  write ( wszystkie [ i ] . miasto , ' , ' ) ; 
  write ( wszystkie [ i ] . kod , ' , ' ) ; 
  write ( wszystkie [ i ] . telefon ) ; 
  writeln ; 
end ; 

procedure drukuj_wszystkie ; 
{ wypisywanie wszystkich elementow } 

var 
   x , y , i : integer ; 
begin 
  i := 0 ; 
  x := 20 ; 
  y := 80 ; 
  if ( i >= ilosc ) then 
    begin 
      moveto ( x , y - 20 ) ; 
      writeln ( 'baza pusta' ) 
    end 
  else 
    while ( i < ilosc ) do 
      begin 
        moveto ( x , y + i * 40 ) ; 
        drukuj1 ( i ) ; 
        lin ( 0 , 500 , y + 20 + i * 40 , y + 20 + i * 40 ) ; 
        i := i + 1 ; 
      end ; 
  moveto ( x , y + i * 40 ) ; 
  write ( 'Wcisnij enter' ) ; 
  readln ; 
end ; 

procedure drukuj_dla_litery ( litera : char ) ; 
{ wypisywanie dla danej litery ( od nazwiska ) } 

var 
   i , x , y : integer ; 
begin 
  i := 0 ; 
  x := 20 ; 
  y := 100 ; 
  while ( ( i < ilosc ) AND ( wszystkie [ i ] . nazwisko [ 1 ] <> litera ) ) do 
    i := i + 1 ; 
  if ( i >= ilosc ) then 
    begin 
      moveto ( x , y - 20 ) ; 
      writeln ( 'brak wynikow' ) 
    end 
  else 
    while ( ( i < ilosc ) AND ( wszystkie [ i ] . nazwisko [ 1 ] = litera ) ) do 
      begin 
        moveto ( x , y + i * 40 ) ; 
        drukuj1 ( i ) ; 
        lin ( 0 , 500 , y + 20 + i * 40 , y + 20 + i * 40 ) ; 
        i := i + 1 ; 
      end ; 
  write ( 'Wcisnij enter' ) ; 
  readln ; 
end ; 

procedure naglowek ( nag : string ) ; 
{ rysuje dany naglowek } 

var 
   k : integer ; 
begin 
  clear ; 
  textcolor ( 255 , 255 , 255 ) ; 
  font ( 10 , 0 , 1000 ) ; 
  for k := 100 downto 0 do 
    begin 
      brush ( 1 , 20 , 150 - k , 100 ) ; 
      rec ( 0 , 500 , 0 , 60 ) ; 
      moveto ( 20 , 20 ) ; 
      write ( nag ) ; 
      delay ( 1 ) ; 
    end ; 
  brush ( 1 , 255 , 255 , 255 ) ; 
  pen ( 1 , 0 , 0 , 0 ) ; 
  textcolor ( 0 , 0 , 0 ) ; 
  font ( 10 , 0 , 400 ) ; 
end ; 

function menu : integer ; 
{ rysuje menu } 

var 
   ready , wybor : integer ; 
begin 
  naglowek ( 'MENU' ) ; 
  moveto ( 20 , 80 ) ; 
  write ( 'Ilosc pozycji: ' , ilosc , '/50' ) ; 
  lin ( 0 , 500 , 100 , 100 ) ; 
  moveto ( 20 , 110 ) ; 
  write ( '1. Dodaj' ) ; 
  moveto ( 20 , 130 ) ; 
  write ( '2. Usun' ) ; 
  lin ( 0 , 500 , 150 , 150 ) ; 
  moveto ( 20 , 170 ) ; 
  write ( '3. Wyswietl wszystko' ) ; 
  moveto ( 20 , 190 ) ; 
  write ( '4. Wyswietl wg. litery' ) ; 
  lin ( 0 , 500 , 210 , 210 ) ; 
  moveto ( 20 , 230 ) ; 
  write ( '5. Zapisz' ) ; 
  moveto ( 20 , 250 ) ; 
  write ( '6. Otworz' ) ; 
  lin ( 0 , 500 , 270 , 270 ) ; 
  moveto ( 20 , 290 ) ; 
  write ( '7. Koniec' ) ; 
  lin ( 0 , 500 , 310 , 310 ) ; 
  moveto ( 20 , 330 ) ; 
  repeat 
    write ( 'Wybor: ' ) ; 
    readln ( wybor ) ; 
  until ( ( wybor < 8 ) AND ( wybor > 0 ) ) ; 
  menu := wybor ; 
end ; 

procedure dodawanie ; 
{ procedura dodawania danych do tablicy } 

var 
   tmp : wpis ; 
begin 
  naglowek ( 'DODAWANIE' ) ; 
  moveto ( 20 , 80 ) ; 
  write ( 'Imie: ' ) ; 
  readln ( tmp . imie ) ; 
  moveto ( 20 , 100 ) ; 
  write ( 'Nazwisko: ' ) ; 
  readln ( tmp . nazwisko ) ; 
  moveto ( 20 , 120 ) ; 
  write ( 'Ulica: ' ) ; 
  readln ( tmp . ulica ) ; 
  moveto ( 20 , 140 ) ; 
  write ( 'Kod: ' ) ; 
  readln ( tmp . kod ) ; 
  moveto ( 20 , 160 ) ; 
  write ( 'Miasto: ' ) ; 
  readln ( tmp . miasto ) ; 
  moveto ( 20 , 180 ) ; 
  write ( 'Telefon: ' ) ; 
  readln ( tmp . telefon ) ; 
  dodaj ( tmp ) ; 
  moveto ( 20 , 200 ) ; 
  write ( '... wpis dodano' ) ; 
  delay ( 20 ) ; 
end ; 

procedure usuwanie ; 
{ procedura usuwania pozycji z tablicy } 

var 
   i , numer , odp : integer ; 
begin 
  naglowek ( 'USUWANIE' ) ; 
  i := 0 ; 
  moveto ( 20 , 80 ) ; 
  write ( 'Wpis do usuniecia: ' ) ; 
  readln ( numer ) ; 
  moveto ( 20 , 100 ) ; 
  while ( ( i < ilosc ) AND ( wszystkie [ i ] . klucz <> numer ) ) do 
    i := i + 1 ; 
  if ( ( i < ilosc ) AND ( wszystkie [ i ] . klucz = numer ) ) then 
    begin 
      write ( 'Czy chcesz usunac wpis: ' , wszystkie [ i ] . klucz , ': ' , wszystkie [ i ] . imie , ' , ' , wszystkie [ i ] . nazwisko , ' ?' ) ; 
      write ( '(1-TAK)/(0-NIE): ') ; 
      readln ( odp ) ; 
      if ( odp = 1 ) then 
        usun ( i ) ; 
    end 
  else 
    write ( 'Brak wpisu o podanym kluczu' ) ; 
end ; 

procedure wyswietl_wszystkie ; 
{ wyswietlanie wszystkich, procedura dla wygody } 

begin 
  naglowek ( 'WYSWIETLANIE WSZYSTKICH' ) ; 
  drukuj_wszystkie ; 
end ; 

procedure wyswietl_wg_litery ; 
{ wyswietlanie dla pobranej litery, procedura dla wygody } 

var 
   litera : char ; 
begin 
  naglowek ( 'WYSWIETLANIE WG. LITERY' ) ; 
  moveto ( 20 , 80 ) ; 
  write ( 'Litera: ' ) ; 
  readln ( litera ) ; 
  drukuj_dla_litery ( litera ); 
end ; 

procedure zapisz ; 
{ zapisywanie danych do pliku
  format imie|nazwisko|ulica|miasto|kod|telefon
} 

var 
   plik : text ; 
   i : integer ; 
begin 
  i := 0 ; 
  assign ( plik , 'dane.txt' ) ; 
  rewrite ( plik ) ; 
  while ( i < ilosc ) do 
    begin 
      write ( plik , wszystkie [ i ] . imie , '|' ) ; 
      write ( plik , wszystkie [ i ] . nazwisko , '|' ) ; 
      write ( plik , wszystkie [ i ] . ulica , '|' ) ; 
      write ( plik , wszystkie [ i ] . miasto , '|' ) ; 
      write ( plik , wszystkie [ i ] . kod , '|' ) ; 
      writeln ( plik , wszystkie [ i ] . telefon ) ; 
      i := i + 1 ; 
    end ; 
  close ( plik ) ; 
end ; 

procedure otworz ; 
{ otwieranie danych z pliku } 

var 
   plik : text ; 
   i , k , n : integer ; 
   c : char ; 
   tmp : wpis ; 
   ln : string [ 255 ] ; 
begin 
  for i:=0 to ( ilosc-1 ) do 
    begin 
      wszystkie [ i ] . klucz := -1 ; 
      wszystkie [ i ] . imie := '' ; 
      wszystkie [ i ] . nazwisko := '' ; 
      wszystkie [ i ] . ulica := '' ; 
      wszystkie [ i ] . miasto := '' ; 
      wszystkie [ i ] . kod := '' ; 
      wszystkie [ i ] . telefon := '' ; 
    end ; 
  ilosc := 0 ; 
  ost_klucz := 0 ; 
  assign ( plik , 'dane.txt' ) ; 
  reset ( plik ) ; 
  { pobieranie poszczegolnych elementow wpisu } 
  while ( NOT eof( plik ) ) do 
    begin 
      k := 1 ; 
      ln := '' ; 
      while ( NOT eoln ( plik ) ) do 
        begin 
          read ( plik , c ) ; 
          ln := ln + c ; 
          k := k + 1 ; 
        end ; 
      { WCZYTANA LINIA Z PLIKU , K - dlugosc lini } 
      read ( plik , c ) ; 
      n := 1 ; 
      i := 1 ; 
      tmp . imie := '' ; 
      while ( ln [ i ] <> '|' ) do 
        begin 
          tmp . imie := tmp . imie + ln [ i ] ; 
          i := i + 1 ; 
          n := n + 1 ; 
        end ; 
      i := i + 1 ; 
      n := 1 ; 
      tmp . nazwisko := '' ; 
      while ( ln [ i ] <> '|' ) do 
        begin 
          tmp . nazwisko := tmp . nazwisko + ln [ i ] ; 
          i := i + 1 ; 
          n := n + 1 ; 
        end ; 
      i := i + 1 ; 
      n := 1 ; 
      tmp . ulica := '' ; 
      while ( ln [ i ] <> '|' ) do 
        begin 
          tmp . ulica := tmp . ulica + ln [ i ] ; 
          i := i + 1 ; 
          n := n + 1 ; 
        end ; 
      i := i + 1 ; 
      n := 1 ; 
      tmp . miasto := '' ; 
      while ( ln [ i ] <> '|' ) do 
        begin 
          tmp . miasto := tmp . miasto + ln [ i ] ; 
          i := i + 1 ; 
          n := n + 1 ; 
        end ; 
      i := i + 1 ; 
      n := 1 ; 
      tmp . kod := '' ; 
      while ( ln [ i ] <> '|' ) do 
        begin 
          tmp . kod := tmp . kod + ln [ i ] ; 
          i := i + 1 ; 
          n := n + 1 ; 
        end ; 
      i := i + 1 ; 
      n := 1 ; 
      tmp . telefon := '' ; 
      while ( i <> k ) do 
        begin 
          tmp . telefon := tmp . telefon + ln [ i ] ; 
          i := i + 1 ; 
          n := n + 1 ; 
        end ; 
      dodaj ( tmp ) ; 
    end ; 
  close ( plik ) ; 
end ; 

procedure koniec ; 
{ rysowanie konca } 

var 
   k : integer ; 
begin 
  clear ; 
  textcolor ( 255 , 255 , 255 ) ; 
  font ( 40 , 0 , 1000 ) ; 
  pen ( 1 , 0 , 0 , 0 ) ; 
  for k := 0 to 100 do 
    begin 
      brush ( 1 , 100 - k , 100 , 100 ) ; 
      rec ( 0 , 500 , 0 , 500 ) ; 
      moveto ( 200 , 200 ) ; 
      write ( 'KONIEC' ) ; 
      delay ( 5 ) ; 
    end ; 
end ; 
{ glowny program } 

begin 
  ost_klucz := 0 ; 
  ilosc := 0 ; 
  m_var := 0 ; 
  while ( m_var <> 7 ) do 
    begin 
      m_var := menu ; 
      { opcje menu } 
      case m_var of 
        1 : 
          dodawanie ; 
        2 : 
          usuwanie ; 
        3 : 
          wyswietl_wszystkie ; 
        4 : 
          wyswietl_wg_litery ; 
        5 : 
          zapisz ; 
        6 : 
          otworz ; 
        7 : 
          koniec ; 
      end ; 
    end ; 
end.
