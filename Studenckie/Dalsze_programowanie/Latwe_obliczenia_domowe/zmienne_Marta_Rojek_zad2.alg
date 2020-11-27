program zmienne; 

const 
   nazwa = 'Program "Zmienne" Marty Rojek' ; 
   x=5; 
   y=4; 
var 
   a , b : real; 

begin 
  writeln ( nazwa ) ; 
  writeln ; 
  { Pierwsze wyrazenie} 
  a := x + 2 ; 
  a := a * 3 ; 
  b := y - 2*x ; 
  b := 1 / b ; 
  a := a + b ; 
  writeln ( '1. Wyrazenie: (x+2)*3+1/(y-2*x)' ) ; 
  writeln ; 
  writeln ( 'Obliczenia "na raty": ' , a :1 :4) ; 
  write ( 'Obliczenie "(' , x , '+2)*3+1/(' , y , '-2*' , x , '): ' ) ; 
  writeln ( (x+2)*3+1/(y-2*x) :1 :3 ) ; 
  writeln ; 
  { Drugie wyrazenie} 
  a := 1 + x ; 
  a := a * 10 ; 
  b := y * 3 ; 
  a := a / b ; 
  writeln ( '2. Wyrazenie: ((1+x)*10)/(y*3)' ) ; 
  writeln ; 
  writeln ( 'Obliczenia "na raty": ' , a :1 :4) ; 
  write ( 'Obliczenie "((1+' , x , ')*10)/(' , y , '*3): ' ) ; 
  writeln ( ((1+x)*10)/(y*3) :1 :3 ) ; 
  writeln ; 
  { Trzecie wyrazenie} 
  a := 7 * 7 ; 
  b := x * y - 1 ; 
  b := -3 / b ; 
  a := a + b ; 
  b := 6 * 6 ; 
  a := a + b ; 
  writeln ( '3. Wyrazenie: 7*7-3/(x*y-1)+6*6' ) ; 
  writeln ; 
  writeln ( 'Obliczenia "na raty": ' , a :1 :4 ) ; 
  write ( 'Obliczenie "(7*7-3/(' , x , '*' , y , '-1)+6*6): ' ) ; 
  writeln ( 7*7-3/(x*y-1)+6*6 :1 :3 ) ; 
  writeln ; 
end.
