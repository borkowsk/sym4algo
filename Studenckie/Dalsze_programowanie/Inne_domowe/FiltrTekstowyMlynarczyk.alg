Program NoSpace;
{Wycinanie nadmiarowych spacji}
var
  we,wy:text;
  prev,c:char;
  nazwa:string;
  ile:integer;

Begin
  ile:=0;
  prev:=' ';
  writeln('Podaj nazwê pliku wejœciowego:');
  readln(nazwa);
  Assign(we,nazwa);
  Reset(we);
  writeln('Podaj nazwê pliku wyjœciowego:');
  readln(nazwa);
  Assign(wy,nazwa);
  Rewrite(wy);
  writeln('------------------------------');
  while not eof(we) do
  begin
    read(we,c);
    if(not((prev=' ')and(c=' ')))then
      write(wy,c)
    else
      ile:=ile+1;
    prev:=c;
  end;
  Close(we);
  Close(wy);
  writeln('Wyciêto ',ile,' spacji.');
end.