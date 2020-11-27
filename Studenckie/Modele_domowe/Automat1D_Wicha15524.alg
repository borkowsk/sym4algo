Program Automat1D; 

Const 
   maksymalne=600; 
   makskroki=500; 
Var 
   komorki,kopia:array[1..maksymalne] of boolean; 
   statystyka:array[0..makskroki] of integer; 
   ilosc,zasada,kroki,poczatek,i,j,k,sprawdz,stan:integer; 
   zasadabin:string; 
   out:text; 
   rok,miesiac,dzien,godzina,minuta,sekunda:integer; 

Function potega(podstawa,wykladnia:real):real; 

begin 
  potega := Exp(wykladnia*Ln(podstawa)); 
end; 

Function sprawdzbit(zasada,stan:integer):boolean; 

var 
   i,bin:integer; 
begin 
  i:=-1; 
  repeat 
    bin:=zasada mod 2; 
    zasada:=zasada div 2; 
    i:=i+1; 
  until i=stan; 
  sprawdzbit:=bin=1; 
end; 

Procedure rysujkrok(krok:integer); 

var 
   j:integer; 
begin 
  for j:=1 to ilosc do 
    begin 
      if komorki[j] then 
        pen(1,255,0,0) 
      else 
        pen(1,0,0,0); 
      point(j-1,krok); 
    end; 
end; 

Begin 
  Writeln('Automat Komorkowy 1D'); 
  Writeln('Michal Wicha | SPIK'); 
  Writeln('--------------------'); 
  Writeln(''); 
  Write('Podaj ilosc komorek (3 - ',maksymalne,'): '); 
  Readln(ilosc); 
  if ilosc>maksymalne then 
    ilosc:=maksymalne 
  else 
    if ilosc<3 then 
      ilosc:=3; 
  Write('Podaj ilosc krokow symulacji (1 - ',makskroki,'): '); 
  Readln(kroki); 
  if kroki>makskroki then 
    kroki:=makskroki 
  else 
    if kroki<1 then 
      kroki:=1; 
  Write('Podaj numer zasady dzialania w notacji Wolfram (0 - 255): '); 
  readln(zasada); 
  if zasada>255 then 
    zasada:=255 
  else 
    if zasada<0 then 
      zasada:=0; 
  Writeln(''); 
  Writeln('Mozliwe wartosci: (1) losowy'); 
  Writeln('                  (2) jedna komorka aktywna po srodku'); 
  Writeln('                  (3) jedna komorka aktywn po lewej stronie'); 
  Write('Jaki stan poczatkowy? '); 
  Readln(poczatek); 
  if poczatek=3 then 
    begin 
      komorki[1]:=true; 
      for i:=2 to ilosc do 
        komorki[i]:=false; 
      statystyka[0]:=1; 
    end 
  else 
    if poczatek=2 then 
      begin 
        for i:=1 to ilosc do 
          komorki[i]:=false; 
        komorki[ilosc div 2]:=true; 
        statystyka[0]:=1; 
      end 
    else 
      begin 
        statystyka[0]:=0; 
        for i:=1 to ilosc do 
          begin 
            komorki[i]:=random(2)=1; 
            if komorki[i] then 
              statystyka[0]:=statystyka[0]+1; 
          end; 
      end; 
  {rysowanie} 
  clear; 
  rysujkrok(0); 
  for i:=1 to kroki do 
    begin 
      statystyka[i]:=0; 
      for j:=1 to ilosc do 
        begin 
          stan:=0; 
          for k:=-1 to 1 do 
            begin 
              sprawdz:=j+k; 
              if sprawdz>ilosc then 
                sprawdz:=1 
              else 
                if sprawdz<1 then 
                  sprawdz:=ilosc; 
              if komorki[sprawdz] then 
                stan:=stan+trunc(potega(2,(1-k))); 
            end; 
          kopia[j]:=sprawdzbit(zasada,stan); 
          if kopia[j] then 
            statystyka[i]:=statystyka[i]+1; 
        end; 
      komorki:=kopia; 
      rysujkrok(i); 
    end; 
  {generowanie raportu} 
  date(rok,miesiac,dzien); 
  time(godzina,minuta,sekunda); 
  assign(out,'raport.html'); 
  rewrite(out); 
  writeln(out,'<html>'); 
  writeln(out,'<head><title>Raport z wykonania programu</title></head>'); 
  writeln(out,'<body>'); 
  writeln(out,'<h1>Raport z wykonania programu</h1>'); 
  writeln(out,'<h2>Parametry</h2>'); 
  writeln(out,'<p><b>Data i czas wykonania:</b> ',dzien,'-',miesiac,'-',rok,' ',godzina,':',minuta,':',sekunda,'<br />'); 
  writeln(out,'<b>Ilosc komorek:</b> ',ilosc,'<br />'); 
  writeln(out,'<b>Ilosc krokow:</b> ',kroki,'<br />'); 
  writeln(out,'<b>Zasada dzialania:</b> ',zasada,'</p>'); 
  writeln(out,'<table>'); 
  writeln(out,'<tr><tr>krok</th><th>Ilosc komorek</th></tr>'); 
  for i:=0 to kroki do 
    writeln(out,'<tr><td>',i,'</td><td>',statystyka[i],'</td></tr>'); 
  writeln(out,'</table>'); 
  writeln(out,'</body>'); 
  writeln(out,'</html>'); 
  close(out); 
End.
