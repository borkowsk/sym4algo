
program dzialania_matematyczne;
const nazwa='Dzia³ania matematyczne';
x=4;y=2;
var
a,b,c: real;

begin
 WriteLn(nazwa);
 
a:=x+2;
a:=a*3;
b:=2*x;
b:=y-b;
b:=b/1;
a:=a+b;
 WriteLn('OBLICZENIA "(x+2)*3+1/(y-2*x)"');
 Writeln('"Na skróty" : ');
 WriteLn(a);
 Writeln('"(x+2)*3+1/(y-2*x)" : ');
 WriteLn((x+2)*3+1/(y-2*x));
 WriteLn;

a:=1+x;
a:=a*10;
b:=y*3;
a:=a/b;
 WriteLn('OBLICZENIA "((1+x)*10)/(y*3)"');
 Writeln('"Na skróty" : ');
 WriteLn(a);
 Writeln('"((1+x)*10)/(y*3)" : ');
 WriteLn(((1+x)*10)/(y*3));

 WriteLn;

a:=7*7;
b:=x*y;
b:=b-1;
c:=6*6;
b:=3/b;
b:=b+c;
a:=a-b;

 WriteLn('OBLICZENIA "7*7-3/(x*y-1)+6*6"');
 Writeln('"Na skróty" : ');
 WriteLn(a);
 Writeln('"7*7-3/(x*y-1)+6*6" : ');
 WriteLn(7*7-3/(x*y-1)+6*6);

 WriteLn;


 end.
