Program �rednia_tablicy2; 

const 
   Last=50; 
   {Musi byc wi�ksze ni� 1} 
var 
   Data:array[1..Last] of real; 
   Warto��,Summ:real; 
   z,Liczba:integer; 

begin 
  writeln('Ile b�dzie liczb? (1..',Last,')'); 
  readln(Liczba); 
  writeln('Podawaj warto�ci '); 
  for z:=1 to Liczba do 
    begin 
      readln(Warto��); 
      Data[z]:=Warto��; 
    end; 
  {W�a�ciwe obliczanie} 
  Summ:=0; 
  for z:=1 to Liczba do 
    Summ:=Summ+Data[z]; 
  {Wyprowadzanie wynik�w} 
  writeln('Suma wynosi:     ',Summ :10:2); 
  writeln('�rednia wynosi:  ',Summ/Liczba :10:4); 
end.
