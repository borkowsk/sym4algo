Program IteracjaDwuLogistyczna3; 

Const        
   N = 50;   {Ile iteracji} 
   P = 50;   {Po ilu sprzega } 
   lx = 3.6; {Parametr kontroli dla partnerki}
   ly = 3.88; {Parametr kontroli dla partnera} 
   alp= 0.44; {Wspó³czynnik zaanga¿owania }
Var 
   x,y:real; {Stan uk³adu} 
   i:integer;{Zliczanie iteracji} 
   aal:real; {1-alp - dla u³atwienia kodu}
Begin 
  Write('Jaki X0? '); 
  readln(x);     {Pobranie wartoœci startowej "partnerki"}
  Write('A jaki Y0? '); 
  readln(y);     {Pobranie wartoœci startowej "partnera"}
  aal:=1-alp;
  For i:=1 to N do 
    Begin
    if i>P then
      begin
       x:=lx*(aal*x+alp*y)*(1-(aal*x+alp*y)); {Obliczenie iteracji}
       y:=ly*(alp*x+aal*y)*(1-(alp*x+aal*y)); {gdy zale¿ne}
      end
      else
      begin 
       x:=lx*x*(1-x); {Obliczenie iteracji}
       y:=ly*y*(1-y)  {Gdy niezale¿ne}
      end; 
      
    Writeln('X',i,'=',x,' Y',i,'=',y);
    end 
end.
