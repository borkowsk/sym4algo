program stat_trudne; 

var 
   Tab:array[1..10] of real; 
   ile_liczb,i,z,l,g,k:integer; 
   suma,o,liczba,sred,p,su,sum,suma_o:real; 

procedure wczytaj; 

begin 
  write('Ile ma byc liczb (1-10): '); 
  readln(ile_liczb); 
  writeln; 
  write('Prosze o podanie ', ile_liczb ); 
  writeln(' liczb: '); 
  for z:=1 to ile_liczb do 
    begin 
      readln(liczba); 
      Tab[z]:=liczba; 
    end; 
end; 

procedure suma_liczb; 

begin 
  suma:=0; 
  for z:=1 to ile_liczb do 
    begin 
      suma:=Tab[z]+suma; 
    end; 
  writeln(' -suma wszystkich liczb: ',suma:4:2); 
end; 

procedure srednia; 

begin 
  sred:=(suma/ile_liczb); 
  writeln(' -srednia liczb: ',sred:4:2); 
end; 

procedure zera; 

begin 
  l:=0; 
  for z:=1 to ile_liczb do 
    if Tab[z]=0 then 
      l:=l+1; 
  writeln(' -ilosc zer: ', l); 
end; 

procedure liczby_ujemne; 

begin 
  g:=0; 
  su:=0; 
  for z:=1 to ile_liczb do 
    if Tab[z]<0 then 
      begin 
        g:=g+1; 
        su:=su+Tab[z]; 
      end; 
  if g<>0 then 
    begin 
      p:=su/g; 
      writeln(' -srednia arytmetyczna liczb ujemnych: ', p:4:2); 
    end 
  else 
    writeln(' -brak liczb ujemnych'); 
end; 

procedure liczby_dodatnie; 

begin 
  k:=0; 
  sum:=0; 
  for z:=1 to ile_liczb do 
    if Tab[z]>0 then 
      begin 
        k:=k+1; 
        sum:=sum+Tab[z]; 
      end; 
  if k<>0 then 
    begin 
      p:=sum/k; 
      writeln(' -srednia arytmetyczna liczb dodatnich: ', p:4:2); 
    end 
  else 
    writeln('-brak liczb dodatnich'); 
end; 

procedure odchylenie; 

begin 
  suma_o:=0; 
  for z:=1 to ile_liczb do 
    begin 
      o:=sqr(Tab[z]-sred); 
      suma_o:=suma_o+o; 
    end; 
  suma_o:=suma_o/ile_liczb; 
  suma_o:=sqrt(suma_o); 
  writeln(' -odchylenie standartowe: ',suma_o:4:6); 
end; 

begin 
  wczytaj; 
  writeln; 
  suma_liczb; 
  srednia; 
  zera; 
  liczby_ujemne; 
  liczby_dodatnie; 
  odchylenie; 
end.
