Program FirstLine; 
{Wypisywanie pierwszej linii pliku tekstowego na konsole}
var 
   plik:text; 
   s:string; 
   nazwa:string; 

Begin 
  writeln('Podaj nazwê pliku do podejrzenia:'); 
  readln(nazwa); 
  
  Assign(plik,nazwa); 
  Reset(plik); 
  
  writeln('Pierwsza linia:');
  read(plik,s); 
  write(s); 
  
  Close(plik); 
end.
