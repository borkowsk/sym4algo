Program Delta; 
const nazwa='Program "Delta", autor: Przemyslaw Zapedowski';
var    a,b,c,Delta:integer; 
       x0,x1,x2:real;
Begin
Writeln(nazwa);
Writeln;
Writeln('Podaj a');
Readln(a);
Writeln('Podaj b');
Readln(b);
Writeln('Podaj c');
Readln(c);
Writeln;  
Writeln('Delta funkcji kwadratowej wynosi:');
Delta:=sqr(b)-(4*a*c);
Writeln(Delta);
Writeln;
{Sprawdzam wartosc Delty, zeby ustalic ilosc oraz wartosc miejsc zerowych funkcji kwadratowej}
if Delta<0 then
Begin
Writeln('Delta jest mniejsza od zera, czyli funkcja kwadratowa nie ma miejsc zerowych'); 
end;
if Delta=0 then
Begin
Writeln('Delta równa sie zero, czyli funkcja ma jedno miejsce zerowe.');
x0:=-b/(2*a);
Writeln;
Writeln('Miejsce zerowe funkcji kwadratowej wynosi:',x0:8:4);
Writeln;
end;
if Delta>0 then
Begin
Writeln('Delta jest wieksza od zera, czyli funkcja ma dwa miejsca zerowe:');
x1:=((-b-sqrt(Delta))/(2*a));
x2:=((-b+sqrt(Delta))/(2*a));
Writeln;
Writeln('Wartosc x1 wynosi:',x1:8:4);
Writeln;
Writeln('Wartosc x2 wynosi:',x2:8:4);
Writeln;
end;
Writeln;
Writeln('Koniec.');
end.