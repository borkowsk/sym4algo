Program sumuj_zadane_modyfikacje; 
 

var 
   suma_dod,suma_ujemn:real; 
   ldod,lujem,z,wartosc,liczba:integer;

begin  
  suma_dod:=0; 
  suma_ujemn:=0;
  ldod:=0;
  lujem:=0; 
  writeln('Ile b�dzie liczb?'); 
  readln(liczba); 
  writeln('Podawaj warto�ci'); 
  for z:=1 to liczba do 
    begin 
      readln(wartosc); 
      if wartosc>=0 then
      begin
        suma_dod:=suma_dod+wartosc;
        ldod:=ldod+1;
        end
        else
        if wartosc<0 then
       begin
         suma_ujemn:=suma_ujemn+wartosc;
         lujem:=lujem+1;
      end;
      end;
writeln;       
writeln('Suma liczb dodatnich wynosi:',suma_dod);     
writeln('Ilo�� liczb dodatnich:' ,ldod);
        if ldod=0 then 
        begin
         ldod:=1
        end;
writeln('�rednia liczb dodatnich wynosi:',suma_dod/ldod);
writeln('Kwadrat �redniej liczb dodatnich:', sqr(suma_dod/ldod));
writeln('Pierwiastek �redniej liczb dodatnich:',sqrt(suma_dod/ldod));
writeln; 
writeln('Suma liczb ujemnych wynosi:',suma_ujemn); 
writeln('Ilo�� liczb ujemnych:' ,lujem);
        if lujem=0 then
        begin
         lujem:=1
        end;
writeln('Srednia liczb ujemych wynosi:', suma_ujemn/lujem);
writeln('Kwadrat �redniej liczb ujemnych:', sqr(suma_ujemn/lujem));
writeln('Pierwiastek �redniej liczb ujemnych:'  ,('NIE ISTNIEJE TAKI PIERWIASTEK:)'));

end.