program zmienne;

const x=5; y=3;

var
  a , b : real;

begin
  writeln( 'Program written by: Joanna Obszynska' );
  writeln;
 { First equation}

  a := x + 2;
  a := a * 3;
  b := y - 2*x;
  b := 1 / b;
  a := a + b;

  writeln( 'Wyrazenie: (x+2)*3+1/(y-2*x)' );
  writeln( '----------------------------' );
  writeln( 'Obliczenia "na raty": ' , a :1 :3);
  write  ( 'Obliczenie "(' , x , '+2)*3+1/(' , y , '-2*' , x , '): ' );
  writeln( (x+2)*3+1/(y-2*x) :1 :3 );
  writeln;

{ Second equation}

  a := 1 + x;
  a := a * 10;
  b := y * 3;
  a := a / b;

  writeln( 'Wyrazenie: ((1+x)*10)/(y*3)' );
  writeln( '----------------------------' );
  writeln( 'Obliczenia "na raty": ' , a :1 :3);
  write  ( 'Obliczenie "((1+' , x , ')*10)/(' , y , '*3): ' );
  writeln( ((1+x)*10)/(y*3) :1 :3 );
  writeln;

{Third equation}

  a := 7 * 7;
  b := x * y - 1;
  b := -3 / b;
  a := a + b;
  b := 6 * 6;
  a := a + b;

  writeln( 'Wyrazenie: 7*7-3/(x*y-1)+6*6' );
  writeln( '----------------------------' );
  writeln( 'Obliczenia "na raty": ' , a :1 :3 );
  write  ( 'Obliczenie "(7*7-3/(' , x , '*' , y , '-1)+6*6): ' );
  writeln( 7*7-3/(x*y-1)+6*6 :1 :3 );
  writeln;

end.


