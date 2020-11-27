Program filtr;
var
plik,dok:text;
c:char;
nazwa,nazwa_pliku:string;
d,f:integer;
Begin
d:=0;
f:=0;
writeln('Nazwy plików prosze wpisywac z rozszezeniem ".txt"');
writeln;
writeln('Podaj nazwê pliku wejsciowego:');
write('-> ');
readln(nazwa);
Assign(plik,nazwa);
Reset(plik);
writeln('------------------------------');
writeln('Podaj nazwe pliku wyjsciowego: ');
write('-> ');
readln(nazwa_pliku);
Assign(dok,nazwa_pliku);
Rewrite(dok);
while not eof(plik) do
begin
read(plik,c);
         if c=' ' then
            begin
             d:=d+1; 
             if  d>=2 then
               begin   
               write('');
               end
             else
               write(dok,c);
            end
            else
           begin
            write(dok,c);
           d:=0;
           end;
end;
close(dok);
close(plik);
end.