Program hwork1 ; 

var 
   sumaplus,sumaminus,warto��,a,b:real; 
   x,y,z,liczba:integer; 

begin 
  sumaplus:=0; 
  sumaminus:=0; 
  x:=0; 
  y:=0; 
  writeln('Ile bedzie liczb '); 
  readln(liczba); 
  writeln ('podawaj warto�ci '); 
  for z:=1 to liczba do 
    begin 
      readln(warto��); 
      if warto��>0 then 
        sumaplus:=sumaplus+warto��; 
      if warto��>0 then 
        x:=x+1; 
      if warto��<0 then 
        sumaminus:=sumaminus+warto�� ; 
      if warto��<0 then 
        y:=y+1; 
    end; 
  begin 
    writeln; 
    writeln ('LICZBY DODATNIE'); 
    writeln('suma wynosi ',sumaplus); 
    writeln ('�rednia wynosi ',sumaplus/x); 
    a:=sumaplus/x; 
    writeln ('Kwadrat �redniej wynosi ',sqr (a) ); 
    writeln ('Pierwiastek �redniej wynosi ',sqrt (a) ); 
  end; 
  begin 
    writeln; 
    writeln ('LICZBY UJEMNE'); 
    writeln('suma wynosi ',sumaminus); 
    writeln ('�rednia wynosi ',sumaminus/y); 
    b:=sumaminus/y; 
    writeln ('Kwadrat �redniej wynosi ',sqr (b) ); 
    writeln ('Dla liczb ujemnych nie na pierwiastka �redniej' ); 
  end; 
end.

