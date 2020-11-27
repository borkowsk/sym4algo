Program IteracjaDwuLogistyczna1_5; 

Const       
   N = 50;   {Ile iteracji} 
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
       x:=l*(0.5*x+0.5*y)*(1-(0.5*x+0.5*y)); {gdy s¹ mocno}
       y:=l*(0.5*x+0.5*y)*(1-(0.5*x+0.5*y)); {zale¿ne}
    Writeln('X',i,'=',x,' Y',i,'=',y);
    end 
end.
