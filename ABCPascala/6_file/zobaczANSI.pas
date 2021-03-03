Program ZobaczANSI; 
{Kody znaków z pliku tekstowego na konsole}
var 
   plik:text; 
   c:char; 
   nazwa:string; 

Begin 
  writeln('Podaj nazwê pliku do wypisania:'); 
  readln(nazwa); 
  Assign(plik,nazwa); 
  Reset(plik); 
  writeln('------------------------------');
  while not eof(plik) do 
    begin 
      read(plik,c); 
      write(c,':',ord(c):3,' '); 
    end; 
  Close(plik); 
end.
