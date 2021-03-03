Program suma;



Var

 dodsuma,ujesuma,wartosc: real;
 a, liczba, dodliczba, ujeliczba: integer;


Begin

 dodsuma:=0;
 ujesuma:=0;
 dodliczba:=0;
 ujeliczba:=0;

 writeln('Podaj iloœæ liczb ');

 readln(liczba);

 writeln('Podaj wartosci ');

     for a:=1 to liczba do

     begin

     readln(wartosc);

     if wartosc>-1 then dodsuma:=dodsuma+wartosc;
     if wartosc>-1 then dodliczba:=dodliczba+1;

     if wartosc<0 then ujesuma:=ujesuma+wartosc;

     if wartosc<0 then ujeliczba:=ujeliczba+1;

     end;

 Writeln;

 Writeln('Iloœæ podanych liczb =',liczba);

 Writeln;

 writeln('Liczb dodatnich =',dodliczba);

 writeln('Liczb ujemnych =',ujeliczba);

 Writeln;

 Writeln('Suma dla liczb dodatnich =',dodsuma);

 Writeln('Suma dla liczb ujemnych =',ujesuma);

 Writeln;

 Writeln('Srednia dla liczb dodatnich wynosi',dodsuma/liczba);

 Writeln('Srednia dla liczb ujemnych wynosi',ujesuma/liczba);

 Writeln;

 Writeln('Kwadrat  sredniej liczb dodatnich wynosi',((dodsuma/liczba)*(dodsuma/liczba)));

 Writeln('Kwadrat sredniej liczb ujemnych wynosi',((ujesuma/liczba)*(ujesuma/liczba)));

 Writeln;

 Writeln('Pierwiastek ze sredniej wynosi', (sqrt(dodsuma/liczba)));

  Writeln('Pierwiastek z liczb ujemnych nie istnieje :)');

end.