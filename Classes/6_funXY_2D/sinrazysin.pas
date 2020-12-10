Program Funkcja3D; {cos(x)*cos(y) wizualizowane kolorem}

Const 
   START=0; {dzielone przez DZIEL daje pocz¹tek zakresu}
   FINAL=500; {dzielone przez DZIEL daje koniec zakresu}
   DZIEL=500;

Var 
   x,y:real; {parametry dla funkcji}
   z:real;  {Stan 'uk³adu' policzony funkcj¹} 
  
   j,k:integer; {Zliczanie iteracji} 

Begin 
  For k:=START to FINAL do  {Petla po X}
    For j:=START to FINAL do {Wewnêtrzna pêtla po Y}
      Begin 
        x:=k/DZIEL; {Przerobienie ca³kowitych na real'e}
        y:=j/DZIEL;
        
        z:=cos(x)*cos(y); {Obliczenie funkcji}
        
        if z> 0 then {mapowanie z na kolor}
           pen(1,round(z*255),round(z*255),0)
           else
           pen(1,0,round(-z*255),round(-z*255));
           
        point(k-START,j-START); {w³aœciwe rysowanie} 
      end 
end.

{ALTERNATYWNE KOLOROWANIE UJEMNYCH}
{pen(1,0,round(255+z*255),round(255+z*255));}
