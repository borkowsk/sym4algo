Program DELTAAAAA;
var d,a,b,c:real;
    
Begin 
readln(a);
readln(b);
readln(c);
d:= (b*b) - (4*(a*c));
if d<0 then
write ('Brak rozwi¹zañ')
else if d=0 then
write (-b/(2*a))
else
Begin
write('x1: ');
writeln((-b-sqrt(d))/(2*a));
write ('x2: ');
write ((-b+sqrt(d))/(2*a));
end
end.