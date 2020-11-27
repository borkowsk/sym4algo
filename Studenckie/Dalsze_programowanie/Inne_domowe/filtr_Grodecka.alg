program filtr; 

var 
   plikwej,plikwyj:text; 
   wej,wyj:string; 
   wiersz,wiersz1:char; 

begin 
  writeln('Podaj nazwe pliku wejsciowego: '); 
  readln(wej); 
  assign(plikwej,wej); 
  reset(plikwej); 
  writeln('Podaj nazawe pliku wyjœciowego: '); 
  readln(wyj); 
  assign(plikwyj,wyj); 
  rewrite(plikwyj); 
  repeat 
    begin 
      read(plikwej,wiersz); 
      write(wiersz);{DEBUG}
      if wiersz<>' 'then 
        write(plikwyj,wiersz) 
      else 
        if wiersz1<>wiersz then 
          write(plikwyj,wiersz); 
      wiersz1:=wiersz; 
    end; 
  until eof(plikwej); 
  close(plikwej); 
  close(plikwyj); 
end.
