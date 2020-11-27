Program szumgenerator; 
{Losuje punkty i koloruje w zaleznoœci od tego czy trafi³ w prostok¹t czy nie}
var 
   a: integer; 
   b: integer; 
   c: integer; 

procedure rysujniebieskie; 
begin 
  pen(1,0,0,255); 
  point(a,b); 
end; 

procedure rysujczerwone; 
begin 
  pen(1,255,0,0); 
  point(a,b); 
end; 

begin 
  for c:=0 to 250000 do 
    begin 
      a:=random(500); 
      b:=random(500); 
      if (a < 300) and (a>150) and (b< 300) and (b>100) then 
        rysujniebieskie 
      else 
        rysujczerwone; 
    end; 
end.
