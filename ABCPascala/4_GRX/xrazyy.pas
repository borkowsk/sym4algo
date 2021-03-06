Program Funkcja3D; {Kolorowe mapowanie warto�ci funkcji f(x,y)}

Const 
   START=0; {dzielone przez DZIEL daje pocz�tek zakresu}
   FINAL=500; {dzielone przez DZIEL daje koniec zakresu}
   DZIEL=500;

Var 
   x,y:real; {parametry dla funkcji}
   z:real;  {Stan 'uk�adu' policzony funkcj�} 
  
   j,k:integer; {Zliczanie iteracji} 

Begin 
  For k:=START to FINAL do  {Petla po X}
    For j:=START to FINAL do {Wewn�trzna p�tla po Y}
      Begin 
        x:=k/DZIEL; {Przerobienie ca�kowitych na real'e}
        y:=j/DZIEL;
        
        z:=x*y; {Obliczenie funkcji}
        
        if z> 0 then {mapowanie z na kolor}
           pen(1,round(z*255),round(z*255),0)
           else {dla ujemnych}
           pen(1,0,round(-z*255),round(-z*255));
           
        point(k-START,j-START); {w�a�ciwe rysowanie} 
      end 
end.

