Program Sumuj�cy;
 var  suma, x : real;
 
Begin
 suma:=0;
 Writeln('Wprowadzaj kolejno liczby kt�re chcesz zsumowa�.');
 Writeln('Aby otrzyma� wynik sumy-wybierz "0".');
 Writeln('');
   
     Repeat 
      Writeln('Podaj liczb� ');
      Read(x);
      suma:=suma+x;
     Until x=0; 
      Write('Suma wynosi  ' , suma);
 
End.  
 