PROGRAM trzy_zadania;

CONST
  x= 5;
  y= 7;

VAR
  wyb, a, b, c: real;
  
BEGIN
  wyb := 0;
  a:= (x+2)*3+1/(y-2*x);
  b:= ((1+x)*10)/(y*3);
  c:= 7*7-3/(x*y-1)+6*6;

  while wyb <> 4 
  do
  begin
    writeln('WYBIERZ ZADANIE DO ROZWI¥ZANIA:':40);
    writeln('x=5 y=7':27);
    writeln('');
    writeln('1--> (x+2)*3+1/(y-2*x)');
    writeln('2--> ((1+x)*10)/(y*3)');
    writeln('3--> 7*7-3/(x*y-1)+6*6');
    writeln('4--> koniec');
    writeln('');
    write('twój wybór:');
    read(wyb);
    if wyb=1 
      then 
      begin
      writeln('Obliczenia "na raty":  ',a:0:3);
      writeln('Obliczenie "(x+2)*3+1/(y-2*x)":  ', (x+2)*3+1/(y-2*x):0:3);
      end;
    if wyb=2 
      then
      begin
      writeln('Obliczenie "na raty":  ',b:0:3);
      writeln('Obliczenie "((1+x)*10)/(y*3)":  ', ((1+x)*10)/(y*3):0:3);
      end;
    if wyb=3 
      then 
      begin
      writeln('Obliczenie "na raty":  ',c:0:3);
      writeln('Obliczenie "7*7-3/(x*y-1)+6*6":  ', 7*7-3/(x*y-1)+6*6:0:3);
      end;
    writeln('');
    writeln('');
    writeln('');
  end;

END. 