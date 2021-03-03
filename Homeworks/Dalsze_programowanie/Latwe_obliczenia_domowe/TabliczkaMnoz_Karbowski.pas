Program prog3_tabliczka_mno¿enia; 
{Mariusz_Karbowski}
const 
   n = 10; 

procedure tabliczkaMnozenia(znak: char); 

var 
   a, b : array[1..n] of integer; 
   i, j: integer; 
begin 
  for i := 1 to n do 
    begin 
      a[i] := i; 
      b[i] := i; 
    end; 
  for i := 1 to n do 
    begin 
      for j := 1 to n do 
        begin 
          write((a[i] * b[j]):3); 
          write(znak, ' '); 
        end; 
      writeln; 
    end; 
end; 

begin 
  tabliczkaMnozenia(';'); 
end.
