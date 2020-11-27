program zad1;

var d,a,b,c,x1,x2,x: real;

begin
 writeln('Program rozwiazujacy rownanie kwadratowe y=ax^2+bx+c:');
 writeln('');
 write('podaj a: ');
 readln(a);
 write('podaj b: ');
 readln(b);
 write('podaj c: ');
 readln(c);
 writeln('');
 writeln('');
 writeln('Rozwiazanie:');
 writeln('');
 d:=b*b-4*a*c;
 writeln('  delta=',d:4:4);
 writeln('');
  If d<0 then 

   writeln('  Brak rozwiazania')
    else If d=0 then

     writeln('  x=',-b/2*a:4:4)
        else
         begin

         writeln('  x1=',(-b-sqrt(d))/2*a:4:4);
         writeln('  x2=',(-b+sqrt(d))/2*a:4:4);

        end
end.