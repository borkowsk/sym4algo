program sumujacy; 

const 
   last=100; 
var 
   data:array[1..last] of real; 
   suma,suma1,value,n:real; 
   z,num,ile:integer; 

begin 
  writeln('ile bedzie liczb? Zakres: <1..',last,'>'); 
  readln(num); 
  writeln('podaj liczby:'); 
  for z:=1 to num do 
    begin 
      readln(value); 
      data[z]:=value; 
    end; 
  writeln; 
  begin 
    suma1:=0; 
    for z:=1 to num do 
      suma1:=suma1+data[z]; 
    writeln('Suma  wszytkich liczb wynosi: ',suma1); 
    writeln('Srednia wszystkich liczb wynosi: ', suma1/num); 
  end; 
  writeln; 
  begin 
    ile:=0; 
    suma:=0; 
    for z:=1 to num do 
      if (data[z]<0) then 
        ile:=ile+1; 
    if ile=0 then 
      writeln('brak liczb ujemnych') 
    else 
      writeln('ilosc liczb ujemnych:  ',ile); 
    writeln; 
    for z:=1 to num do 
      if (data[z]<0) then 
        suma:=suma+data[z]; 
    if suma=0 then 
      writeln 
    else 
      begin 
        writeln('Suma liczb ujemnych:  ',suma); 
        writeln('Srednia liczb ujemnych:  ',suma/ile); 
      end; 
  end; 
  writeln; 
  begin 
    ile:=0; 
    suma:=0; 
    for z:=1 to num do 
      if (data[z]>=0) then 
        ile:=ile+1; 
    if ile=0 then 
      writeln('brak liczb dodatnich') 
    else 
      writeln('ilosc liczb dodatnich:  ',ile); 
    writeln; 
    for z:=1 to num do 
      if (data[z]>=0) then 
        suma:=suma+data[z]; 
    if suma=0 then 
      writeln 
    else 
      begin 
        writeln('Suma liczb dodatnich:  ',suma); 
        writeln('Srednia liczb dodatnich:  ',suma/ile); 
      end; 
  end; 
  writeln; 
  begin 
    ile:=0; 
    for z:=1 to num do 
      if (data[z]=0) then 
        ile:=ile+1; 
    if ile=0 then 
      writeln('Brak zer') 
    else 
      writeln(' liczba zer :  ',ile); 
  end; 
  writeln; 
  begin 
    suma:=0; 
    n:=0; 
    for z:=1 to num do 
      begin 
        n:=(suma1/num)-data[z]; 
        n:=n*n; 
        suma:=suma+n; 
        if z=num then 
          writeln('Odchylenie standardowe = ',sqrt(suma/(num-1))); 
      end; 
  end; 
end.
