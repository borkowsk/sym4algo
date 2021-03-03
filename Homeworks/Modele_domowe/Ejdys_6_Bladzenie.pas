Program Losowe_b³¹dzenie_Katarzyna_Ejdys; 

const 
   s = 300; 
   symulacji = 100; 
var 
   x, y, licznik, minimum, maksimum, sym:integer; 

function distance(x1, y1, x2, y2:real):real; 

begin 
  distance := sqrt(sqr(x1 - x2) + sqr(y1 - y2)); 
end; 

begin 
  minimum := 0; 
  maksimum := 0; 
  For sym := 1 to symulacji do 
    begin 
      clear; 
      licznik := 0; 
      ellipse(0, 0, s - 1, s - 1); 
      x:= s div 2; 
      y:= s div 2; 
      repeat 
        pen(1, licznik div 128, licznik div 256, licznik mod 128); 
        point(x, y); 
        moveto(0, 0); 
        write(licznik); 
        x := x + random(3) - 1; 
        y := y + random(3) - 1; 
        licznik := licznik + 1; 
      until distance(x, y, s / 2, s / 2) > s / 2; 
      if minimum = 0 then 
        minimum := licznik 
      else 
        if licznik < minimum then 
          minimum := licznik; 
      if maksimum = 0 then 
        maksimum := licznik 
      else 
        if licznik > maksimum then 
          maksimum := licznik; 
    end; 
  point(10, s); 
  writeln(' W kroku ', licznik); 
  writeln('Minimalna iloœæ kroków ', minimum); 
  writeln('Maksymalna iloœæ kroków ', maksimum); 
end.