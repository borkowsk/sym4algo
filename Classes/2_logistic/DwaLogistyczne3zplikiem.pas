Program DwuLogistyczna3zplikiem; 

Const        
   N = 300;   {Ile iteracji} 
   P = 150;   {Po ilu sprzega } 
   lx = 3.60; {Parametr kontroli dla partnerki}
   ly = 3.99; {Parametr kontroli dla partnera} 
   alp= 0.44; {Wspó³czynnik zaanga¿owania }
Var 
   x,y:real; {Stan uk³adu} 
   i:integer;{Zliczanie iteracji} 
   aal:real; {1-alp - dla u³atwienia kodu}
   out:text; {zmienna plikowa}
   
Begin 
  Write('Jaki X0? '); 
  readln(x);     {Pobranie wartoœci startowej "partnerki"}
  Write('A jaki Y0? '); 
  readln(y);     {Pobranie wartoœci startowej "partnera"}
  aal:=1-alp; 
  
  Assign(out,'DwuLogistyczna.out');
  Rewrite(out);
  
  Writeln(out,'Krok',chr(9),'Kowalska{x}',chr(9),'Kowalski{y}',
                     chr(9),'Lamb.X=',lx,chr(9),'Lamb.Y=',ly);
  Writeln(out,0,chr(9),x,chr(9),y);
  
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
    Writeln(out,i,chr(9),x,chr(9),y);
    end; 
    
   Close(out);  
end.
