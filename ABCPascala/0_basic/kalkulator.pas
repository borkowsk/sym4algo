Program Kalkulator; 

var
   liczba1, liczba2:real; 
   c,spacja:char; 

begin 
  writeln('TO JEST MINI KALKULATOR - DZIA£A DO PIERWSZEGO B£ÊDU :)'); 
  repeat 
    writeln('Podaj liczbê, znak operacji i drug¹ liczbê (w jednej linii oddzielone pojedynczymi spacjami):');
    read(liczba1); 
    read(spacja);   
    read(c);
    read(spacja);   
    readln(liczba2); 
    case c of 
    '+':writeln(liczba1+liczba2);
    '-':writeln(liczba1-liczba2);
    '*':writeln(liczba1*liczba2);
    '/':writeln(liczba1/liczba2);
    else 
      writeln('Nieznana operacja:',c); 
    end; 
  until false; 
end.
