Program Zmienne;

const nazwa='Program"Zmienne" licz¹cy za studenta';
      x=6;
      y=10;
      
var a,b,c,d,e,f,g:real;

Begin

a:=x+2;
a:=a*3;
b:=2*x;
b:=y-b;
b:=1/b;
a:=a+b;
writeln('Obliczenia "na raty" równanie nr1');
writeln(a);
writeln('Obliczenie "(x+2)*3+1/(y-2*x)"');
writeln((x+2)*3+1/(y-2*x));
writeln('');
writeln('');

c:=1+x;
c:=c*10;
d:=y*3;
c:=c/d;
writeln('Obliczenia "na raty" równanie nr2');
writeln(c);
writeln('Obliczenie "((1+x)*10/(y*3)"');
writeln((1+x)*10/(y*3));
writeln('');
writeln('');

e:=7*7;
f:=x*y;
f:=f-1;
f:=3/f;
e:=e-f;
g:=6*6;
e:=e+g;
writeln('Obliczenia "na raty" równanie nr3');
writeln(e);
writeln('Obliczenie "7*7-3/(x*y-1)+6*6"');
writeln(7*7-3/(x*y-1)+6*6);
writeln('');
writeln('');

End.
