program progs1;

const x=6; y=10;

var a,b:real;
begin
a:=x+2;
a:=a*3;
b:=y-2*x;
b:=1/y;
writeln(a+b);
writeln((x+2)*3+1/(y-2*x));

a:=1+x;
a:=a*10;
b:=y*3;
writeln(a/b);
writeln(((1+x)*10)/(y*3));

a:=7*7;
b:=x*y-1;
b:=3/b;
a:=a-b;
b:=6*6;
writeln(a+b);
writeln(7*7-3/(x*y-1)+6*6);
end.
