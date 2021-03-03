program filtr;
var
plik:text;
a,c,g:char;
nazwa:string;

Begin
a:='s';
c:='s';
writeln('Podaj nazwê pliku do wypisania:');
readln(nazwa);
Assign(plik,nazwa);
Reset(plik);
while not eof(plik) do
begin
a:=c;
read(plik,c);
g:=c;
if (c=' ') and (a=' ') then g:=chr(0);
write(g);
end;
close(plik);
end.
