Program Dziel;
Var Dzielna,Dzielnik,Wynik:real;
Begin
Writeln( 'Podaj dzieln¹' );
Readln(Dzielna);
Writeln( 'Podaj dzielnik' );
Readln(Dzielnik);

if Dzielnik<>0 then
begin
 wynik:=Dzielna/Dzielnik;
 Writeln(Wynik)
end
else
 Writeln( 'Pamiêtaj cholero, nie dziel przez zero' )
End.

