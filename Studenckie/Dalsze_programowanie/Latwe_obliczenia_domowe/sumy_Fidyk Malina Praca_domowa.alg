Program pr_dom_1; 
 
var 
   y,suma_dodat, suma_ujem,srednia_dodat,srednia_ujem:real; 
   x,i,ujem,dodat:integer; 
 
Begin 
  suma_dodat:=0; 
  suma_ujem:=0; 
  dodat:=0; 
  ujem:=0; 
  writeln('Napisz ile b�dzie liczb i naci�nij Enter '); 
  readln(x) ; 
  if x<=0 then 
    writeln('Podaj liczbe dodatnia!') 
  else 
    begin 
      for i:=1 to x do 
        begin 
          writeln('Podaj kolejne liczby (zatwierdzaj przyciskiem Enter) '); 
          readln(y); 
          if y>=0 then 
            begin 
              suma_dodat:=suma_dodat+y; 
              dodat:=dodat+1; 
            end 
          else 
            begin 
              suma_ujem:=suma_ujem+y; 
              ujem:=ujem+1; 
            end; 
        end; 
    end; 
  if x>0 then 
    begin 
      if dodat>0 then
      begin
      srednia_dodat:=suma_dodat/dodat; 
      writeln('Suma liczb dodatnich wynosi: ', suma_dodat); 
      writeln('�ednia liczb dodatnich wynosi: ', srednia_dodat); 
      writeln('Kwadrat �redniej liczb dodatnich wynosi: ', sqr(srednia_dodat)); 
      writeln('Pierwiastek �redniej liczb dodatnich wynosi: ', sqrt(srednia_dodat)); 
      end;
      if ujem>0 then
      begin
      srednia_ujem:=suma_ujem/ujem;
      writeln('Suma liczb ujemnych wynosi: ', suma_ujem); 
      writeln('�rednia liczb ujemnych wynosi: ', srednia_ujem); 
      writeln('Kwadrat �redniej liczb ujemnych wynosi: ', sqr(srednia_ujem)); 
      writeln('Z liczby ujemnej nie mo�na wyci�gn� pierwiastka!'); 
      end;
    end 
  else 
    writeln('Wybierz co najmniej jedn� liczb�!'); 
end.