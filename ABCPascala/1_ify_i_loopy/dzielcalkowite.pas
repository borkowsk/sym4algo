Program DzielCa�kowite; 

Var 
   Dzielna,Dzielnik:integer; 

Begin 
  Writeln( 'Podaj dzieln� (cakowit�)' ); 
  Readln(Dzielna); 
  Writeln( 'Podaj dzielnik (ca�kowity)' ); 
  Readln(Dzielnik); 
  if Dzielnik<>0 then 
    begin 
      Writeln('Wynik ',Dzielna div Dzielnik); 
      Writeln('Reszta ',Dzielna mod Dzielnik); 
    end 
  else 
    Writeln( '"Pami�taj cholero, nie dziel przez zero!"' ) 
End.
