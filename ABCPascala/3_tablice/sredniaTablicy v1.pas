Program �rednia_tablicy;
const Last=5;{Musi byc wi�ksze ni� 1}
var   Data:array[1..Last] of real;
      Summ:real;
      z:integer;
begin
{�eby nie komplikowa� dane s� w kodzie }
Data[1]:=1;Data[2]:=2;Data[3]:=3;
Data[4]:=4;Data[5]:=5;{...itd...}

{W�a�ciwe obliczanie}
Summ:=0;
for z:=1 to Last do
   Summ:=Summ+Data[z];

{Wyprowadzanie wynik�w}
writeln('Suma wynosi:     ',Summ);      
writeln('�rednia wynosi:  ',Summ/Last);      

end.
