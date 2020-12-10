Program Œrednia_tablicy;
const Last=5;{Musi byc wiêksze ni¿ 1}
var   Data:array[1..Last] of real;
      Summ:real;
      z:integer;
begin
{¯eby nie komplikowaæ dane s¹ w kodzie }
Data[1]:=1;Data[2]:=2;Data[3]:=3;
Data[4]:=4;Data[5]:=5;{...itd...}

{W³aœciwe obliczanie}
Summ:=0;
for z:=1 to Last do
   Summ:=Summ+Data[z];

{Wyprowadzanie wyników}
writeln('Suma wynosi:     ',Summ);      
writeln('Œrednia wynosi:  ',Summ/Last);      

end.
