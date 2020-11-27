program pierwiastki;

var delta, x0,x1,x2,a,b,c : real;
begin
   writeln('Rownanie kwadratowe: y=a*x^2+b*x+c');
   write('Podaj wartosc a = ');
   readln(a);
   write('Podaj wartosc b = ');
   readln(b);
   write('Podaj wartosc c = ');
   readln(c);

   delta := (b*b) - (4*a*c);
   
   write('Dla delty = ', delta,' ');
   
   if delta < 0 then
      writeln('równanie nie ma pierwiastków.')
   else if delta = 0 then
      begin
         x0 := ((- b) - sqrt(delta)) / (2 * a);
         writeln('równanie ma jeden pierwiastek x0 = ',x0);
      end
   else
     begin
        x1 := ((- b) - sqrt(delta)) / (2 * a);
        x2 := ((- b) + sqrt(delta)) / (2 * a);
        writeln('równanie ma dwa pierwiastki x1 = ',x1,' i x2 = ',x2);
     end;
end.