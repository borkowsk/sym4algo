Program Losowe_b³¹dzenie2; 
{Losowe b³¹dzenie w obcym œrodowisku} 
{
Wojciech Borkowski i Adrian Elczewski (student SPIK)
Rozwi¹zanie zadania dodatkowego:
Wersja zmodyfikowana, ¿eby dzia³a³a w elipsie,
i powtarza³a dla 100 czastek
}

const 
   width = 400; 
   height = 500;
   czastek = 100;
var 
   x,y, widdiv2, heidiv2, krokow, min, max, sum, i: integer; 
   first, second, temporary : real; 

begin 
  randomize; 
  widdiv2 := width div 2; 
  heidiv2 := height div 2; 
  first := 1/6; 
  second := 3/6; 
  max := 0; 
  sum := 0; 
  min := 2147483647; 
  For i := 1 to czastek do 
    begin 
      krokow := 0; 
      temporary := 0; 
      clear; 
      ellipse(0, 0, width - 1, height - 1); 
      x := widdiv2; 
      y := heidiv2; 
      repeat 
        krokow := krokow + 1; 
        point (0, height); 
        writeln(i,' ',krokow); 
        x := x + random(3) - 1; 
        y := y + random(3) - 1; 
        temporary := abs(sqr(widdiv2 - x) / sqr(widdiv2) + sqr(heidiv2 - y) / sqr(heidiv2)); 
        if temporary < first then 
          pen(1, 0, 0, round((krokow mod 256)* temporary / first)) 
        else 
          if temporary < second then 
            pen(1, 0, round((krokow mod 256) * temporary / second), 0) 
          else 
            pen(1, round((krokow mod 256) * temporary / second), 0, 0); 
        point(x, y); 
      until sqr(widdiv2 - x) / sqr(widdiv2) + sqr(heidiv2 - y) / sqr(heidiv2) > 1; 
      sum := sum + krokow;
      if min > krokow then 
        min := krokow; 
      if max < krokow then 
        max := krokow; 
    end;
point(0, height + 20);
writeln('maksymalny czas ', max, ' kroków');
point(0, height + 40);
writeln('minimlny czas ', min, ' kroków');
point(0, height + 60);
writeln('œredni czas ', round(sum / czastek), ' kroków');
end.
