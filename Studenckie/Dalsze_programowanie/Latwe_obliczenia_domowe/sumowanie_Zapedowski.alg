Program Sumowanie; 
const nazwa='Program "Sumowanie", autor: Przemyslaw Zapedowski';Koniec=0;
var    Suma,Wartosc:real; 
Begin
Writeln(nazwa);
Writeln;
Suma:=0;
Writeln('Program "Sumowanie" sumuje liczby podane przez operatora.');
Writeln('Operator konczy dzialanie programu wprowadzajac wartosc "0", ktora jednak nie ma wplywu na ogolna wartosc sumy.');
Writeln;
Repeat
Writeln('Podaj Wartosc');
Readln(Wartosc); 
Suma:=Suma+Wartosc;
until
Wartosc=Koniec;
Writeln;
Writeln('Podana wartosc "0" koñczy program.');
Writeln;
Writeln('Suma wprowadzonych liczb wynosi: ',Suma,'.');
End.