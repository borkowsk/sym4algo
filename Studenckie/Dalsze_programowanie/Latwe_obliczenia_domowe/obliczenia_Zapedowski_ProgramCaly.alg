Program Obliczanie;
const nazwa='Program "Obliczanie", autor: Przemyslaw Zapedowski';
       x=2;
       y=6;
var a,b,c:real;
Begin

{Obliczenie pierwszego dzialania na raty}

a:=x+2;
a:=a*3;
b:=2*x;
b:=y-b;
b:=1/b;
a:=a+b;
writeln(nazwa);
writeln(''); 
writeln(''); 
writeln('Obliczenia pierwszego dzialania (x+2)*3+1/(y-2*x) "na raty"');
writeln('');
writeln((x+2)*3+1/(y-2*x)); 
writeln('');

{Obliczenie pierwszego dzialania normalnie}
 
writeln('Obliczenie pierwszego dzialania (x+2)*3+1/(y-2*x) "normalnie"');
writeln('');
writeln((x+2)*3+1/(y-2*x));
writeln('');
writeln('');

{Obliczenie drugiego dzialania na raty}

a:=1+x;
a:=a*10;
b:=y*3;
a:=a/b;  
writeln('Obliczenia drugiego dzialania ((1+x)*10)/(y*3) "na raty"');
writeln('');
writeln(((1+x)*10)/(y*3));
writeln(''); 

{Obliczenie drugiego dzialania normalnie}
 
writeln('Obliczenie dzialania drugiego ((1+x)*10)/(y*3) "normalnie"');
writeln('');
writeln(((1+x)*10)/(y*3)); 
writeln('');
writeln('');

{Obliczenie trzeciego dzialania na raty}

a:=7*7;
b:=x*y;
b:=b-1;
b:=3/b;
c:=6*6;
a:=a-b+c;  
writeln('Obliczenia trzeciego dzialania 7*7-3/(x*y-1)+6*6 "na raty"');
writeln('');
writeln(7*7-3/(x*y-1)+6*6);
writeln(''); 

{Obliczenie trzeciego dzialania normalnie}
 
writeln('Obliczenie dzialania trzeciego 7*7-3/(x*y-1)+6*6 "normalnie"');
writeln('');
writeln(7*7-3/(x*y-1)+6*6); 
writeln('');
writeln('');
writeln ('KONIEC')

End.