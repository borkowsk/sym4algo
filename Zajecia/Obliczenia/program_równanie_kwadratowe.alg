program rownanie_kwadratowe;
 var 
    a, b, c : real; 
    delta : real;    
    x1, x2,x0 : real;  
         
  begin 
     writeln('Program rozwiazuje rownanie kwadratowe');  
     writeln('a*x^2 + b*x + c');  
     writeln; 
     write('Podaj wspolczynnik a: '); 
     readln(a);   
     write('Podaj wspolczynnik b: ');   
     readln(b);   
     write('Podaj wspolczynnik c: ');   
     readln(c);  
     writeln; 
      if a=0 then
         writeln('To jest r�wnanie liniowe..ten program takich nie rozwi�zuje :)');
     delta := sqr(b) - 4*a*c; 
      if delta >0 then
       begin
         x1 := (-b + sqrt(delta))/(2*a);  
         x2 := (-b - sqrt(delta))/(2*a); 
         writeln('Wykryto dwa pierwiastki-delta wi�ksza od 0');
         writeln;
         writeln('Pierwiastki:  ');  
         writeln;
         writeln('x1 = ', x1:12:4);   
         writeln('x2 = ', x2:12:4); 
       end
      else
      if delta=0  then
       begin
         x0:=(-b)/(2*a);
         writeln('wykryto jeden podw�jny pierwiastek- delta r�wna 0');
         writeln;
         writeln('Pierwiastek r�wnania: ');
         writeln;
         writeln('x0 = ', x0:12:4); 
       end
      else
      if delta <0 then
     writeln('Nie wykryto pierwiastk�w- delta mniejsza od 0')
 end.
  
   