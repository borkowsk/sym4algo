Program Parametry_tablicowe; 
{Demonstracja przekazywania tablic
przez wartoœæ i przez referencje} 

const 
   Last=21; 
type 
   TypTablicowy=array[1..Last] of integer; 

procedure Wypisz(Tab:TypTablicowy;N:integer); 

var 
   i:integer; 
begin 
  for i:=1 to N do 
    write(Tab[i],' '); 
  writeln; 
end; 

procedure Jedynkuj(var Tab:TypTablicowy;N:integer); 
var 
   i:integer; 
begin 
  for i:=1 to N do 
    Tab[i]:=1; 
end; 

procedure Zeruj(var Tab:TypTablicowy;N:integer); 
var 
   i:integer; 
begin 
  for i:=1 to N do 
    Tab[i]:=0; 
end; 

procedure Losuj(p0:real;var Tab:TypTablicowy;N:integer); 
var 
   i:integer; 
begin 
  for i:=1 to N do 
  if random < p0 then
    Tab[i]:=0
    else
    Tab[i]:=1;
end; 

var Œwiat:TypTablicowy;
begin 
Zeruj(Œwiat,Last);
Wypisz(Œwiat,Last);
Jedynkuj(Œwiat,10);
Wypisz(Œwiat,Last);
Losuj(0.5,Œwiat,Last);
Wypisz(Œwiat,Last);
end.
