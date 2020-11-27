program statystyki2; 

const 
   max = 10; 
   { ilosc liczb w tablicy wprowadzanych danych } 
type 
   wartosci = record 
        suma : integer ; 
        ilosc : integer ; 
   end; 
var 
   i : integer ; 
   liczby : array [1..max] of integer; 

function suma : integer ; 

var 
   i , suma_tmp : integer ; 
begin 
  suma_tmp := 0 ; 
  for i:=1 to max do 
    suma_tmp := suma_tmp + liczby[ i ]; 
  suma := suma_tmp ; 
end; 

function srednia : real ; 

begin 
  srednia := suma / max ; 
end; 

function liczba_zer : integer ; 

var 
   i , liczba_zer_tmp : integer ; 
begin 
  liczba_zer_tmp := 0 ; 
  for i:=1 to max do 
    if ( liczby[ i ] = 0 ) then 
      liczba_zer_tmp := liczba_zer_tmp + 1 ; 
  liczba_zer := liczba_zer_tmp ; 
end; 

procedure srednia_ujemnych ; 

var 
   i : integer ; 
   ujemne : wartosci ; 
begin 
  ujemne.suma := 0 ; 
  ujemne.ilosc := 0 ; 
  for i:=1 to max do 
    if ( liczby[ i ] < 0 ) then 
      begin 
        ujemne.suma := ujemne.suma + liczby[ i ] ; 
        ujemne.ilosc := ujemne.ilosc + 1 ; 
      end ; 
  if ( ujemne.ilosc <> 0 ) then 
    write ( ujemne.suma / ujemne.ilosc : 2 : 3 ) 
  else 
    write ( 'Brak' ) ; 
end ; 

procedure srednia_dodatnich ; 

var 
   i : integer ; 
   dodatnie : wartosci ; 
begin 
  dodatnie.suma := 0 ; 
  dodatnie.ilosc := 0 ; 
  for i:=1 to max do 
    if ( liczby[ i ] >= 0 ) then 
      begin 
        dodatnie.suma := dodatnie.suma + liczby[ i ] ; 
        dodatnie.ilosc := dodatnie.ilosc + 1 ; 
      end ; 
  if ( dodatnie.ilosc <> 0 ) then 
    write ( dodatnie.suma / dodatnie.ilosc : 2 : 3 ) 
  else 
    write ( 'Brak' ) ; 
end ; 

function odchylenie_standardowe : real ; 

var 
   i : integer ; 
   srednia_tmp , ostmp : real ; 
begin 
  ostmp := 0 ; 
  srednia_tmp := srednia ; 
  for i:=1 to max do 
    ostmp := ostmp + ( liczby[ i ] - srednia_tmp )*( liczby[ i ] - srednia_tmp ) ; 
  odchylenie_standardowe := ostmp / max ; 
end ; 

begin 
  for i:=1 to max do 
    begin 
      write ( 'Liczba ' , i , ': ' ) ; 
      readln ( liczby[ i ] ) ; 
    end ; 
  writeln; 
  writeln ( 'Statystyki' ) ; 
  writeln; 
  writeln ( 'Suma: ' , suma ); 
  writeln ( 'Srednia: ' , srednia : 2 : 3) ; 
  writeln ( 'Liczba zer: ' , liczba_zer ) ; 
  write ( 'Srednia ujemnych: ' ); 
  srednia_ujemnych ; 
  writeln ; 
  write ( 'Srednia dodatnich: ' ) ; 
  srednia_dodatnich ; 
  writeln ; 
  writeln ( 'Odchylenie standardowe: ' , odchylenie_standardowe : 2 : 3 ) ; 
end.
