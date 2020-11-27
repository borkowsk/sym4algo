Program IteracjaLogistyczna1; 

Const 
   N = 20;   {Ile iteracji} 
   a = 2;    {Parametr kontroli} 
Var 
   x:real;   {Stan uk³adu} 
   i:integer;{Zliczanie iteracji} 

Begin 
  Write('Jaki X0? '); 
  readln(x); 
  For i:=1 to N do 
    Begin 
    x:=a*x*(1-x);
    Writeln('X',i,'=',x);
    end 
end.
