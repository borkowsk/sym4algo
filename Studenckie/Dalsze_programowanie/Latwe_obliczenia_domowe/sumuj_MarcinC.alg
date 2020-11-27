Program Sumuj_zadane; 

var 
   LiczbaWartosciPlus,LiczbaWartosciMinus,SumaPlus,SumaMinus,Wartosc:real; 
   z,Liczba:integer; 

begin 
  SumaPlus:=0; 
  SumaMinus:=0; 
  LiczbaWartosciPlus:=0; 
  LiczbaWartosciMinus:=0; 
  writeln('Ile bedzie liczb?'); 
  readln(Liczba); 
  writeln('Podawaj wartosci '); 
  for z:=1 to Liczba do 
    begin 
      readln(Wartosc); 
      if Wartosc>=0 then 
        begin 
          LiczbaWartosciPlus:=LiczbaWartosciPlus+1; 
          SumaPlus:=SumaPlus+Wartosc; 
        end 
      else 
        begin 
          LiczbaWartosciMinus:=LiczbaWartosciMinus+1; 
          SumaMinus:=SumaMinus+Wartosc; 
        end 
    end; 
  if Liczba>0 then 
    begin 
      writeln('Dla liczb dodatnich'); 
      writeln('Liczba wartosci wynosi ',LiczbaWartosciPlus:6:6); 
      if LiczbaWartosciPlus>0 then 
        begin 
          writeln('Suma wynosi ',SumaPlus:6:6); 
          writeln('Srednia wynosi ',SumaPlus/LiczbaWartosciPlus:6:6); 
          writeln('Kwadrat sredniej wynosi ',sqr(SumaPlus/LiczbaWartosciPlus):6:6); 
          writeln('Pierwiastek sredniej wynosi ',sqrt(SumaPlus/LiczbaWartosciPlus):6:6); 
        end 
      else 
        begin 
writeln('Brak wartoœci do okreœlenia sumy, œredniej, kwadratu i pierwiastka'); 
        end; 
      writeln('Dla liczb ujemnych'); 
      writeln('Liczba wartosci wynosi ',LiczbaWartosciMinus:6:6); 
      if LiczbaWartosciMinus>0 then 
        begin 
          writeln('Suma wynosi ',SumaMinus:6:6); 
          writeln('Srednia wynosi ',SumaMinus/LiczbaWartosciMinus:6:6); 
          writeln('Kwadrat sredniej wynosi ',sqr(SumaMinus/LiczbaWartosciMinus):6:6); 
        end 
      else 
        begin 
          writeln('Brak wartoœci do okreœlenia sumy, œredniej i kwadratu'); 
        end; 
      writeln('Pierwiastek sredniej liczb ujemnych jest niemo¿liwy'); 
    end 
  else 
    begin 
      writeln('nie mam liczb do obróbki') 
    end; 
end.