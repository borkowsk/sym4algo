Program IteracjaDwuLogistyczna2; 

Const       
   N = 50;   {Ile iteracji} 
   P = 10;   {Po ilu sprzega } 
   l = 3.6;   {Parametr kontroli - wspólny, d¹¿¹ do tego samego!} 
Var 
   x,y:real;   {Stan uk³adu} 
   i:integer;{Zliczanie iteracji} 

Begin 
  Write('Jaki X0? '); 
  readln(x);     {Pobranie wartoœci startowej "partnerki"}
  Write('A jaki Y0? '); 
  readln(y);     {Pobranie wartoœci startowej "partnera"} 
  
  For i:=1 to N do 
    Begin  {Obliczenie iteracji}
    if i>P then
      begin
       x:=l*(0.5*x+0.5*y)*(1-(0.5*x+0.5*y)); {gdy}
       y:=l*(0.5*x+0.5*y)*(1-(0.5*x+0.5*y)); {zale¿ne}
      end
      else
      begin 
       x:=l*x*(1-x); {gdy}
       y:=l*y*(1-y)  {niezale¿ne}
      end; 
      
    Writeln('X',i,'=',x,' Y',i,'=',y);
    end 
end.
