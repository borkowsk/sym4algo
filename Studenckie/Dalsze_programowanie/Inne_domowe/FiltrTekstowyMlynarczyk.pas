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
  writeln('Podaj nazw� pliku wej�ciowego:');
  readln(nazwa);
  Assign(we,nazwa);
  Reset(we);
  writeln('Podaj nazw� pliku wyj�ciowego:');
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
  writeln('Wyci�to ',ile,' spacji.');
end.