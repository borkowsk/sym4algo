program suma_dodatnich_i_ujemnych; 


function kwadrat_sredniej(x:real):real; 

begin 
  kwadrat_sredniej:=x*x; 
end; 

var 
   d:integer; 
   ilosc:integer; 
   liczba1:integer; 
   liczba2:integer; 
   suma1: real; 
   suma2: real; 
   suma3: real; 
   a: real; 
   b: real; 
   c: real; 

begin 
  liczba1:=0; 
  liczba2:=0; 
  suma1:=0; 
  suma2:=0; 
  suma3:=0; 
  writeln('podaj ilosc liczb:'); 
  readln(ilosc); 
  writeln('podawaj liczby'); 
  for d:=1 to ilosc do 
    begin 
      readln(a); 
      if a>0 then 
        begin 
          Suma1 := suma1 + a; 
          liczba1:=liczba1+1; 
        end; 
      if a<0 then 
        begin 
          Suma2 := suma2 + a; 
          liczba2:=liczba2+1; 
        end; 
      if a=0 then 
        suma3:= suma3+1; 
    end; 
  if ilosc>0 then 
    begin 
      if liczba1>0 then 
        begin 
          b:=suma1/liczba1; 
          writeln (' liczb dodatnich:'); 
          writeln ('pojawi�o si� liczb  ',liczba1 ); 
          writeln ('suma jest r�wna ',suma1); 
          writeln ('�rednia jest r�wna ',b); 
          writeln ('kwadrat �redniej jest r�wny ',kwadrat_sredniej(b)); 
          writeln ('pierwiastek �redniej jest r�wny ',sqrt(b)); 
        end 
      else 
        writeln ('brak liczb dodatnich'); 
      if liczba2>0 then 
        begin 
          c:=suma2/liczba2; 
          writeln ('liczb Ujemnych:'); 
          writeln ('pojawi�o si� liczb ',liczba2); 
          writeln ('suma jest r�wna ',suma2); 
          writeln ('�rednia jest r�wna ',c); 
          writeln ('kwadrat �redniej jest r�wny ',kwadrat_sredniej(c)); 
          writeln ('pierwiastek �redniej jest r�wny'); 
        end 
      else 
        writeln ('Nie ma liczb ujemnych'); 
    end; 
end.