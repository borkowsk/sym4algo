program obliczeniaMAksymTyszko;
var x,y,z:real;

begin; 
writeln('obliczanie (x+2)*3+1/(y-2*x) ');

x:=1;
y:=-1;

x:=x+2;
x:=x*3;
x:=x+1;
z:=2*x;
y:=y-z;
y:=x/y;

writeln('obliczenia "na raty"');
writeln(y);

writeln('obliczenia "1*3+7+2/4"');
writeln((x+2)*3+1/(y-2*x));
end.

program obliczenia;
var x,y,z:real;

begin;

writeln('obliczanie(1+x)*10)/(y*3)');
x:=1;
y:=-1;

x:=1+x;
x:=10*x;
y:=y*3;
x:=x/y;
writeln('obliczenia "na raty"');
writeln(x);

writeln('obliczenia "((1+x)*10)/(y*3)"');
writeln(((1+x)*10)/(y*3));


end.


program obliczenia;
var x,y,z:real;

begin; 
writeln('obliczanie 7*7-3/(x*y-1)+6*6 ');

x:=1;
y:=-1;

x:=7*7;
x:=x-3;
y:=x*y;
y:=y-1;
z:=6*6;
y:=y+z;
x:=x/y;

writeln('obliczenia "na raty"');
writeln(x);
writeln(7*7-3/(x*y-1)+6*6);

end.