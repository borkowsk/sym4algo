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
  writeln('Ile b�dzie liczb?'); 
  readln(liczba); 
  writeln('Podaj wybrane warto�ci:'); 
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
      writeln('By�o ',pluscounter,' dodatnich warto�ci'); 
      writeln('By�o ',minuscounter,' ujemnych warto�ci'); 
      if pluscounter>0 then 
        writeln('Suma liczb dodatnich wynosi: ',sumaplus) 
      else 
        writeln('Nie uda�o si� obliczy� sumy liczb dodatnich'); 
      if minuscounter>0 then 
        writeln('Suma liczb ujemnych wynosi: ',sumaminus) 
      else 
        writeln('Nie uda�o si� obliczy� sumy liczb ujemnych'); 
      if pluscounter > 0 then 
        writeln('�rednia liczb dodatnich wynosi: ',sumaplus/pluscounter) 
      else 
        writeln('Nie uda�o sie obliczy� �redniej liczb dodatnich'); 
      if minuscounter > 0 then 
        writeln('�rednia liczb ujemnych wynosi: ',sumaminus/minuscounter) 
      else 
        writeln('Nie uda�o si� obliczy� �redniej liczb ujemnych'); 
      if pluscounter>0 then 
        writeln('Kwadrat �redniej liczb dodatnich wynosi: ',(sumaplus/pluscounter)*(sumaplus/pluscounter)) 
      else 
        writeln('Nie uda�o si� obliczy� kwadratu liczb dodatnich'); 
      if minuscounter>0 then 
        writeln('Kwadrat �redniej liczb ujemnych wynosi: ',(sumaminus/minuscounter)*(sumaminus/minuscounter)) 
      else 
        writeln('Nie uda�o si� obliczy� kwadratu liczb ujemnych'); 
      if pluscounter>0 then 
        writeln('Pierwiastek �redniej liczb dodatnich wynosi: ',sqrt((sumaplus/pluscounter))) 
      else 
        writeln('Nie uda�o si� obliczy� pierwiastka liczb dodatnich'); 
      writeln('Nie uda�o si� obliczy� pierwiastka liczby ujemnej'); 
    end; 
end.