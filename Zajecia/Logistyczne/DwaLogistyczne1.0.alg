Program IteracjaDwuLogistyczna1; 

Const        {Blok sta�ych}
   N = 200;   {Ile iteracji} 
   lx = 3;   {Parametr kontroli dla x}
   ly = 4;   {Parametr kontroli dla y} 
Var 
   x,y:real;   {Stan uk�adu} 
   i:integer;{Zliczanie iteracji} 

Begin 
  Write('Jaki X0? '); 
  readln(x);     {Pobranie warto�ci startowej "partnerki"}
  Write('A jaki Y0? ');
  readln(y);     {Pobranie warto�ci startowej "partnera"}
  For i:=1 to N do 
    Begin 
    x:=lx*x*(1-x); {Obliczenie iteracji}
    y:=ly*y*(1-y); {Gdy niezale�ne}
    Writeln('X',i,'=',x,' Y',i,'=',y);
    end 
end.
