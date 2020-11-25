Program Sumuj_zadane;
var Suma,Wartoœæ:real; 
  z,Liczba:integer;
begin
Suma:=0;
writeln('Ile bêdzie liczb?');
readln(Liczba);

for z:=1 to Liczba do
  begin 
  readln(Wartoœæ);
  Suma:=Suma+Wartoœæ;
  end;

writeln('Suma wynosi ',Suma)
end.

