Program Wybieranie1; 

var 
   c:char; 

begin 
  writeln('Podawaj znaki z klawiatury (q-wyjœcie):'); 
  repeat 
    read(c); 
    case c of 
      'a':
        writeln('Ma³a litera a'); 
      'b','c','d','e','f','g','h','i': 
        writeln('Inna ma³a litera'); 
      'z':
        writeln('Ma³a litera z'); 
      'A':
        writeln('Wielka litera A'); 
      'Z':
        writeln('Wielka litera Z'); 
      'q','Q':
        writeln('Koñczymy'); 
    else 
      writeln('Coœ innego...'); 
    end; 
  until UpperCase(c)='Q'; 
end.
