Program pr_dom_1; 
 
var 
   y,suma_dodat, suma_ujem,srednia_dodat,srednia_ujem:real; 
   x,i,ujem,dodat:integer; 
 
Begin 
  suma_dodat:=0; 
  suma_ujem:=0; 
  dodat:=0; 
  ujem:=0; 
  writeln('Napisz ile bêdzie liczb i naciœnij Enter '); 
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
      writeln('Œednia liczb dodatnich wynosi: ', srednia_dodat); 
      writeln('Kwadrat œredniej liczb dodatnich wynosi: ', sqr(srednia_dodat)); 
      writeln('Pierwiastek œredniej liczb dodatnich wynosi: ', sqrt(srednia_dodat)); 
      end;
      if ujem>0 then
      begin
      srednia_ujem:=suma_ujem/ujem;
      writeln('Suma liczb ujemnych wynosi: ', suma_ujem); 
      writeln('Œrednia liczb ujemnych wynosi: ', srednia_ujem); 
      writeln('Kwadrat œredniej liczb ujemnych wynosi: ', sqr(srednia_ujem)); 
      writeln('Z liczby ujemnej nie mo¿na wyci¹gnæ pierwiastka!'); 
      end;
    end 
  else 
    writeln('Wybierz co najmniej jedn¹ liczbê!'); 
end.