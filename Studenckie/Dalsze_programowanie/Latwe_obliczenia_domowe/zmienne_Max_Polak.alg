Program Zmienne;
const x=3;
      y=4;
var a,b:real;
Begin

writeln('');
writeln('Dzia³anie (x+2)*3+1/(y-2*x)');
writeln('');
a:=x+2;
a:=a*3;
b:=2*x;
b:=y-b;
b:=1/b;
a:=a+b;
writeln('Obliczenia "na raty":');
writeln(a);
writeln('Obliczenie "(x+2)*3+1/(y-2*x)"');
writeln((x+2)*3+1/(y-2*x));

writeln('');
writeln('Dzia³anie (1+x)*10)/(y*3)');
writeln('');
a:=x+1;
a:=a*10;
b:=3*y;
a:=a/b;
writeln('Obliczenia "na raty":');
writeln(a);
writeln('Obliczenie "((1+x)*10)/(y*3)"');
writeln(((1+x)*10)/(y*3));

writeln('');
writeln('Dzia³anie 7*7-3/(x*y-1)+6*6');
writeln('');
a:=7*7;
a:=a+6*6;
b:=x*y;
b:=b-1;
b:=3/b;
a:=a-b;
writeln('Obliczenia "na raty":');
writeln(a);
writeln('Obliczenie "7*7-3/(x*y-1)+6*6"');
writeln(7*7-3/(x*y-1)+6*6);

End.