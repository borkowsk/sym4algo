Program Zmienne; 

const nazwa= 'Program "Zmienne" Oli Góralczyk' ; 
      x=5;
      y=2;

var a,b: real ;

Begin
writeln(nazwa);
writeln('');

{(x+2)*3+1/(y-2*x)}
a:=x+2;
a:=a*3;
b:=2*x;
b:=y-b; 
b:=1/b;
a:=a+b;

writeln ( 'Obliczenia : (x+2)*3+1/(y-2*x)' );
writeln ('"Na raty" : ',a); 
writeln ('"Na raz   : ',(x+2)*3+1/(y-2*x) );
writeln;

{((1+x)*10)/(y*3)}
a:=x+1;
a:=a*10;
b:=y*3;
a:=a/b;

writeln ( 'Obliczenia : ((1+x)*10)/(y*3)' );
writeln ('"Na raty" : ',a); 
writeln ('"Na raz   : ',((1+x)*10)/(y*3) );
writeln;

{7*7-3/(x*y-1)+6*6}
a:=7*7;
b:=x*y;
b:=b-1;
b:=3/b; 
a:=a-b;
b:=6*6;
a:=a+b;

writeln ( 'Obliczenia : 7*7-3/(x*y-1)+6*6' );
writeln ('"Na raty" : ',a); 
writeln ('"Na raz   : ',7*7-3/(x*y-1)+6*6 );
writeln;
 
   
End .
