Program Sumuj;
const KONIEC=0;
var Suma,Wartoœæ:real; 

begin
Suma:=0;

repeat
writeln('Podaj wartoœæ (jeœli 0 to koniec)');
readln(Wartoœæ);
Suma:=Suma+Wartoœæ;
until Wartoœæ=KONIEC;

Writeln('Suma wynosi ',Suma)
end.
