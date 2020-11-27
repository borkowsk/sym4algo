Program Kartofel;
const koniec=0;
var suma,liczba:real;

Begin 
suma:=0;
write ('Podaj liczby  ');
repeat
readln(liczba);
suma:=suma+liczba;
until liczba=koniec;
writeln(suma);
end.