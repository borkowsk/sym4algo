Program Sumuj;
const KONIEC=0;
var Suma,Warto��:real; 

begin
Suma:=0;

repeat
writeln('Podaj warto�� (je�li 0 to koniec)');
readln(Warto��);
Suma:=Suma+Warto��;
until Warto��=KONIEC;

Writeln('Suma wynosi ',Suma)
end.
