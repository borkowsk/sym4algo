Program suma;

Var
  sumaplus,sumaminus,wartosc:real;
  z, liczba,liczbaplus,liczbaminus:integer;

Begin
 sumaplus:=0;sumaminus:=0;liczbaplus:=0;liczbaminus:=0;
 writeln('Ile bedzie liczb? ');
 readln(liczba);
 writeln('Podawaj wartosci ');
      for z:=1 to liczba do
     begin
     readln(wartosc);
     if wartosc>-1     then sumaplus:=sumaplus+wartosc;
     if wartosc>-1     then liczbaplus:=liczbaplus+1;
     if wartosc<0 then sumaminus:=sumaminus+wartosc;
     if wartosc<0 then liczbaminus:=liczbaminus+1;
     
   end;
 Writeln;
 Writeln('Podales >',liczba,'< liczby');
 Writeln;
 writeln('Z czego >',liczbaplus,'< liczb dodatnich');
 writeln('A >',liczbaminus,'< liczb ujemnych');
 Writeln;
 Writeln('Suma wyniosla dla dodatnich >',sumaplus,'<');
 Writeln('Suma wyniosla dla ujemnych >',sumaminus,'<');
 Writeln;
 Writeln('Ich srednia wyniosla dla liczb dodatnich >',sumaplus/liczba,'<');
 Writeln('Ich srednia wyniosla dla liczb ujemnych >',sumaminus/liczba,'<');
 Writeln;
 Writeln('Kwadrat  sredniej liczb dodatnich >',((sumaplus/liczba)*(sumaplus/liczba)),'<');
 Writeln('Kwadrat sredniej liczb ujemnych>',((sumaminus/liczba)*(sumaminus/liczba)),'<');
 Writeln;
 Writeln('Pierwiastek ich sredniej >', (sqrt(sumaplus/liczba)),'<');
  Writeln('Nie mozna jednakowoz pierwiastkowac liczb ujemnych. HA!');
end.

