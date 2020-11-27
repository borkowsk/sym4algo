Program Zmienne;
const nazwa='Program zmienne Sylwii Wiœniewskiej';
      x=2;
      y=3;
var a,b:real;
Begin
a:=x+2;
a:=a*3;
b:=2*x;
b:=y-b;
b:=1/b;
a:=a+b;

writeln('Obliczenia "na raty"');
writeln(a);

writeln('Obliczenie "(x+2)*3+1/(y-2*x)"');
writeln((x+2)*3+1/(y-2*x));

(* 
end.

Program Zmienne;
const nazwa='Program znmienne Sylwii Wisniewskiej';
      x=6;
      y=3;
var a,b:real;
Begin
*)

a:=1+x;
a:=a*10;
b:=y*3;
a:=a/b;

writeln('Obliczenie "na raty"');
writeln(a);

writeln('Obliczenie "((1+x)*10)/(y*3))"');
writeln((1+x)*10/(y*3));

(*
end. 

Program Zmienne;
const nazwa='Program znmienne Sylwii Wisniewskiej';
      x=6;
      y=3;
var a,b:real;
Begin
*)

a:=7*7;
b:=x*y;
b:=b-1;
b:=3/b;
a:=a-b;
b:=6*6;
a:=a+b;

writeln('Obliczenie "na raty"');
writeln(a);

writeln('Obliczenie "7*7-3/(x*y-1)+6*6"');
writeln(7*7-3/(x*y-1)+6*6);
end. 
