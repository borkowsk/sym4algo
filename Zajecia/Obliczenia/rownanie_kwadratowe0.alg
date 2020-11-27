Program rown_kwadratowe;

var a, b, c, x, x1, x2, delta, pierwiastek_delta : real;

begin
clear;
writeln('Ronanie kwadratowe y=ax2+bx+c');
writeln;
write('Podaj wartosc a= '); readln(a);
write('Podaj wartosc b= '); readln(b);
write('Podaj wartosc c= '); readln(c);

delta:= b*b - 4*a*c;


if delta>0 then
begin
 pierwiastek_delta:= sqrt(delta);
 x1:= (-b - pierwiastek_delta) / (2*a);
 x2:= (-b + pierwiastek_delta) / (2*a);
 write('Pierwiastki rownania to: ',x1,' i ',x2); 
end
else
if delta=0 then
 begin
  x:= -b / (2*a);
  write('Pierwiastkiem rownania jest: ',x);
 end
else
 write('Brak pierwiastkow rzeczywistych.');
 
 
end.