Program IteracjaDwuLogistyczna4; 

Const        
   N = 500;   {Ile iteracji} 
   P = 150;   {Po ilu sprzega } 
   lx = 3.66; {Parametr kontroli dla partnerki}
   ly = 3.88; {Parametr kontroli dla partnera} 
   alp= 0.24; {Wspó³czynnik zaanga¿owania }
   x0=0.01; {Domyslne stany poczatkowe}
   y0=0.99; {j.w.}
Var 
   x,y:real; {Stan uk³adu} 
   i:integer;{Zliczanie iteracji} 
   aal:real; {1-alp - dla u³atwienia kodu}
Begin 
  x:=x0;
  y:=y0;
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
    pen(1,255,0,255);
    point(round(200*x),i);
    pen(1,0,255,0);
    point(round(200*y),i);  
    {Writeln('X',i,'=',x,' Y',i,'=',y);}
    end 
end.
