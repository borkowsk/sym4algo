program dodatnie_ujemne; 

var 
   x,y,z, suma, usuma: integer; 
   srednia, usrednia: real; 

procedure dodatnie; 

begin 
  suma:= suma + x; 
  writeln('Podaj natepna liczbê '); 
  read(x); 
  y:= y+1; 
end; 

procedure ujemne; 

begin 
  usuma:= usuma + x; 
  writeln('Podaj nastepna liczbê '); 
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
  writeln ('Podaj liczbê '); 
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
      writeln('Œrednia liczb ujemnych wynosi ',usrednia); 
      writeln('Kwadratem œredniej liczb ujemnych jest wartoœæ ', sqr(usrednia)); 
      writeln('Nie mo¿na policzyæ pierwiastka œredniej liczb ujemnych.'); 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('Nie mo¿na policzyæ œredniej dla liczb dodatnich'); 
    end; 
  if ((z = 0) and (y <>0)) then 
    begin 
      srednia:= (suma/y); 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('Œrednia liczb dodatnich wynosi ',srednia); 
      writeln('Kwadratem œredniej liczb dodatnich jest wartoœæ ', sqr(srednia)); 
      writeln('Pierwiastkiem œredniej liczb dodatnich jest wartoœæ ', sqrt(srednia)); 
      writeln('Suma dodawania liczb ujemnych to ',usuma); 
      writeln('Nie mo¿na policzyæ œredniej dla liczb ujemnych'); 
    end; 
  if ((y <> 0) and (z <> 0)) then 
    begin 
      usrednia:= (usuma/z); 
      srednia:= (suma/y); 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('Œrednia liczb dodatnich wynosi ',srednia); 
      writeln('Kwadratem œredniej liczb dodatnich jest wartoœæ ', sqr(srednia)); 
      writeln('Pierwiastkiem œredniej liczb dodatnich jest wartoœæ ', sqrt(srednia)); 
      writeln('Suma dodawania liczb ujemnych to ',usuma); 
      writeln('Œrednia liczb ujemnych wynosi ',usrednia); 
      writeln('Kwadratem œredniej liczb ujemnych jest wartoœæ ', sqr(usrednia)); 
      writeln('Nie mo¿na obliczyæ pierwiastka œredniej liczb ujemnych.'); 
    end; 
  if ((y = 0) and (z = 0)) then 
    begin 
      writeln('Suma dodawania liczb dodatnich to ',suma); 
      writeln('Nie mo¿na policzyæ œredniej dla liczb dodatnich'); 
      writeln('Suma dodawania liczb ujemnych to ',usuma); 
      writeln('Nie mo¿na policzyæ œredniej dla liczb ujemnych'); 
    end; 
end.