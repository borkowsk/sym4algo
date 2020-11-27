Program Dziel; 

var 
   suma,wartosc,i:integer; 
   z,zakres:integer; 
   liczba:integer; 

begin 
  Begin 
    suma:=0; 
    writeln ('ile bedzie liczb?'); 
    readln (liczba); 
    writeln ('podawaj wartosci'); 
    for z:=1 to liczba do 
      begin 
        readln(wartosc); 
        suma:=suma+wartosc; 
      end; 
    if liczba<>0 then 
      writeln ('œrednia wynosi ', suma/liczba); 
    writeln('Suma wynosi ',suma); 
    writeln ('Kwadrat œredniej wynosi ', sqr(suma/liczba)); 
    writeln ('Pierwiastek œrednie wynosi ', sqrt(suma/liczba)); 
  end; 
  begin 
    write('Dodatnie: '); 
    zakres:=wartosc; 
    for i:=1 to zakres do 
      begin 
        if i>0 then 
          write(i,','); 
      end; 
    writeln; 
    write('Ujemne: '); 
    for i:=1 to wartosc do 
      begin 
        if i<0 then 
          write(i,','); 
      end; 
  end;
end.