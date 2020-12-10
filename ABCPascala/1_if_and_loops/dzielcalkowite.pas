Program DzielCa³kowite; 

Var 
   Dzielna,Dzielnik:integer; 

Begin 
  Writeln( 'Podaj dzieln¹ (cakowit¹)' ); 
  Readln(Dzielna); 
  Writeln( 'Podaj dzielnik (ca³kowity)' ); 
  Readln(Dzielnik); 
  if Dzielnik<>0 then 
    begin 
      Writeln('Wynik ',Dzielna div Dzielnik); 
      Writeln('Reszta ',Dzielna mod Dzielnik); 
    end 
  else 
    Writeln( '"Pamiêtaj cholero, nie dziel przez zero!"' ) 
End.
