Program obliczenia;

const nazwa='Program "obliczenia" Mariusza Ziolkowskiego';

p=3;
const x=5;
const y=3;
var a,b,c,d,e: real;
Begin 

 a:=x+2;
 a:=a*3;
 b:=2*x;
 b:=y-b;
 b:=1/b;
 a:=a+b;

 writeln('obliczenie (x+2)*3+1/(y-2*x) "na raty"');
 writeln(a);
 
 writeln('obliczenie "(x+2)*3+1/(y-2*x)');
 writeln((x+2)*3+1/(y-2*x));


End.