Program Statystyki_trudniejsze;
const nazwa='Program "Statystyki(trudne)", autor: Przemyslaw Zapedowski.';
      Last=150;  
var 
    Data:array[1..Last] of real;
    Suma,SumaDodatnia,SumaUjemna,Wartosc,Odchylenie,Arytmetyczna:real;
    z,Liczba,IloscZer:integer;

 procedure SumaLiczb;
    begin
      for z:=1 to Liczba do
      begin
      Suma:=Suma+Data[z];
      end;             
    end;
    
 procedure SredniaArytmetyczna;   
    begin
      for z:=1 to Liczba do
      begin
      Arytmetyczna:=Suma/Liczba;
      end;             
    end;

  procedure Zera;   
    begin
      for z:=1 to Liczba do
      begin
      If Data[z]=0 then
        IloscZer:=IloscZer+1;
      end;             
    end;
    
  procedure LiczbyUjemne; 
    begin
     for z:=1 to Liczba do 
      if Data[z]<0 then
      begin
       SumaUjemna:=SumaUjemna+Data[z];
      end;
    end;
    
  procedure LiczbyDodatnie; 
    begin
     for z:=1 to Liczba do 
      if Data[z]>0 then
      begin
       SumaDodatnia:=SumaDodatnia+Data[z];
      end;
    end;    

  function OdchylenieStandardowe:real;
    var a,b,all_a:real;
    begin
      all_a:=0;
      b:=0;
      for z:=1 to Liczba do
      begin
       a:=sqr(Data[z]-Arytmetyczna);
       all_a:=all_a+a;
      end;
       b:=(Liczba-1);
       OdchylenieStandardowe:=sqrt(all_a/b);
    end;


begin
writeln(nazwa);
writeln;
Suma:=0; 
SumaDodatnia:=0;
SumaUjemna:=0;
IloscZer:=0;
Arytmetyczna:=0;
writeln('Ile chcesz podac liczb? (max. 150)');
readln(Liczba);
writeln;
writeln('Podaj wartosci:');
for z:=1 to Liczba do
begin 
read(Wartosc);
Data[z]:=Wartosc;
end;


writeln;
writeln;

SumaLiczb;
writeln ('Suma podanych liczb wynosi:',Suma:8:2);
SredniaArytmetyczna;
writeln ('Srednia arytmetyczna podanych liczb wynosi: ',Arytmetyczna:6:2);
Zera;
writeln ('Ilosc zer wynosi: ',IloscZer);
LiczbyUjemne;
writeln ('Suma liczb ujemnych wynosi: ',SumaUjemna:5:2);
LiczbyDodatnie;
writeln ('Suma liczb dodatnich wynosi: ',SumaDodatnia:5:2);
Odchylenie:=OdchylenieStandardowe;
writeln ('Odchylenie standardowe wynosi: ',Odchylenie:5:4);

end.
