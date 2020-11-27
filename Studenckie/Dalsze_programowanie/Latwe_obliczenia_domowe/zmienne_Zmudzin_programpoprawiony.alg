Program Zmienne;
const nazwa='program';
x=2;
y=2;
var a,b,c,d,e,f,g,h:real;
begin
{pierwsze równanie}
a:=x+2;
a:=a*3;
b:=2*x;
b:=y-b;
b:=1/b;
a:=a+b;

{drugie równanie}
c:=1+x;
c:=c*10;
d:=y*3;
c:=c/d;

{trzecie równanie}
e:=7*7;
f:=x*y;
f:=f-1;
f:=3/f;
g:=6*6;
e:=e-f+g;

{wyniki "na raty"}
writeln(a);
writeln(c);
writeln(e);

writeln(' wynik (x+2)*3+1/(y-2*x)');
writeln((x+2)*3+1/(y-2*x));

writeln(' wynik ((1+x)*10)/(y*3)');
writeln(((1+x)*10)/(y*3));

writeln (' wynik 7*7-3/(x*y-1)+6*6');
writeln (7*7-3/(x*y-1)+6*6);
end.