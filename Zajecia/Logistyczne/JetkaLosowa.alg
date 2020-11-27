Program JetkaLosowa; 

Const 
   N = 250; {Ile iteracji} 
   x0=0.99;  {Domyslne stany poczatkowe} 
   START=100; {dzielone przez DZIEL daje pocz¹tek zakresu r}
   FINAL=400; {dzielone przez DZIEL dajekoniec zakresu r}
   DZIEL=100;
Var 
   x,s:real; 
   {Stan uk³adu} 
   r1,r2:real; 
   {Zmieniane parametry kontroli} 
   i,j,k:integer; 
   {Zliczanie iteracji} 

Begin 
  For k:=START to FINAL do 
    For j:=START to FINAL do 
      Begin 
        s:=0;{Liczy sumê a potem z niej srednia}
        x:=x0; 
        r1:=k/DZIEL; 
        r2:=j/DZIEL; 
        For i:=1 to N do 
          Begin 
            {if Random(2) = 0 then}{Wersja z losowym wyborem} 
            if i mod 2 = 0 then  {Obliczenie iteracji 'klasyczne'} 
              x:=r1*x*(1-x) 
            else 
              x:=r2*x*(1-x); 
            s:=s+x;  
          end; 
        s:=s/N;  
        {Rysowanie œrednich}
        pen(1,round(s*255),round(s*255),round(s*255));
        {pen(1,round(sqrt(s)*255),round(s*255),round((1-sqrt(s))*255));}
        point(k-START,j-START); 
        {rysowanie wartoœci koñcowych}
        pen(1,round(x*255),round(x*255),0);
        point((FINAL-START+2)+k-START,j-START); 
      end 
end.
