Program obliczenia;

const nazwa='Program "obliczenia" Mariusza Ziolkowskiego';

p=3;
const x=5;
const y=3;
var a,b,c: real;
Begin 

 a:=7*7;
 a:=a-3;
 b:=x*y;
 b:=b-1;
 c:=6*6;
 a:=a/b;
 a:=a+c;
 
 writeln('obliczenie 7*7-3/(x*y-1)+6*6  "na raty"');
 writeln(a);
 
 writeln('obliczenie "7*7-3/(x*y-1)+6*6"');
 writeln(7*7-3/(x*y-1)+6*6);


End.