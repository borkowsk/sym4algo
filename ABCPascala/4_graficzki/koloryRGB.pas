Program KoloryRGB; 
{Proste zastosowanie kodowania kolorów
 - w takiej postaci dzia³a TYLKO w ALGO} 
const 
   maxintensity=255; 
var 
   r,g,b:integer; 
Begin 
  for r:=0 to maxintensity do 
    for g:=0 to maxintensity do 
      begin 
        pen(1,r,g,0); 
        point(r,g); 
      end; 
  for r:=0 to maxintensity do 
    for b:=0 to maxintensity do 
      begin 
        pen(1,r,0,b); 
        point(r,256+b); 
      end; 
  for g:=0 to maxintensity do 
    for b:=0 to maxintensity do 
      begin 
        pen(1,0,g,b); 
        point(g,512+b); 
      end; 
end.
