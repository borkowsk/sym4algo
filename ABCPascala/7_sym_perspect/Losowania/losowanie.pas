program Losowanie; 
{Najprostrzy przyk³ad u¿ycia generatora liczb pseudolosowych}
const 
   ile_razy=10; 
var 
   i:integer; 

begin 
  writeln('Losowanie z zakresu <0..1)'); 
  for i:=1 to ile_razy do 
    writeln(Random:15:13); 
    
  writeln('Losowanie z zakresu <0..100)'); 
  for i:=1 to ile_razy do 
    writeln(Random(100));   
end.
