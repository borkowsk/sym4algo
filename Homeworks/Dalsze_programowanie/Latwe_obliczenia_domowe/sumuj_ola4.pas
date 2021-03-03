Program sumuj;
  var x,y : real;
Begin
  x:=0;
  Writeln('Program "sumuj¹cy" Oli Góralczyk');
  Writeln;
  repeat
    begin
      Writeln('Podaj liczbê w formacie IEEE (0 aby zakoñczyæ) :');
      Readln(y);
      x:= x+y;
      Writeln('Suma liczb = ',x);    
      Writeln;
    end
  until y = 0;
End.