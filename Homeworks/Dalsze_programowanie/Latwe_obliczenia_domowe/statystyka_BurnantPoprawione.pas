program Zabka_1; 
{uses crt;} 

type 
   tablica=array[1..100] of real; 
var 
   IloscElementow:integer; 
   tab:tablica; 

procedure WczytajDane(IloscElementow:integer;var tabl:tablica); 

var 
   i:integer; 
begin 
  for i:=1 to IloscElementow do 
    begin 
      write('Podaj ',i,' wartosc: '); 
      readln(tabl[i]); 
    end; 
end; 

procedure wypisz(IloscElementow:integer;var tabl:tablica); 

var 
   i:integer; 
begin 
  writeln('Podane przez Ciebie skladniki'); 
  writeln; 
  for i:=1 to IloscElementow do 
    begin 
      if (i mod 2)=0 then 
        begin 
          textcolor(70,100,100); 
          write(' ',tabl[i]:3:3); 
        end 
      else 
        begin 
          textcolor(255,255,255); 
          write(' ',tabl[i]:3:3); 
        end; 
    end; 
end; 

function LiczSumyDodatnich(IloscElementow:integer;var tabl:tablica):real; 

var 
   i:integer; 
   Suma:real; 
begin 
  Suma:=0; 
  for i:=1 to IloscElementow do 
    begin 
      if tabl[i]>0 then 
        begin 
          Suma := Suma + tabl[i]; 
        end; 
    end; 
  LiczSumyDodatnich:=Suma; 
end; 

function LiczSumyUjemnych(IloscElementow:integer;var tabl:tablica):real; 

var 
   i:integer; 
   Suma:real; 
begin 
  Suma:=0; 
  for i:=1 to IloscElementow do 
    begin 
      if tabl[i]<0 then 
        begin 
          Suma := Suma + tabl[i]; 
        end; 
    end; 
  LiczSumyUjemnych:=Suma; 
end; 

function LiczSumyCalosci(IloscElementow:integer;var tabl:tablica):real; 

var 
   i:integer; 
   Suma:real; 
begin 
  Suma:=0; 
  for i:=1 to IloscElementow do 
    begin 
      Suma := Suma + tabl[i]; 
    end; 
  LiczSumyCalosci:=Suma; 
end; 

function SredniaDodatnich(IloscElementow:integer;var tabl:tablica):real; 

var 
   i,Ile:integer; 
   Suma:real; 
begin 
  Suma:=0; 
  Ile:=0; 
  for i:=1 to IloscElementow do 
    begin 
      if tabl[i]>0 then 
        begin 
          Suma := Suma + tabl[i]; 
          ile:=ile+1; 
        end; 
    end; 
  if ile=0 then 
    begin 
      SredniaDodatnich:=0; 
    end 
  else 
    begin 
      SredniaDodatnich:=Suma/ile; 
    end; 
end; 

function SredniaUjemnych(IloscElementow:integer;var tabl:tablica):real; 

var 
   i,Ile:integer; 
   Suma:real; 
begin 
  Suma:=0; 
  Ile:=0; 
  for i:=1 to IloscElementow do 
    begin 
      if tabl[i]<0 then 
        begin 
          Suma := Suma + tabl[i]; 
          ile:=ile+1; 
        end; 
    end; 
  if ile=0 then 
    begin 
      SredniaUjemnych:=0; 
    end 
  else 
    begin 
      SredniaUjemnych:=Suma/ile; 
    end; 
end; 

function SredniaCalosci(IloscElementow:integer;var tabl:tablica):real; 

var 
   i:integer; 
   Suma:real; 
begin 
  Suma:=0; 
  for i:=1 to IloscElementow do 
    begin 
      Suma := Suma + tabl[i]; 
    end; 
  SredniaCalosci:=Suma/IloscElementow; 
end; 

function IleZer(IloscElementow:integer;var tabl:tablica):integer; 

var 
   i,ile:integer; 
begin 
  ile:=0; 
  for i:=0 to IloscElementow do 
    begin 
      if tabl[i]=0 then 
        ile:=ile+1; 
    end; 
  IleZer:=ile; 
end; 

begin 
  TextColor(0,255,0);Brush(1,0,0,0);Fill(1,1); 
  
  writeln('Program wykonala: '); 
  delay(100); 
  writeln('******      *     *****   *   *       *'); 
  delay(200); 
  writeln('    *      * *    *    *  *  *       * *'); 
  delay(200); 
  writeln(' ****     *****   ****    **        *****'); 
  delay(200); 
  writeln(' *       *     *  *    *  *  *     *     *'); 
  delay(200); 
  writeln('*****    *     *  *****   *    *   *     *'); 
  readln; 
  TextColor(0,255,0); 
  repeat 
   {clear;}
    write('Podaj ilosc elementow: '); 
    readln(IloscElementow); 
  until IloscElementow>0 ; 

  WczytajDane(IloscElementow,tab); 

  wypisz(IloscElementow,tab); 
  writeln; 
  writeln; 
  textcolor(0,255,0); 
  write('Suma Wszystkich skladnikow:  '); 
  TextColor(255,255,0); 
  writeln(LiczSumyCalosci(IloscElementow,tab):3:3); 
  if LiczSumyUjemnych(IloscElementow,tab)<>0 then 
    begin 
      TextColor(0,255,0); 
      write('Suma liczb ujemnych:        '); 
      TextColor(255,255,0); 
      writeln(LiczSumyUjemnych(IloscElementow,tab):3:3); 
    end 
  else 
    begin 
      TextColor(0,255,0); 
      write('Suma liczb ujemnych:         '); 
      TextColor(255,255,0); 
      writeln(LiczSumyUjemnych(IloscElementow,tab):3:3); 
    end; 
  TextColor(0,255,0); 
  write('Suma liczb dodatnich:        '); 
  TextColor(255,255,0); 
  writeln(LiczSumyDodatnich(IloscElementow,tab):3:3); 
  TextColor(0,255,0); 
  write('Srednia wszystkich liczb:    '); 
  TextColor(255,255,0); 
  writeln(SredniaCalosci(IloscElementow,tab):3:3); 
  TextColor(0,255,0); 
  write('Srednia liczb dodatnich:     '); 
  TextColor(255,255,0); 
  writeln(SredniaDodatnich(IloscElementow,tab):3:3); 
  if SredniaUjemnych(IloscElementow,tab)<>0 then 
    begin 
      TextColor(0,255,0); 
      write('Srednia liczb ujemnych:     '); 
      TextColor(255,255,0); 
      writeln(SredniaUjemnych(IloscElementow,tab):3:3); 
    end 
  else 
    begin 
      TextColor(0,255,0); 
      write('Srednia liczb ujemnych:      '); 
      TextColor(255,255,0); 
      writeln(SredniaUjemnych(IloscElementow,tab):3:3); 
    end; 
  TextColor(255,255,255); 
  writeln; 
  if IleZer(IloscElementow,tab)<>0 then 
    begin 
      if IleZer(IloscElementow,tab)=1 then 
        begin 
          write('W podanych skladnikach wystapilo'); 
          textcolor(255,0,0); 
          write(' ',IleZer(IloscElementow,tab)); 
          textColor(255,255,255); 
          write(' zero'); 
        end 
      else 
        begin 
          write('W podanych skladnikach wystapily'); 
          textcolor(255,0,0); 
          write(' ',IleZer(IloscElementow,tab)); 
          textColor(255,255,255); 
          write(' zera'); 
        end ; 
    end 
  else 
    begin 
      write('Nie wystapilo zadne zero w podanych skladnikach'); 
    end; 
  readln; 
end.
