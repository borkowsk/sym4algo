Program Zmienne;


const nazwa='Program "Zmienne" Janka Kowalskiego';
       x=3;
       y=4;
var a,b:real;
Begin
a:=7*7;
a:=a-3;
b:=x*y;
b:=b-1;
a:=a/b;
a:=a+6*6;

writeln('Obliczenia "na raty"');
writeln(a);

writeln('Obliczenie "7*7-3/(x*y-1)+6*6"');
Writeln (7*7-3/(x*y-1)+6*6); 
End.