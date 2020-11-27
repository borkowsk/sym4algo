Program cyferki;

Var
  sumadodatnia,sumaujemna,wartosc:real;
  p, liczba,liczbadodatnia,liczbaujemna:integer;

Begin
 sumadodatnia:=0;sumaujemna:=0;liczbadodatnia:=0;liczbaujemna:=0;
 writeln('Ile liczb chcesz podac ? ');
 readln(liczba);
 writeln('Podaj te liczby ');
   for p:=1 to liczba do
  begin
   readln(wartosc);
   if wartosc>-1 then sumadodatnia:=sumadodatnia+wartosc;
   if wartosc>-1 then liczbadodatnia:=liczbadodatnia+1;
   if wartosc<0 then sumaujemna:=sumaujemna+wartosc;
   if wartosc<0 then liczbaujemna:=liczbaujemna+1;
 
   end;
   
      writeln;
      writeln('Mamy ',liczba,' liczb');
      writeln;
      writeln('Dodatnich ',liczbadodatnia,'');
      writeln('Ujemnych ',liczbaujemna,'');
      writeln;
      writeln('Suma dodatnich ',sumadodatnia,'');
      writeln('Suma ujemnych ',sumaujemna,'');
      writeln;
      writeln('Srednia liczb dodatnich ',sumadodatnia/liczba,'');
      writeln('Srednia liczb ujemnych ',sumaujemna/liczba,'');
      writeln;
      writeln('Kwadrat  sredniej liczb dodatnich ',((sumadodatnia/liczba)*(sumadodatnia/liczba)),'');
      writeln('Kwadrat sredniej liczb ujemnych ',((sumaujemna/liczba)*(sumaujemna/liczba)),'');
      writeln;
      writeln('Pierwiastek sredniej liczb wynosi ', (sqrt(sumadodatnia/liczba)),'');

end.