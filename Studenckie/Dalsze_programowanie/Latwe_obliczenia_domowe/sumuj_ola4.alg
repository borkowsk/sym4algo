Program sumuj;
  var x,y : real;
Begin
  x:=0;
  Writeln('Program "sumuj�cy" Oli G�ralczyk');
  Writeln;
  repeat
    begin
      Writeln('Podaj liczb� w formacie IEEE (0 aby zako�czy�) :');
      Readln(y);
      x:= x+y;
      Writeln('Suma liczb = ',x);    
      Writeln;
    end
  until y = 0;
End.