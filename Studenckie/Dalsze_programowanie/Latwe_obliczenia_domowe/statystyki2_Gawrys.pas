PROGRAM Statystyki;

{created by Ania Gawryœ}

CONST
      koniec=-1234567; 

VAR
      Suma1,Suma2,d:real;  
      b1,b2,b3:integer;
      

BEGIN
  Font(15,0,600 );
  writeln ('Program "Statystyki"');
 
 Font (8,0,0);
  writeln ('');
  writeln ('');
  TextColor( 17,62,124 );
  writeln ('Program dzieli podane liczby na dodatnie, ujemne i zera ');
  writeln ('a nastêpnie oblicza sumê, iloœæ danych liczb oraz œredni¹ arytmetyczn¹');
  writeln ('w poszczególnej grupie.');
  writeln;
  writeln ('Aby zakoñczyæ program i zobaczyæ jego wynik podaj wartoœæ "-1234567".');
  writeln ('Wartoœæ "-1234567" nie jest brana pod uwagê w obliczeniach.');
  writeln ('');
  writeln ('');

  Suma1:=0;
  Suma2:=0;
  TextColor( 0,0,0 );
  b1:=0;
  b2:=0;
  b3:=0;
     REPEAT
       writeln ('Podaj liczbê: ');
       readln (d);
         if d>0 then
          begin
          Suma1:=Suma1+d;
          b1:=b1+1;
          end;

         if d<0 then
          begin
          Suma2:=Suma2+d;
          b2:=b2+1;
          end;

         if d=0 then
          begin
          b3:=b3+1;
          end;

       UNTIL
         d=koniec;
           writeln ('');
           TextColor( 17,62,124 );
           writeln ('Poda³eœ wartoœæ "-1234567", która koñczy program.');
           writeln;

  writeln ('OBLICZENIA DLA LICZB DODATNICH'); 
    if b1>0 then
      begin
        writeln ('Iloœæ podanych liczb dodatnich: ',b1,'.');
        writeln ('Suma podanych liczb wynosi: ',Suma1);
        writeln ('czyli: ',Suma1:8:4,'.');
        writeln ('Suma arytmetyczna wynosi: ',Suma1/b1);
        writeln;
      end
    else 
      begin
        writeln ('Nie podano liczb dodatnich.');
        writeln;
      end;

  writeln ('OBLICZENIA DLA LICZB UJEMNYCH');
    if b2>1 then
      begin
        writeln ('Iloœæ podanych liczb ujemnych: ',b2-1,'.');
        writeln ('Suma podanych liczb wynosi: ',Suma2+1234567);
        writeln ('czyli: ',Suma2+1234567:8:4,'.');
        writeln ('Suma arytmetyczna wynosi: ',(Suma2+1234567)/(b2-1));
        writeln;
      end
  
     else
       begin
          writeln ('Nie podano liczb ujemnych.');
          writeln;
       end;
  
     writeln ('Iloœæ podanych zer: ',b3,'.');

END.