Program szumgenerator; 

var 
   a: integer; 
   b: integer; 
   c: integer; 

procedure losujpunkt; 

begin 
  a:=random(500); 
  b:=random(400); 
  point(a,b); 
end; 

begin 
  for c:=0 to 320000 do 
    losujpunkt; 
end.
