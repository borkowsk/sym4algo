program LosowanieZPrawdopodobie�stwem; 
{U�ycie generatora liczb pseudolosowych
do losowania 0 i 1 z okre�lonym prawdopodobie�stwem}
const 
   ile_razy=50; 
   prawdopodobie�stwo=0.5;
var 
   i:integer; 

begin 
  writeln('Losowanie 0 i 1 z P(1)=', prawdopodobie�stwo:10:8); 
  for i:=1 to ile_razy do 
    if random < prawdopodobie�stwo then
    write(1)
    else
    write(0);
end.
