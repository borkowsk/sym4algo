program LosowanieZPrawdopodobieñstwem; 
{U¿ycie generatora liczb pseudolosowych
do losowania 0 i 1 z okreœlonym prawdopodobieñstwem}
const 
   ile_razy=50; 
   prawdopodobieñstwo=0.5;
var 
   i:integer; 

begin 
  writeln('Losowanie 0 i 1 z P(1)=', prawdopodobieñstwo:10:8); 
  for i:=1 to ile_razy do 
    if random < prawdopodobieñstwo then
    write(1)
    else
    write(0);
end.
