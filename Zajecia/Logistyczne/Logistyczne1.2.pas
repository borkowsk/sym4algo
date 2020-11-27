Program IteracjaLogistyczna1; 

Const        {Blok sta³ych}
   N = 20;   {Ile iteracji} 
   a = 3;    {Parametr kontroli} 
Var 
   x:real;   {Stan uk³adu} 
   i:integer;{Zliczanie iteracji} 

Begin 
  Write('Jaki X0? '); 
  readln(x);     {Pobranie wartoœci startowej}
  For i:=1 to N do 
    Begin 
    x:=a*x*(1-x); {Obliczenie iteracji}
    Writeln('X',i,'=',x);
    end 
end.
