program tabliczka; 

const 
   x=10; {kolumny} 
   y=10; {wiersze}
var 
   a,b:integer; 

begin 
  write('*':3); 
  for a:=1 to x do 
    write (a:4); 
  writeln; 
  for b:=1 to y do 
    begin 
      write(b:3); 
      for a:=1 to x do 
        write(b*a:4); 
      writeln; 
    end; 
end.