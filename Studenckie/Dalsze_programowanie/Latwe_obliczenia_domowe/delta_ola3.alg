Program oblicz_delt�; 
Var 
   a,b,c,d,d2,x,x1,x2:real; 
Begin 
  Writeln('Program "oblicz delt�" Oli G�ralczyk');
  Writeln;
  Writeln('Wz�r og�lny r�wnania : y=ax^2+bx+c');
  Writeln('Podaj wsp�czynnik a : ' ); 
  Readln(a); 
  Writeln('Podaj wsp�czynnik b : ' ); 
  Readln(b); 
  Writeln('Podaj wsp�czynnik c : ' ); 
  Readln(c); 
   
  d2:=b*b-4*a*c;
  Writeln('Delta wynosi : ',d2);
  
  if d2<0 then
    begin
      Writeln('Nie wykryto pierwiatsk�w r�wnania');
    end
  else if d2=0 then
    begin
      x:=-b/2*a;
      Writeln('Wykryto jeden podw pierwiastek x = ',x);
    end
  else
    begin
      d:=sqrt(d2);
      x1:=((-b -d)/2*a);
      x2:=((-b+d)/2*a);
      Writeln('Wykryto dwa pierwiastki :');
      Writeln('x1 = ',x1);
      Writeln('x2 = ',x2);
    end;
End.