Program JetkaSrednia; 

Const 
   N = 250; {Ile iteracji} 
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
        x:=Random; 
        r1:=k/DZIEL; 
        r2:=j/DZIEL; 
        For i:=1 to N do 
          Begin 
            if i mod 2 = 0 then 
            {Obliczenie iteracji} 
              x:=r1*x*(1-x) 
            else 
              x:=r2*x*(1-x); 
            s:=s+x;  
          end; 
        s:=s/N;         
        {Rysowanie œrednich}
        pen(1,round(s*255),round(s*255),round(s*255));
        {Alternatywne kolorowanie}
        {pen(1,round(sqrt(s)*255),round(s*255),round((1-sqrt(s))*255));}
        point(k-START,j-START); 
      end 
end.
