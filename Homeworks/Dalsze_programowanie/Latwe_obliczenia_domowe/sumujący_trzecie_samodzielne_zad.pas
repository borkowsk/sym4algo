Program Sumuj¹cy;
 var  suma, x : real;
 
Begin
 suma:=0;
 Writeln('Wprowadzaj kolejno liczby które chcesz zsumowaæ.');
 Writeln('Aby otrzymaæ wynik sumy-wybierz "0".');
 Writeln('');
   
     Repeat 
      Writeln('Podaj liczbê ');
      Read(x);
      suma:=suma+x;
     Until x=0; 
      Write('Suma wynosi  ' , suma);
 
End.  
 