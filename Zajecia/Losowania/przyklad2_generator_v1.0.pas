Program szumgenerator; 
{Pokrywa kwadrat wylosowanymi punktami}
var 
   a: integer; 
   b: integer; 
   c: integer; 

procedure losujpunkt; 
{Losuje punkt i go rysuje}
begin 
  a:=random(500); 
  b:=random(500); 
  point(a,b); 
end; 

begin 
  for c:=0 to 250000 do 
    losujpunkt; 
end.
