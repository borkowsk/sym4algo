Program UsuwanieSpacji;
{Program usuwa powt�rzenia spacji w okre�lonym pliku}
var
   plik1, plik2:text;
   liczbaSpacji:integer;
   c:char;
   plikWejsciowy, plikWyjsciowy:string;
Begin
   writeln('Podaj nazw� pliku wejsciowego:');
   readln(plikWejsciowy);
   writeln('Podaj nazw� pliku wyjsciowego:');
   readln(plikWyjsciowy);
   
   Assign(plik1,plikWejsciowy);
   Reset(plik1);
   
   Assign(plik2, plikWyjsciowy);
   Rewrite(plik2);
   
   liczbaSpacji:=0;
   while not eof(plik1) do
   begin
      read(plik1,c);
      if c=' ' then
         liczbaSpacji:=liczbaSpacji+1
      else
         liczbaSpacji:=0;
      if liczbaSpacji <= 1 then
         write(plik2,c);
   end;
   Close(plik1);
   Close(plik2);
end.