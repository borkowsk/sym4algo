Program CA_1D_pseudo_life; 
{$REALCOMPATIBILITY ON} 

const 
   Last=101;
   Krokow=60; 
var 
   Swiat:array[1..Last] of integer; 
   NowyS:array[1..Last] of integer; 
   krok:integer; 

procedure zeruj; 
{Wyzerowanie "Swiat"a aktualnego} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=0; 
end; 

procedure wypisz; 
{Wypisywanie na konsole} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    if Swiat[i]=0 then 
      write('_') 
    else 
      write('|'); 
end; 

procedure przepisz; 
{Przepisywanie z "NowyS"[wiat] na "Swiat" aktualny} 

var 
   i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=NowyS[i]; 
end; 

procedure zrob_krok; 
{W³asciwy krok modelu} 

var 
   i,j,k,q:integer; 
   {indeks lewej, œrodkowej i prawej komorki} 
   sas:integer; 
   a, b, c:integer; 
begin 
  for j:=1 to Last do 
    begin 
      sas:=0; 
      i:=j-2; 
      if i > 0 then 
        a := Swiat[i] 
      else 
        a := 0; 
        
      k:=j+1; 
      if k <= Last then 
        b := Swiat[k] 
      else 
        b := 0; 
        
      q:=j+3; 
      if q <= Last then 
        c := Swiat[q] 
      else 
        c := 0; 
      sas := a + b + c; 
      if sas=1 then 
        NowyS[j]:=1 
      else 
        if sas=2 then 
          begin 
            if j-1 > 0 then 
              NowyS[j-1] := 1; 
            NowyS[j] := 0; 
            if q <= Last then 
              NowyS[q] := 1; 
          end 
        else 
          if sas=3 then 
            begin 
              NowyS[j+1] := 1; 
              NowyS[j] := 0; 
              NowyS[j+2] := 0; 
            end 
          else 
            NowyS[j]:=0; 
    end; 
end; 

begin 
  Zeruj; 
  {¯eby nie komplikowaæ inicjacja w kodzie} 
  { Swiat[1]:=1; } 
  Swiat[(last+1) div 2]:=1; 
  writeln('Automat: Pole namiotowe o specyficznych preferencjach" w ',Last,' komorkach'); 
  for krok:=0 to Krokow do 
    begin 
      write(krok:3,') '); 
      wypisz; 
      writeln; 
      zrob_krok; 
      przepisz; 
    end; 
end.