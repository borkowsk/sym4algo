Program Zmienne;
const nazwa='blebleble';
x=20;
y=10;
var a,b,c,d,e,f,g,h:real;
begin
a:=x+2;
a:=a*3;
a:=a+1;
b:=2*x;
c:=y-b;
a:=a/c;




d:=1+x;
d:=d*10;
e:=y*3;
d:=3/e;






f:=7*7;
f:=f-3;
g:=x*y;
g:=g-1;
h:=6*6;
f:=f/g;
f:=f+h;


writeln(a);
writeln(d);
writeln(f);
writeln((x+2)*3+1/(y-2*x));
writeln(((1+x)*10)/(y*3));
writeln (7*7-3/(x*y-1)+6*6);
end.
