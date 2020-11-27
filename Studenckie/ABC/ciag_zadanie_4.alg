Program ciag;
Var
x,i:integer;
const
k=20;
Begin
i:=1;
x:=0;
repeat
i:=i+2;
x:=x+i;
Writeln(i);
until i>k;
writeln('Suma: ',x);
end.