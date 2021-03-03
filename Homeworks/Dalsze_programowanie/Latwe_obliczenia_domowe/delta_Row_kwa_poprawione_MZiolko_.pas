program rownanie; 

var 
   a:real; 
   b:real; 
   c:real; 
   d:real; 
   x1:real; 
   x2:real; 
   x0:real; 

Begin 
  writeln ('podaj a'); 
  readln (a); 
  writeln ('podaj b'); 
  readln (b); 
  writeln ('podac c'); 
  readln (c); 
  d:=(b*b)-4*a*c ; 
  writeln (d); 
  If d>0 then 
    begin 
      x1:=(-b-sqrt(d))/(2*a) ; 
      x2:=(-b+sqrt(d))/(2*a) ; 
      writeln (x1:0:0 , 'oraz', x2:0:0) ; 
    end 
  else 
    begin 
      If d=0 then 
        begin 
          x0:=(-b)/(2*a); 
          writeln (x0:0:0); 
        end 
      else 
        writeln ('brak rozwiazania'); 
    end 
end.