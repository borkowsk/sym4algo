program dodatnie_ujemne; 

var 
   x,y,z, suma, usuma: integer; 
   srednia, usrednia: real; 

procedure dodatnie; 

begin 
  suma:= suma + x; 
  writeln('Podaj natepna liczb� '); 
  read(x); 
  y:= y+1; 
end; 

procedure ujemne; 

begin 
  usuma:= usuma + x; 
  writeln('Podaj nastepna liczb� '); 
  read(x); 
  z:= z+1; 
end; 

begin 
  x:= 0; 
  y:= 0; 
  z:= 0; 
  suma:= 0; 
  usuma:= 0; 
  srednia:= 0; 
  usrednia:= 0; 
  writeln ('Podaj liczb� '); 
  read(x); 
  while x <>0 do 
    if x > 0 then 
      dodatnie 
    else 
      ujemne; 
  if ((y = 0) and (z <>0)) then 
    begin 
      usrednia:= (usuma/z); 
      writeln('Suma dodawania liczb ujemnych to ',usuma); 
      writeln('�rednia liczb ujemnych wynosi ',usrednia); 
      writeln('Kwadratem �redniej liczb ujemnych jest warto�� ', sqr(usrednia)); 
      writeln('Nie mo�na policzy� pierwiastka �redniej liczb ujemnych.'); 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('Nie mo�na policzy� �redniej dla liczb dodatnich'); 
    end; 
  if ((z = 0) and (y <>0)) then 
    begin 
      srednia:= (suma/y); 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('�rednia liczb dodatnich wynosi ',srednia); 
      writeln('Kwadratem �redniej liczb dodatnich jest warto�� ', sqr(srednia)); 
      writeln('Pierwiastkiem �redniej liczb dodatnich jest warto�� ', sqrt(srednia)); 
      writeln('Suma dodawania liczb ujemnych to ',usuma); 
      writeln('Nie mo�na policzy� �redniej dla liczb ujemnych'); 
    end; 
  if ((y <> 0) and (z <> 0)) then 
    begin 
      usrednia:= (usuma/z); 
      srednia:= (suma/y); 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('�rednia liczb dodatnich wynosi ',srednia); 
      writeln('Kwadratem �redniej liczb dodatnich jest warto�� ', sqr(srednia)); 
      writeln('Pierwiastkiem �redniej liczb dodatnich jest warto�� ', sqrt(srednia)); 
      writeln('Suma dodawania liczb ujemnych to ',usuma); 
      writeln('�rednia liczb ujemnych wynosi ',usrednia); 
      writeln('Kwadratem �redniej liczb ujemnych jest warto�� ', sqr(usrednia)); 
      writeln('Nie mo�na obliczy� pierwiastka �redniej liczb ujemnych.'); 
    end; 
  if ((y = 0) and (z = 0)) then 
    begin 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('Nie mo�na policzy� �redniej dla liczb dodatnich'); 
      writeln('Suma dodawania liczb ujemnych to ',usuma); 
      writeln('Nie mo�na policzy� �redniej dla liczb ujemnych'); 
    end; 
end.