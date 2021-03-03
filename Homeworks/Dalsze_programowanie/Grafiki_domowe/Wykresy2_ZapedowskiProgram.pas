Program Wykresy;
{Autor programu: Przemyslaw Zapedowski}

Var a,b,c,skala: real;
    replej,xmin,xmax: integer;
    opcja: char;

Procedure rysuj_osie;

Begin
  Pen(1,0,0,0);
  MoveTo(500,0);
  LineTo(500,1000);
  MoveTo(500,0);
  LineTo(520,40);
  MoveTo(500,0);
  LineTo(480,40);
  {narysowalismy os y ze strzalkami}
  MoveTo(0,500);
  LineTo(990,500);
  LineTo(950,520);
  MoveTo(990,500);
  LineTo(950,480);
  {narysowalismy os x ze strzalkami}
end;

{Procedure skaluj;

Var
   brzeg,ekstremum: real;

Begin
      brzeg := a*25 -5*b + c;
      If a*25 + b*5 + c < brzeg then
         brzeg := a*25 + b*5 + c;
      {wartosc funkcji dla przegowych wartosci}
      
{      ekstremum := -1 * (b*b - 4*a*c)/(4*a);
      
      If a = 0  then
      Begin
         If b >= 0 then
            ekstremum := a*25 + b*5 + c;
         If b < 0 then   
             ekstremum := a*25 - b*5 + c;
      end;
         
      {majac dwa najbardziej wysuniete punkty na wykresie mozemy go
przeskalowac}
{      If (abs(brzeg) + abs(ekstremum)) > 1000 then 
         skala := (1000/(abs(brzeg) + abs(ekstremum)));
      If (abs(brzeg) + abs(ekstremum)) < 1000 then
         skala := 1;
end;}

Procedure rysuj_wykres;

Var i,kolor:integer;
    wart_fun: real;

Begin
   If (replej = 0) then
   Begin
      Clear;
      rysuj_osie;
   end;
   wart_fun := -a*xmin*xmin*100 + b*xmin*10 - c;
   If wart_fun >= 0 then
   Begin
       kolor:= 1;{zapamietujemy jaka byla poprzednia
              warto?c koloru 0 - czerwony, 1 - zielony}
       Pen(1,255,0,((64*replej)mod 255));      
   end;
   If wart_fun < 0 then
   Begin
       kolor:= 0;{zapamietujemy jaka byla poprzednia
              warto?c koloru 0 - czerwony, 1 - zielony}
       Pen(1,0,255,((64*replej)mod 255));      
   end;
      
   MoveTo(0,trunc(wart_fun));
   For i:=xmin*100 to xmax*100 do
   Begin
      wart_fun := -a*i*i*0.01 - b*i*0.1 -c;
      LineTo(i+500,trunc(wart_fun)+500);
      If (wart_fun >= 0) and (kolor = 0) then
      Begin
        kolor:= 1;
        Pen(1,255,0,0);      
      end;
      If (wart_fun < 0) and (kolor = 1) then
      Begin
        kolor:= 0;
        Pen(1,0,255,0);      
      end;
   end;   

end;

Procedure rysowanie_wykresu;
Begin
  MoveTo(0,0);
  WriteLn('program do rysowania wykresow');
  WriteLn('o wzorze: a*x^2 + b*x + c');
  WriteLn('przy zakresie xmin - ',xmin,', xmax - ',xmax);
  Write('Podaj wspolczynik a: '); 
  ReadLn(a);
  Write('Podaj wspolczynik b: '); 
  ReadLn(b);
  Write('Podaj wspolczynik c: '); 
  ReadLn(c);
  TextColor(255,255,255);
  WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
  TextColor(0,0,0);
  rysuj_osie;
  rysuj_wykres;
end;

Procedure wybierz_zakres;
Begin
   moveto(0,0);
   Write('podaj x minimalne (obecne - ',xmin,') - ');
   Read(xmin);
   Write('podaj x maksymalne (obecne - ',xmax,') - ');
   read(xmax);
   moveto(0,0);
   TextColor(255,255,255);
   WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
   WriteLn('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
   TextColor(0,0,0);
   replej := replej - 1;
   if (xmin >= xmax) then
   begin
      moveto(100,100);
      writeln('Blad !! xmin nie moze byc wieksze niz xmax');
      writeln('Wyjscie z programu !!');
      replej := 4;
   end;
end;

Begin
   replej :=0;
   xmin := -5;
   xmax := 5;
   Repeat
      MoveTo(0,0);
      WriteLn('Czy narysowac wykres? (t/n/z/x) ');
      WriteLn('(t - tak, n - nie');
      WriteLn('z - rysuj nowy, ale pozostaw stary wykres,');
      WriteLn('x - wybierz inny zakres xmin i xmax,');
      WriteLn('po 4 razach nastapi wyjscie z programu)');
      Read(opcja);
      If (opcja ='t') then
         replej := 0;
      If (opcja ='n') then
         replej:= 4;
      If (opcja ='z') then
         replej:= replej + 1;
      If (opcja ='x') then
      begin
         MoveTo(0,0);
         TextColor(255,255,255);
         WriteLn('Czy narysowac wykres? (t/n/z/x) ');
         WriteLn('(t - tak, n - nie');
         WriteLn('z - rysuj nowy, ale pozostaw stary wykres,');
         WriteLn('x - wybierz inny zakres xmin i xmax,');
         WriteLn('po 4 razach nastapi wyjscie z programu)');
         TextColor(0,0,0);
         wybierz_zakres;
      end;
      MoveTo(0,0);
      TextColor(255,255,255);
      WriteLn('Czy narysowac wykres? (t/n/z/x) ');
      WriteLn('(t - tak, n - nie');
      WriteLn('z - rysuj nowy, ale pozostaw stary wykres,');
      WriteLn('x - wybierz inny zakres xmin i xmax,');
      WriteLn('po 4 razach nastapi wyjscie z programu)');
      TextColor(0,0,0);
      If not(opcja = 'z') and not(opcja = 'n') and not(opcja = 't') and
not(opcja = 'x') then
          WriteLn('nie rozpoznana komenda prosze wybrac jeszcze raz');
      Case replej of 
         0:
            rysowanie_wykresu;
         1:
            rysowanie_wykresu;
         2:
            rysowanie_wykresu;
         3: 
            rysowanie_wykresu;
      end;
   until replej = 4;
end.

