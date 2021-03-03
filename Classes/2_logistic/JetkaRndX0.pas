Program JetkaRndX0; 

Const 
   N = 250; {Ile iteracji} 
   START=100; {dzielone przez DZIEL daje pocz¹tek zakresu r}
   FINAL=400; {dzielone przez DZIEL dajekoniec zakresu r}
   DZIEL=100;
Var 
   x:real;      {Stan uk³adu} 
   r1,r2:real;  {Zmieniane w pêtlach parametry kontroli} 
   i,j,k:integer;  {Zliczanie iteracji} 

Begin 
  For k:=START to FINAL do 
    For j:=START to FINAL do 
      Begin 
        x:=Random; {inicjalizacja x0 liczb¹ losow¹ z zakreso 0..1}
        r1:=k/DZIEL; {Obliczenie parametrów kontroli}
        r2:=j/DZIEL; 
        For i:=1 to N do 
          Begin 
            if i mod 2 = 0 then {na zmianê...}
            {Obliczenie iteracji} 
              x:=r1*x*(1-x) 
            else 
              x:=r2*x*(1-x); 
          end; 
        {Tylko ostatni punkt iteracji dla ka¿dej pary parametrów}  
        pen(1,round(x*255),round(x*255),0); 
        point(k-START,j-START); 
      end 
end.
