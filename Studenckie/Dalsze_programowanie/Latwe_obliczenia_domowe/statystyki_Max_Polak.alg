Program Statystyki;
var wartoœæ,sumaUjem,sumaDodat:real;
   z,liczba,liczbaUjem,liczbaDodat,liczbaZer:integer;
begin
   sumaDodat:=0;
   sumaUjem:=0;
   liczbaDodat:=0;
   liczbaUjem:=0;
   liczbaZer:=0;
   writeln('Ile bêdzie liczb?');
   readln(liczba);
   writeln('Podawaj wartoœci ');
   for z:=1 to liczba do
   begin
      readln(wartoœæ);
      if wartoœæ>0 then
      begin
         sumaDodat:=sumaDodat+wartoœæ;
         liczbaDodat:=liczbaDodat+1;
      end;
      if wartoœæ<0 then
      begin
         sumaUjem:=sumaUjem+wartoœæ;
         liczbaUjem:=liczbaUjem+1;
      end;
      if wartoœæ=0 then
         liczbaZer:=liczbaZer+1;
   end;
      if liczbaDodat <> 0 then
      begin
         writeln('');      
         writeln('Statystyka dla liczb dodatnich: ');
         writeln('');
         writeln('wyst¹pieñ: ', liczbaDodat);
         writeln('suma: ', sumaDodat);
         writeln('œrednia arytmetyczna: ', sumaDodat/liczbaDodat);
      end
      else
      begin
         writeln('');      
         writeln('Nie podano ¿adnych liczb dodatnich');
      end;
      if liczbaUjem <> 0 then
      begin
         writeln('');      
         writeln('Statystyka dla liczb ujemnych: ');
         writeln('');       
         writeln('wyst¹pieñ: ', liczbaUjem);
         writeln('suma: ', sumaUjem);
         writeln('œrednia arytmetyczna: ', sumaUjem/liczbaUjem);   
      end
      else
      begin
         writeln('');      
         writeln('Nie podano ¿adnych liczb ujemnych');
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
         writeln('Nie podano ¿adnych zer');
      end; 
end.      