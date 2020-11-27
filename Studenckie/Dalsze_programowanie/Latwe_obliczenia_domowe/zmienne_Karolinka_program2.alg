Program Zmienne;

const
nazwa='Program "Zmienne" Karolinka ¯ó³kowska';
x=2;
y=2;
var a,b:real;

begin 
writeln(nazwa);
writeln('');
               {ZA JEDNYM ZAMACHEM}
               
writeln('       Obliczenia sposobem - "za jednym zamachem":');

{liczymy pierwsze wyrazenie}
writeln('');
writeln('1) wyrazenie (x+2)*3+1/(y-2*x)');
write('dla x=');write(x);
write(' ; dla y=');writeln(y);
write('wynik: ');
writeln((x+2)*3+1/(y-2*x):8:4);
{koniec liczenia pierwszego wyrazenia}
writeln('');

{liczymy drugie wyrazenie}
writeln('2)  wyrazenie ((1+x)*10)/(y*3)');
write('dla x='); write(x);
write(' ; dla y=');writeln(y);
write('wynik: ');
writeln(((1+x)*10)/(y*3):8:4);
{koniec liczenia drugiego wyrazenia}
writeln('');

{liczymy trzecie wyrazenie}
writeln('3)  wyrazenie  7*7-3/(x*y-1)+6*6');
write('dla x=');write(x);
write(' ; dla y=');writeln(y);
write('wynik: ');
writeln(7*7-3/(x*y-1)+6*6:8:4);
writeln('');
writeln('');
{koniec liczenia trzeciego wyrazenia}

                  {NA RATY}

writeln('       Obliczenia sposobem - "na raty":');

{liczymy pierwsze wyrazenie}
writeln('');
writeln('1) wyrazenie (x+2)*3+1/(y-2*x)');
write('dla x=');write(x);
write(' ; dla y=');writeln(y);
write('wynik: ');
a:=x+2;
b:=y-2*x;
a:=a*3;
b:=1/b;
a:=a+b;
writeln(a:8:4);
{koniec liczenia pierwszego wyrazenia}
writeln('');

{liczymy drugie wyrazenie}
writeln('2)  wyrazenie ((1+x)*10)/(y*3)');
write('dla x='); write(x);
write(' ; dla y=');writeln(y);
write('wynik: ');
a:=1+x;
b:=y*3;
a:=a*10;
a:=a/b;
writeln(a:8:4);
{koniec liczenia drugiego wyrazenia}
writeln('');

{liczymy trzecie wyrazenie}
writeln('3)  wyrazenie  7*7-3/(x*y-1)+6*6');
write('dla x=');write(x);
write(' ; dla y=');writeln(y);
write('wynik: ');
a:=x*y-1;
a:=3/a;
b:=7*7;
a:=b-a;
a:=a+6*6;
writeln(a:8:4);
{koniec liczenia trzeciego wyrazenia}

end.