Program plik; 

var 
   pierwszy,drugi:text; 
   c:char; 
   tekst,nazwa,nazwa2:string; 

procedure wyraz(nazwa,nazwa2:string); 

begin 
  assign(pierwszy,nazwa); 
  reset(pierwszy); 
  assign(drugi,nazwa2); 
  rewrite(drugi);{reset(drugi); }
  while not eof(pierwszy) do 
    begin 
      readln(pierwszy,tekst); 
      {........co z tym c?}
      if c>' ' then 
        c:=' '; 
      writeln(drugi,tekst); 
    end; 
  close(pierwszy); 
  close(drugi); 
end; 

begin 
  writeln('podaj nazwe pliku wejsciowego'); 
  readln(nazwa); 
  writeln('podaj nazwe pliku wyjsciowego'); 
  readln(nazwa2); 
  wyraz(nazwa,nazwa2); 
end.
