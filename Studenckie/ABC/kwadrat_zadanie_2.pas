Program kwadrat;
Var
x,y:string;
i:integer;
a:integer;

Begin
writeln('Podaj bok kwadratu:');
readln(a);

x:=' *';
y:=' *';
i:=1;
repeat 
i:=i+1;
x:=x+y;

until i=a;
writeln(x);
i:=1;
repeat
i:=i+1;
Writeln(x);
until i=a;
end.
