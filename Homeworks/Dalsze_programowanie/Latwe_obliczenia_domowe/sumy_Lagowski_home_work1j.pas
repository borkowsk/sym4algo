Program hwork1 ; 

var 
   sumaplus,sumaminus,wartoœæ,a,b:real; 
   x,y,z,liczba:integer; 

begin 
  sumaplus:=0; 
  sumaminus:=0; 
  x:=0; 
  y:=0; 
  writeln('Ile bedzie liczb '); 
  readln(liczba); 
  writeln ('podawaj wartoœci '); 
  for z:=1 to liczba do 
    begin 
      readln(wartoœæ); 
      if wartoœæ>0 then 
        sumaplus:=sumaplus+wartoœæ; 
      if wartoœæ>0 then 
        x:=x+1; 
      if wartoœæ<0 then 
        sumaminus:=sumaminus+wartoœæ ; 
      if wartoœæ<0 then 
        y:=y+1; 
    end; 
  begin 
    writeln; 
    writeln ('LICZBY DODATNIE'); 
    writeln('suma wynosi ',sumaplus); 
    writeln ('œrednia wynosi ',sumaplus/x); 
    a:=sumaplus/x; 
    writeln ('Kwadrat œredniej wynosi ',sqr (a) ); 
    writeln ('Pierwiastek œredniej wynosi ',sqrt (a) ); 
  end; 
  begin 
    writeln; 
    writeln ('LICZBY UJEMNE'); 
    writeln('suma wynosi ',sumaminus); 
    writeln ('œrednia wynosi ',sumaminus/y); 
    b:=sumaminus/y; 
    writeln ('Kwadrat œredniej wynosi ',sqr (b) ); 
    writeln ('Dla liczb ujemnych nie na pierwiastka œredniej' ); 
  end; 
end.

