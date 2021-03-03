Program Delta; 
    var a,b,c,delta:integer;
        x0,x1,x2:real;

begin
{program Ani Gawryœ}
  
writeln ('PROGRAM "DELTA"');

  writeln ('Program oblicza miejsca zerowe w równaniu kwadratowym y=ax2+bx+c.');
  writeln ('Aby to zrobiæ musisz podaæ wartoœci: a, b i c.');
  writeln ('');

    write ('Podaj wartoœæ a: ');
    readln (a);

    write ('Podaj wartoœæ b: ');
    readln (b);

    write ('Podaj wartoœæ c: ');
    readln (c);
  
  
  writeln ('');
  writeln ('');

  delta:=sqr(b)-4*a*c;
  writeln ('Delta wynosi: ',delta);
  writeln ('');

IF delta=0 THEN
   begin
      Writeln ('Równanie kwadratowe dla podanych wartoœci ma jedno miejsce zerowe.');
      Writeln ('');
      x0:=-b/(2*a);
      Writeln ('Miejsce zerowe wynosi: ',x0:8:4);
            
   end;

IF delta<0 THEN
    begin
      Writeln ('"Delta" jest mniejsza od zera.');
      Writeln ('');
      Writeln ('Równanie kwadratowe nie ma miejsc zerowych.');
   end;
   
IF delta>0 THEN
    begin
      Writeln ('"Delta" jest wiêksza od zera.');
      Writeln ('Równanie kwadratowe dla podanej wartoœci ma 2 miejsca zerowe.');
      Writeln ('');
      x1:=(-b-(sqrt(delta)))/(2*a);
      x2:=(-b+(sqrt(delta)))/(2*a);
      Writeln ('Pierwsze miejsce zerowe wynosi: ',x1:8:4);
      Writeln ('Drugie miejsce zerowe wynosi: ',x2:8:4);
      
    end;
end.