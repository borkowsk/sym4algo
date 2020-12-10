program statystyka_zad8; 

const 
   liczba = 10; 
var 
   i , w_suma , w_zera : integer ; 
   wart : array [0..liczba] of integer ; 
   w_srednia : real ; 

procedure suma ( var suma_ret : integer ) ; 

var 
   i : integer; 
begin 
  suma_ret := 0 ; 
  for i:=0 to liczba do 
    suma_ret := suma_ret + wart[i] ; 
end ; 

procedure srednia ( var srednia_ret : real ) ; 

var 
   i , suma1 : integer ; 
begin 
  suma ( suma1 ) ; 
  srednia_ret := 0 ; 
  srednia_ret := suma1 / liczba ; 
end ; 

procedure zera ( var zera_ret : integer ) ; 

var 
   i : integer; 
begin 
  zera_ret := 0 ; 
  for i:=0 to liczba do 
    if ( wart[i] = 0 ) then 
      zera_ret := zera_ret + 1 ; 
end ; 

function srednia_ujemnych : real ; 

var 
   i , suma1 , ilosc1 : integer ; 
begin 
  suma1 := 0 ; 
  ilosc1 := 0 ; 
  for i:=0 to liczba do 
    begin 
      if ( wart[i] < 0 ) then 
        begin 
          suma1 := suma1 + wart[i] ; 
          ilosc1 := ilosc1 + 1 ; 
        end ; 
      if ( ilosc1 <> 0 ) then 
        srednia_ujemnych := suma1 / ilosc1 
      else 
        srednia_ujemnych := 1 ; 
    end ; 
end ; 

function srednia_dodatnich : real ; 

var 
   i , suma1 , ilosc1 : integer ; 
begin 
  suma1 := 0 ; 
  ilosc1 := 0 ; 
  for i:=0 to liczba do 
    begin 
      if ( wart[i] >= 0 ) then 
        begin 
          suma1 := suma1 + wart[i] ; 
          ilosc1 := ilosc1 + 1 ; 
        end ; 
      if ( ilosc1 <> 0 ) then 
        srednia_dodatnich := suma1 / ilosc1 
      else 
        srednia_dodatnich := -1 ; 
    end; 
end; 

function odchylenie_srednie : real ; 

var 
   i : integer ; 
   srednia1 , suma2 : real ; 
begin 
  suma2 := 0 ; 
  srednia ( srednia1 ) ; 
  for i:=0 to liczba do 
    suma2 := suma2 + abs( wart[i] - srednia1 ) ; 
  odchylenie_srednie := suma2 / liczba ; 
end; 

begin 
  writeln ( 'Podaj liczby' ) ; 
  for i:=0 to liczba do 
    begin 
      write ( 'Podaj liczbe ' , ( i + 1 ) , ': ' ) ; 
      readln ( wart[i] ) ; 
    end ; 
  writeln; 
  writeln ( '----------' ) ; 
  writeln ( 'statystyki' ) ; 
  writeln ; 
  suma ( w_suma ) ; 
  srednia ( w_srednia ) ; 
  zera ( w_zera ) ; 
  writeln ( 'Suma danych: ' , w_suma ) ; 
  writeln ( 'Srednia danych: ' , w_srednia :3:4 ) ; 
  writeln ( 'Liczba zer: ' , w_zera ) ; 
  write ( 'Srednia liczb ujemnych: ' ) ; 
  if ( srednia_ujemnych = 1 ) then 
    writeln ( 'brak liczb ujemnych' ) 
  else 
    writeln ( srednia_ujemnych :3:4 ); 
  write ( 'Srednia liczb dodatnich: ' ) ; 
  if ( srednia_dodatnich = -1 ) then 
    writeln ( 'brak liczba dodatnich' ) 
  else 
    writeln ( srednia_dodatnich :3:4 ); 
  writeln ( 'Odchylenie srednie: ' , odchylenie_srednie :3:4 ) ; 
end.
