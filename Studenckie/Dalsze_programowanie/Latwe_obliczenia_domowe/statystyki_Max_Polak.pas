Program Statystyki;
var warto��,sumaUjem,sumaDodat:real;
   z,liczba,liczbaUjem,liczbaDodat,liczbaZer:integer;
begin
   sumaDodat:=0;
   sumaUjem:=0;
   liczbaDodat:=0;
   liczbaUjem:=0;
   liczbaZer:=0;
   writeln('Ile b�dzie liczb?');
   readln(liczba);
   writeln('Podawaj warto�ci ');
   for z:=1 to liczba do
   begin
      readln(warto��);
      if warto��>0 then
      begin
         sumaDodat:=sumaDodat+warto��;
         liczbaDodat:=liczbaDodat+1;
      end;
      if warto��<0 then
      begin
         sumaUjem:=sumaUjem+warto��;
         liczbaUjem:=liczbaUjem+1;
      end;
      if warto��=0 then
         liczbaZer:=liczbaZer+1;
   end;
      if liczbaDodat <> 0 then
      begin
         writeln('');      
         writeln('Statystyka dla liczb dodatnich: ');
         writeln('');
         writeln('wyst�pie�: ', liczbaDodat);
         writeln('suma: ', sumaDodat);
         writeln('�rednia arytmetyczna: ', sumaDodat/liczbaDodat);
      end
      else
      begin
         writeln('');      
         writeln('Nie podano �adnych liczb dodatnich');
      end;
      if liczbaUjem <> 0 then
      begin
         writeln('');      
         writeln('Statystyka dla liczb ujemnych: ');
         writeln('');       
         writeln('wyst�pie�: ', liczbaUjem);
         writeln('suma: ', sumaUjem);
         writeln('�rednia arytmetyczna: ', sumaUjem/liczbaUjem);   
      end
      else
      begin
         writeln('');      
         writeln('Nie podano �adnych liczb ujemnych');
      end;
      if liczbaZer <> 0 then
      begin
         writeln('');     
         writeln('');          
         writeln('Liczba zer: ', liczbaZer);
      end
      else
      begin
         writeln(''); 
         writeln(''); 
         writeln('Nie podano �adnych zer');
      end; 
end.      