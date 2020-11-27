program sumowanie; 


function kwadrat(x:real):real; 

begin 
  kwadrat:=x*x; 
end; 

var 
   sum1,sum2,sum3,w,x,y: real; 
   z,l,licz1,licz2:integer; 

begin 
  sum1:=0; 
  sum2:=0; 
  sum3:=0; 
  licz1:=0; 
  licz2:=0; 
  writeln('ile będize liczb:'); 
  readln(l); 
  writeln('podawaj wartości'); 
  for z:=1 to l do 
    begin 
      readln(w); 
      if w>0 then 
        begin 
          Sum1 := sum1 + w; 
          licz1:=licz1+1; 
        end; 
      if w<0 then 
        begin 
          Sum2 := sum2 + w; 
          licz2:=licz2+1; 
        end; 
      if w=0 then 
        sum3:= sum3+1; 
    end; 
  if l>0 then 
    begin 
      if licz1>0 then 
        begin 
          x:=sum1/licz1; 
          writeln ('Dla liczb Dodatnich:'); 
          writeln ('Wystąpiło ',licz1,' liczb dodatnich'); 
          writeln ('suma = ',sum1); 
          writeln ('Średnia = ',x); 
          writeln ('kwadrat średniej= ',kwadrat(x)); 
          writeln ('pierwiastek średniej= ',sqrt(x)); 
        end 
      else 
        writeln ('Nie ma liczb dodatnich'); 
      if licz2>0 then 
        begin 
          y:=sum2/licz2; 
          writeln (''); 
          writeln ('Dla liczb Ujemnych:'); 
          writeln ('Wystąpiło ',licz2,' liczb ujemnych'); 
          writeln ('suma = ',sum2); 
          writeln ('Średnia = ',y); 
          writeln ('kwadrat średniej= ',kwadrat(y)); 
          writeln ('pierwiastek średniej nie występuje'); 
        end 
      else 
        writeln ('Nie ma liczb ujemnych'); 
    end; 
  writeln (''); 
  writeln('Zero wystąpiło ',sum3,' razy'); 
end.
