program sumowanie; 

var 
   i:integer; 

   var 
   suma,liczba:real; 

begin 
  liczba:=1; 
  suma:=0; 
  i:=1; 
  writeln(' Witaj w programie do sumowania kolejnych liczb. '); 
  writeln('-------------------------------------------------'); 
  while liczba<>0 do 
    begin 
      write('Podaj ',i,' liczbe do zsumowania (0 - koniec sumowania) : '); 
      readln(liczba); 
      suma:=suma+liczba; 
      i:=i+1; 
    end; 
  write('Wynik jest rowny : ',suma); 
end.