Program Trudne_Statystyki; {Program Ani Gawry�}
const Last=99;
var z,Num:integer;
    Tablica:array[1..Last] of real;
    Wartosc,Suma1,Suma2,STD,SA:real;
    b1,b2,b3:integer;

  FUNCTION Odchylenie:real;
    VAR c,d,SumaC:real;
    Begin
      c:=0;
      SumaC:=0;
      d:=0;
      for z:=1 to Num do
      begin
       c:=sqr(Tablica[z]-SA);
       SumaC:=SumaC+c;
       c:=0;
      end;
       d:=(Num*(Num-1));
       Odchylenie:=sqrt(SumaC/d);
    End;
    
  PROCEDURE SredniaArytmetyczna;
    Begin
     for z:=1 to Num do
      Begin
      SA:=SA+Tablica[z];
      end;
      SA:=SA/Num;
    end;  
      

  Begin
  Suma1:=0;
  Suma2:=0;
  b1:=0;
  b2:=0;
  b3:=0;
  STD:=0;
  SA:=0;
  TextColor(145,10,183);
  Font (12,0,800);
  writeln ('Witaj w programie Statystyki II');
  writeln;  
  TextColor(0,0,0);
  Font (8,0,400);
  writeln ('Program oblicza sum� i �redni� wszystkich podanych liczb, ');
  writeln ('sum� i �redni� liczb dodatnich i ujemnych, ilo�� zer oraz');
  writeln ('odchylenie standardowe.');
  writeln;
  writeln ('Ile podasz liczb? (maksymalna ilo�� to 99)');
  readln (Num);
  writeln ('Podaj liczby: ');

  for z:=1 to Num do
    begin
     readln (Wartosc);
     Tablica[z]:=Wartosc;
    end;

  for z:=1 to Num do
      begin
         if Tablica[z]>0 then
          begin
          Suma1:=Suma1+Tablica[z];
          b1:=b1+1;
          end;

         if Tablica[z]<0 then
          begin
          Suma2:=Suma2+Tablica[z];
          b2:=b2+1;
          end;

         if Tablica[z]=0 then
          begin
          b3:=b3+1;
          end;
      end;

    SredniaArytmetyczna;
    writeln;
    TextColor(145,10,183);
    writeln ('WYNIKI OBLICZE�: ');
    TextColor(0,0,0);
    writeln ('Suma wszystkich podanych liczb:' ,Suma1+Suma2:10:2);
    writeln ('�rednia arytmetyczna wszystkich podanych liczb: ',SA:10:2);
    writeln;

    TextColor(145,10,183);
    writeln ('OBLICZENIA DLA LICZB DODATNICH');
    if b1>0 then
      begin
        TextColor(0,0,0);
        writeln ('Ilo�� podanych liczb dodatnich: ',b1,'.');
        writeln ('Suma podanych liczb wynosi: ',Suma1:10:2);
        writeln ('Suma arytmetyczna wynosi: ',Suma1/b1:10:2);
        writeln;
      end
    else
      begin
        writeln ('Nie podano liczb dodatnich.');
        writeln;
      end;

    TextColor(145,10,183);
    writeln ('OBLICZENIA DLA LICZB UJEMNYCH');
      if b2>0 then
        begin
          TextColor(0,0,0);
          writeln ('Ilo�� podanych liczb ujemnych: ',b2,'.');
          writeln ('Suma podanych liczb wynosi: ',Suma2:10:2);
          writeln ('Suma arytmetyczna wynosi: ',Suma2/b2:10:2);
          writeln;
        end

      else
        begin
          writeln ('Nie podano liczb ujemnych.');
          writeln;
        end;

     TextColor(145,10,183);
     writeln ('Ilo�� podanych zer: ',b3,'.');
     writeln;
     STD:=Odchylenie;
     writeln ('Odchylenie standardowe wynosi: ',STD:10:4);

 end.
