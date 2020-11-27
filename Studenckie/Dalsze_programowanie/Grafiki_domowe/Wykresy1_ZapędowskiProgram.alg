Program Wykresy;
{Autor programu: Przemyslaw Zapedwoski}

Var a,b,c,skala: real; 

procedure rysuj_osie;

begin
  pen(3,0,0,0);
  moveto(500,0);
  lineto(500,1000);
  moveto(500,0);
  lineto(520,40);
  moveto(500,0);
  lineto(480,40);
  {rysujemy os y ze strzalkami}
  moveto(0,500);
  lineto(990,500);
  lineto(950,520);
  moveto(990,500);
  lineto(950,480);
  {rysujemy os x ze strzalkami}
end;

procedure skaluj;

var
   brzeg,ekstremum: real;

begin
      brzeg := a*25 -5*b + c;
      if a*25 + b*5 + c < brzeg then
         brzeg := a*25 + b*5 + c;
      {wartosc funkcji dla brzegowych wartosci}
      
      ekstremum := -1 * (b*b - 4*a*c)/(4*a);
      
      if a = 0  then
      begin
         if b >= 0 then
            ekstremum := a*25 + b*5 + c;
         if b < 0 then   
             ekstremum := a*25 - b*5 + c;
      end;
         
      {majac dwa najbardziej wysuniete punkty na wykresie mozemy go
       przeskalowac}
      if (abs(brzeg) + abs(ekstremum)) > 1000 then 
         skala := (1000/(abs(brzeg) + abs(ekstremum)));
      if (abs(brzeg) + abs(ekstremum)) < 1000 then
         skala := 1;
end;

procedure rysuj_wykres;

var i:integer;

begin
   skaluj;
   moveto(0,trunc(a*2500 - b*50 + c));
   for i:=0 to 1000 do
      lineto(i,trunc((a*(i-500)*(i-500)*0.01 + b*(i-500)*0.1 +c)*skala));

end;

begin
  Write('Podaj wspolczynik a: '); 
  Readln(a);
  Write('Podaj wspolczynik b: '); 
  Readln(b);
  Write('Podaj wspolczynik c: '); 
  Readln(c);
  rysuj_osie;
  rysuj_wykres;
end.

