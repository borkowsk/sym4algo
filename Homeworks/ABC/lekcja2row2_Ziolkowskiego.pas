Program obliczenia;

const nazwa='Program "obliczenia" Mariusza Ziolkowskiego';

p=3;
const x=5;
const y=3;
var a,b: real;
Begin 

 a:=1+x;
 a:=a*10;
 b:=y*3;
 a:=a/b;

 writeln('obliczenie ((1+x)*10)/(y*3) "na raty"');
 writeln(a);
 
 writeln('obliczenie "((1+x)*10/(y*3)');
 writeln(((1+x)*10)/(y*3));


End.