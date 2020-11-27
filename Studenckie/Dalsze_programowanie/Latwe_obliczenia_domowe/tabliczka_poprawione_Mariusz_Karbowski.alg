Program prog3_tabliczka_mno¿enia; 

const 
   n = 10; 
var 
   j: integer; 

procedure tabliczkaMnozenia(znak: char; j:integer); 

var 
   i: integer; 
begin 
  for i := 1 to n do 
    begin 
      write(i*j:3); 
      write(znak, ' '); 
    end; 
  writeln; 
end; 

begin 
  Clear; 
  for j := 1 to n do 
    begin 
      tabliczkaMnozenia(';', j); 
    end; 
end.