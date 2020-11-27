Program praca_domowa_2; 

var 
   sumaminus,sumaplus,wartosc:real; 
   z,liczba,minuscounter,pluscounter 
   {sumaminus,sumaplus,wartosc}:integer; 

begin 
  sumaminus:=0; 
  sumaplus:=0; 
  minuscounter:=0; 
  pluscounter:=0; 
  writeln('Ile bêdzie liczb?'); 
  readln(liczba); 
  writeln('Podaj wybrane wartoœci:'); 
  for z:=1 to liczba do 
    begin 
      readln(wartosc); 
      if wartosc <0 then 
        begin 
          sumaminus:=sumaminus+wartosc; 
          minuscounter:=minuscounter+1; 
        end 
      else 
        begin 
          sumaplus:=sumaplus+wartosc; 
          pluscounter:=pluscounter+1; 
        end; 
    end; 
  if liczba>0 then 
    begin 
      writeln('By³o ',pluscounter,' dodatnich wartoœci'); 
      writeln('By³o ',minuscounter,' ujemnych wartoœci'); 
      if pluscounter>0 then 
        writeln('Suma liczb dodatnich wynosi: ',sumaplus) 
      else 
        writeln('Nie uda³o siê obliczyæ sumy liczb dodatnich'); 
      if minuscounter>0 then 
        writeln('Suma liczb ujemnych wynosi: ',sumaminus) 
      else 
        writeln('Nie uda³o siê obliczyæ sumy liczb ujemnych'); 
      if pluscounter > 0 then 
        writeln('Œrednia liczb dodatnich wynosi: ',sumaplus/pluscounter) 
      else 
        writeln('Nie uda³o sie obliczyæ œredniej liczb dodatnich'); 
      if minuscounter > 0 then 
        writeln('Œrednia liczb ujemnych wynosi: ',sumaminus/minuscounter) 
      else 
        writeln('Nie uda³o siê obliczyæ œredniej liczb ujemnych'); 
      if pluscounter>0 then 
        writeln('Kwadrat œredniej liczb dodatnich wynosi: ',(sumaplus/pluscounter)*(sumaplus/pluscounter)) 
      else 
        writeln('Nie uda³o siê obliczyæ kwadratu liczb dodatnich'); 
      if minuscounter>0 then 
        writeln('Kwadrat œredniej liczb ujemnych wynosi: ',(sumaminus/minuscounter)*(sumaminus/minuscounter)) 
      else 
        writeln('Nie uda³o siê obliczyæ kwadratu liczb ujemnych'); 
      if pluscounter>0 then 
        writeln('Pierwiastek œredniej liczb dodatnich wynosi: ',sqrt((sumaplus/pluscounter))) 
      else 
        writeln('Nie uda³o siê obliczyæ pierwiastka liczb dodatnich'); 
      writeln('Nie uda³o siê obliczyæ pierwiastka liczby ujemnej'); 
    end; 
end.