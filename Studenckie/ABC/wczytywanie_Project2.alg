program Project2;

{$APPTYPE CONSOLE}

var
liczba,suma,granica:real;
begin
write('ABY ZAKONCZYC WPISZ "0"               ');
suma:=0;
repeat
write('Podaj liczbe do zsumowania: ');
readln(liczba);
suma:=suma+liczba;
writeln('Suma podanych liczb wynosi: ', suma );
until liczba=0;

end.

