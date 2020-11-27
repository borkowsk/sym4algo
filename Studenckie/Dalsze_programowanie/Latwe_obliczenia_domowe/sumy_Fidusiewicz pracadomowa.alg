Program sumuj_zadane; 

var 
   sumaminus, sumaplus, wartosc:real; 
   z, liczba, minuscounter, pluscounter 
   {, sumaminus, sumaplus, wartosc}:integer; 

begin 
  sumaminus:=0; 
  sumaplus:=0; 
  minuscounter:=0; 
  pluscounter:=0; 
  writeln('ile bedzie liczb?'); 
  readln(liczba); 
  writeln('podawaj wartosci '); 
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
      writeln('bylo ',pluscounter,' dodatnich wartosci'); 
      writeln('bylo ',minuscounter,' ujemnych wartosci'); 
      if pluscounter>0 then 
        writeln('suma liczb dodatnich wynosi ',sumaplus) 
      else 
        writeln('nie salo sie obliczyc sumy liczb dodatnich'); 
      if minuscounter>0 then 
        writeln('suma liczb ujemnych wynosi ',sumaminus) 
      else 
        writeln('nie dalo sie obliczyc sumy liczb ujemnych'); 
      if pluscounter > 0 then 
        writeln('srednia liczb dodatnich wynosi ',sumaplus/pluscounter) 
      else 
        writeln('nie dalo sie obliczyc sredniej liczb dodatnich'); 
      if minuscounter > 0 then 
        writeln('srednia liczb ujemnych wynosi ',sumaminus/minuscounter) 
      else 
        writeln('nie dalo sie obliczyc sredniej liczb ujemnych'); 
      if pluscounter>0 then 
        writeln('kwadrat sredniej liczb dodatnich wynosi ',(sumaplus/pluscounter)*(sumaplus/pluscounter)) 
      else 
        writeln('nie dalo sie obliczyc kwadratu liczb dodatnich'); 
      if minuscounter>0 then 
        writeln('kwadrat sredniej liczb ujemnych wynosi ',(sumaminus/minuscounter)*(sumaminus/minuscounter)) 
      else 
        writeln('nie dalo sie obliczyc kwadratu liczb ujemnych'); 
      if pluscounter>0 then 
        writeln('pierwiastek sredniej liczb dodatnich wynosi ',sqrt((sumaplus/pluscounter))) 
      else 
        writeln('nie dalo sie obliczyc pierwiastka liczb dodatnich'); 
        writeln('nie da sie obliczyc pierwiastka liczby ujemnej'); 
    end; 
end.