program Zmienne;

const
  tytul='Program "Zmienne" Micha³a J.' ;
  uwaga='UWAGA: x,y nie mog¹ byæ sobie równe bo wyst¹pi wtedy "dzielenie przez 0!"';
  x=3;
  y=2;
  
var a,b,c,d,e,f:real;

begin
  writeln(tytul);
  writeln('');
  writeln(uwaga);
  writeln('');
  writeln('Obliczenie "(x+2)*3 + 1/(x-2*x)"');
  writeln('-------------------------------');
  a:=x+2;
  a:=a*3;
  b:=1/(y-2*x);
  a:=a+b;
  
  writeln('NA RATY');
  writeln(a);
  
  writeln('ZA JEDNYM ZAMACHEM');
  Writeln((x+2)*3+1/(y-2*x));
  
  writeln('');
  writeln('Obliczenie "((1+x)*10)/(y*3)"');
  writeln('-----------------------------');
  c:=1+x;
  c:=c*10;
  d:=y*3;
  c:=c/d;
  
  writeln('NA RATY');
  writeln(c);
  
  writeln('ZA JEDNYM ZAMACHEM');
  Writeln(((1+x)*10)/(y*3));
  writeln('');
  
  writeln('Obliczenie "7*7-3/(x*y-1)+6*6"');
  writeln('-----------------------------');
  e:= 7*7+6*6;
  f:= 3/(x*y-1);
  e:= e-f;
  
  writeln('NA RATY');
  writeln(e);
  
  writeln('ZA JEDNYM ZAMACHEM');
  Writeln(7*7-3/(x*y-1)+6*6);
end.
