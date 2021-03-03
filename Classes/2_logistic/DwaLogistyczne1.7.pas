Program IteracjaDwuLogistyczna1_7; 

Const       
   N = 50;   {Ile iteracji} 
   lx = 3.6; {Parametr kontroli x} 
   ly = 3.1; {Parametr kontroli y}
Var 
   x,y:real;   {Stan uk³adu} 
   i:integer; {Zliczanie iteracji} 

Begin 
  Write('Jaki X0? '); 
  readln(x);     {Pobranie wartoœci startowej "partnerki"}
  Write('A jaki Y0? '); 
  readln(y);     {Pobranie wartoœci startowej "partnera"} 
  
  For i:=1 to N do 
    Begin  {Obliczenie iteracji}
       x:=lx*(0.5*x+0.5*y)*(1-(0.5*x+0.5*y)); {gdy s¹ mocno}
       y:=ly*(0.5*x+0.5*y)*(1-(0.5*x+0.5*y)); {zale¿ne}
       Writeln('X',i,'=',x,' Y',i,'=',y);
    end 
end.
