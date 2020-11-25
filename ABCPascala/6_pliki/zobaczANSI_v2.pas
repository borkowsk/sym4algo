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
      { c:=uppercase(c);
       c:=lowercase(c);} 
      {if c=' ' then c:='_';} 
      {       if (c=chr(10))or(c=chr(13)) then c:=' ';} 
      if (c=chr(10)) then 
        c:=' '; 
      {      if c=' ' then c:=chr(13);} 
      write(c); 
      {      write(':',ord(c):3,' ');} 
    end; 
  Close(plik); 
end.
