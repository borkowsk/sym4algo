Program Sumowanie;
{Rozwi¹zanie zadania 3; Adrian Gnatek}
Var 
a,w:real;
Label 1;

 Begin
  w:=0;
  Writeln('Program sumuje podawane przez u¿ytkownika liczby.'); 
  Writeln('Aby otrzymaæ wynik nale¿y dodaæ cyfrê 0!');
  Writeln;
  Writeln('Podaj pierwsz¹ liczbê:');
  Readln(a);
  w:=w+a;
  
    if a=0 then goto 1;
          repeat
             Writeln('+');
             Readln(a);
             w:=w+a;
          until a=0;
          
      Writeln; 
      Writeln('Wynikiem sumowania jest liczba:');
      Writeln(w);
    1:Writeln;
      Writeln('Koniec!');
 End.