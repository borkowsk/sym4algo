Program Wybieranie1; 

var 
   c:char; 

begin 
  writeln('Podawaj znaki z klawiatury (q-wyj�cie):'); 
  repeat 
    read(c); 
    case c of 
      'a':
        writeln('Ma�a litera a'); 
      'b','c','d','e','f','g','h','i': 
        writeln('Inna ma�a litera'); 
      'z':
        writeln('Ma�a litera z'); 
      'A':
        writeln('Wielka litera A'); 
      'Z':
        writeln('Wielka litera Z'); 
      'q','Q':
        writeln('Ko�czymy'); 
    else 
      writeln('Co� innego...'); 
    end; 
  until UpperCase(c)='Q'; 
end.
