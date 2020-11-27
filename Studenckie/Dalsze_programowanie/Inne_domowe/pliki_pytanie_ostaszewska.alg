Program ZadanieDomowe; 

var 
   plik:text; 
   plik2:text; 
   c:char; 
   wejscie, wyjscie:string; 

begin 
  writeln('Podaj nazwê pliku do wpisania:'); 
  readln(wejscie); 
  assign(plik,wejscie); 
  reset(plik); 
  writeln('-------------'); 
  writeln('Podaj nazwê pliku, w którym zapisaæ zmienione dane:'); 
  readln(wyjscie); 
  assign(plik2,wyjscie); 
  rewrite(plik2); 
  writeln('-------------'); 
  while not eof(plik) do 
    begin 
      read(plik,c); 
      { if (c='  ')or (c='   ')then 
        c:=' '; } 
      write(c); 
      write(plik2,c); 
    end; 
  close(plik); 
  close(plik2); 
end.
