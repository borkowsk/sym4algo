program DeltaProceduralnie; 

type 
   wynikowa=array[1..2] of real; 

procedure RownKw(a,b,c:real;var n:integer;var x:wynikowa); 

var 
   delta:real; 
begin 
  delta:=b*b-4*a*c; 
  If delta>0 then 
    begin 
      x[1]:=(-b-sqrt(delta))/2*a; 
      x[2]:=(-b+sqrt(delta))/2*a; 
      n:=2; 
    end 
  else 
    begin 
      If delta=0 then 
        begin 
          x[1]:=-b/2*a; 
          x[2]:=x[1]; 
          n:=1; 
        end 
      else 
        begin 
          n:=0; 
        end; 
    end; 
end; 

var 
   a,b,c:real; 
   ileP,i:integer; 
   pierwiastki:wynikowa; 

begin 
  writeln('Podaj parametry równania kwadratowego:'); 
  writeln('a?'); 
  readln(a); 
  writeln('b?'); 
  readln(b); 
  writeln('c?'); 
  readln(c); 
  writeln('czyli: y=',a,'x^2+',b,'x+',c); 
  RownKw(a,b,c,ileP,pierwiastki); 
  writeln('ma pierwiastków ',ileP,' :'); 
  for i:=1 to ileP do 
    writeln(pierwiastki[i]); 
end.
