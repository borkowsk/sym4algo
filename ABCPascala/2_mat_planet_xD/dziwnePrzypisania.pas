Program Przypisania; 
const 
   x=3; 
var 
   a,b:boolean; 
   s,z:string; 

Begin 
  {"Dziwne" przypisania} 
  begin 
    a:=x<5; 
    b:=x=4; 
    begin 
      s:='Jakiœ tekst'; 
      z:=s; 
    end; 
  end; 
  {A teraz sprawdzamy} 
  begin 
    writeln(a); 
    writeln(b); 
    writeln(s); 
    writeln(z); 
  end; 
end.
