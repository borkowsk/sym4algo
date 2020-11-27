program ciag; 

const 
   r=2; 
var 
   x:integer; 
   suma:integer; 

begin 
  x:=1; 
  suma:=0; 
  while x<20 do 
    begin 
      x:=x+r; 
      write(x,';':2); 
      suma:=x+suma; 
    end; 
  writeln; 
  write('SUMA: '); 
  write(suma:2); 
end.