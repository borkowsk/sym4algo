
Program rownanie;
var a,b,c,delta,x,y,X0,X1,X2:real;
begin;
writeln ('równanie y=ax2+bx+c');
writeln('po podaniu kazdej liczby wcisnij enter');
writeln('podaj a');
readln(a);
writeln('podaj b');
readln(b);
writeln('podaj c');
readln(c);

writeln('delta');
delta:=b*b-4*a*c;
writeln(delta);


If (delta<0) then
begin
writeln('nie ma pierwiastków');
end;

If delta>0 then 
begin
writeln('sa dwa pierwiastki');
writeln('X1=');
X1:=-b-sqrt(delta)/2*a;
writeln(X1);
writeln('X2=');
X2:=-b+sqrt(delta)/2*a;
writeln(X2);
end;
If delta=0 then
begin
writeln('jest jeden pierwiastek podwójny');
writeln('X0 równe');
X0:=-b/2*a;
writeln(X0);
end
end.
