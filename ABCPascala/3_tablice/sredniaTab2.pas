Program Œrednia_tablicy2; 

const 
   Last=50; 
   {Musi byc wiêksze ni¿ 1} 
var 
   Data:array[1..Last] of real; 
   Wartoœæ,Summ:real; 
   z,Liczba:integer; 

begin 
  writeln('Ile bêdzie liczb? (1..',Last,')'); 
  readln(Liczba); 
  writeln('Podawaj wartoœci '); 
  for z:=1 to Liczba do 
    begin 
      readln(Wartoœæ); 
      Data[z]:=Wartoœæ; 
    end; 
  {W³aœciwe obliczanie} 
  Summ:=0; 
  for z:=1 to Liczba do 
    Summ:=Summ+Data[z]; 
  {Wyprowadzanie wyników} 
  writeln('Suma wynosi:     ',Summ :10:2); 
  writeln('Œrednia wynosi:  ',Summ/Liczba :10:4); 
end.
