Program zad5 ; 


Function fikolek (x :integer) :integer; 

var 
   s :integer; 
Begin 
  s:=0; 
  while x>0 do 
    begin 
      s:=s*10 + x mod 10; 
      x:=x div 10; 
    end; 
  write (s :4); 
end; 

const 
   n=10; 
type 
   liczby=array[1..n] of integer; 
var 
   A :liczby; 
   i :integer; 

Begin 
  randomize; 
  for i:=1 to n do 
    A[i]:=random(900)+100; 
  for i:=1 to n do 
    write (A[i]:4); 
  writeln; 
  for i:=1 to n do 
    A[i]:=fikolek(A[i]); 
end.
