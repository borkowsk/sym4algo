Program IteracjaLogistyczna2; 

Const        {Blok sta³ych}
   N = 500;   {Ile iteracji} 
   a = 3;    {Parametr kontroli od 0 do 4} 
Var 
   x:real;   {Stan uk³adu} 
   i:integer;{Zliczanie iteracji} 
   out:text; {zmienna plikowa}
Begin 
  Write('Jaki X0? '); 
  readln(x);     {Pobranie wartoœci startowej}
  Assign(out,'logistyczna.out');
  Rewrite(out);
  Writeln(out,x);
  For i:=1 to N do 
    Begin 
    x:=a*x*(1-x); {Obliczenie iteracji}
    Writeln('X',i,'=',x);
    Writeln(out,x);
    end; 
  Close(out)
end.
