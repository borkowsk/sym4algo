Program Parametry_tablicowe; 
{Demonstracja przekazywania tablic
przez warto�� i przez referencje} 

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

var �wiat:TypTablicowy;
begin 
Zeruj(�wiat,Last);
Wypisz(�wiat,Last);
Jedynkuj(�wiat,10);
Wypisz(�wiat,Last);
end.
