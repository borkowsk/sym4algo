Program Podprogramy; 
{Przyk�ady podprogram�w}
var 
   a,b:real; 

Procedure Szacher; 
{Procedura dzia�aj�ca na zmienn� globaln�}
Begin 
a:=a+1;
end; 

Function Macher:real;
{Funkcja pobieraj�ca dane ze zmiennej globalnej}
Begin
Macher:=a+9;
end;

Function XPlus9(x:real):real;
{Funkcja }
Begin
XPlus9:=x+9;
end;

Begin 
a:=10;
writeln('A przed procedur� = ',a:10:6);
Szacher;
writeln('A po procedurze = ',a:10:6);
b:=Macher;
writeln('Po funkcji A=',a,' B=',b:10:6);
b:=XPlus9(a);
writeln('Po funkcji z parametrem B=',b:10:6);
end.
