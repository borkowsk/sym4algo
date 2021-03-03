Program JetkaLapunow; 

Const 
   N = 250; {Ile iteracji} 
   START=400; {dzielone przez DZIEL daje pocz¹tek zakresu r}
   FINAL=800; {dzielone przez DZIEL dajekoniec zakresu r}
   DZIEL=200;
Var 
   x:real; {Stan uk³adu} 
   r1,r2:real; {Zmieniane parametry kontroli} 
   a,s,min,max,ln2:real; {Dla statystyk}
   i,j,k:integer; {Zliczanie iteracji} 
   
procedure UstawKolor(v:real);
begin
  if v> 0 then {mapowanie v na kolor}
     pen(1,round(v*255),round(v*50),0)
  else {dla ujemnych}
     pen(1,0,round(-v*25),round(-v*255));
end;   
   
Begin 
  ln2:=ln(2);
  min:=100000;
  max:=-100000;
  For k:=START to FINAL do 
    For j:=START to FINAL do 
      Begin 
        s:=0;{Liczy sumê logarytmów a potem z niej srednia}
        x:=Random; 
        r1:=k/DZIEL; 
        r2:=j/DZIEL; 
         For i:=1 to N do 
          Begin 
            if i mod 2 = 0 then {Obliczenie iteracji} 
            begin
              x:=r1*x*(1-x);
              a:=abs(r1-2*r1*x);
              if a>0 then
                s:=s+ln(a)/ln2;
            end    
            else
            begin 
              x:=r2*x*(1-x); 
              a:=abs(r2-2*r2*x);
              if a>0 then
                s:=s+ln(a)/ln2;
            end;  
          end; 
        s:=s/N;         
        if s>max then max:=s;
        if s<min then min:=s;
        {Rysowanie œrednich}
        UstawKolor(s);
        point(k-START,j-START); 
      end; 
      
  {LEGENDA}    
  For k:=0 to FINAL-START do
    begin
     x:=min+k/(FINAL-START)*(max-min);
     {Rysowanie skali}
     UstawKolor(x);
     line(FINAL-START+50,k,FINAL-START+80,k); 
    end;     
    moveto(FINAL-START+82,0);
    write(min);
    moveto(FINAL-START+82,FINAL-START);
    write(max);
end.
