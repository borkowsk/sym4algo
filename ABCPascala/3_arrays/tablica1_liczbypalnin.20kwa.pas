Program tablica_palindromy; 


function palindrom (x:integer) :boolean; 

var 
   s,y :integer; 
Begin 
  s:=0 ; 
  {s to nowa liczba x} 
  y:=x;
  {przechowanie wartoœci x przed zmianami} 
  while x>0 do 
    begin 
      s:=s*10+x mod 10; 
      x:=x div 10; 
    end; 
  if y=s then 
    palindrom:=true 
  else 
    palindrom:=false 
end; 
{..............................................} 

const 
   n=10;
   {tanlica 10 elementów} 
type 
   liczby=array[1..n]of integer; 
var 
   A:liczby; 
   i:integer; 

begin 
  randomize; 
  {losowanie} 
  for i:=1 to n do 
    A[i]:=random(1000);
    
  {tylko liczby do 1000} 
  for i:=1 to n do 
    write (A[i]:4); 
    
  {wypisz liczby,zostaw 4 miejsca dla ka¿dej liczby} 
  writeln; 
  for i:=1 to n do 
    if palindrom(A[i]) then 
      writeln ('liczba palindromiczna: ',A[i],' ') 
      
end.
