Program Sumuj_zadane;
var Suma,Warto��:real; 
  z,Liczba:integer;
begin
Suma:=0;
writeln('Ile b�dzie liczb?');
readln(Liczba);

for z:=1 to Liczba do
  begin 
  readln(Warto��);
  Suma:=Suma+Warto��;
  end;

writeln('Suma wynosi ',Suma)
end.

