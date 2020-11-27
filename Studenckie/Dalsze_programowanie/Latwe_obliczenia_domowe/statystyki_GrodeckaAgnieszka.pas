program statystyki_proba; 

type 
   typtablicowy=array[1..10000] of real; 

procedure tablica(var tab:typtablicowy;var n:integer); 

var 
   i:integer; 
   a:real; 
begin 
  i:=1; 
  writeln('podaj liczbe cyfr w ci¹gu (liczba musi byæ dodatnia!): '); 
  readln(n); 
  tab[i]:=0; 
  repeat 
    begin 
      writeln; 
      writeln('podaj ', i, ' liczbê ci¹gu: ' ); 
      read(a); 
      tab[i]:=a; 
      i:=i+1; 
    end; 
  until i>n; 
end; 

procedure statystyki(var tab:typtablicowy;var n:integer); 

var 
   suma,srednia,l0,sld,ld,sumald,lu,sumalu,slu,os:real; 
   i:integer ; 
begin 
  suma:=0; 
  srednia:=0; 
  l0:=0; 
  sld:=0; 
  ld:=0; 
  sumald:=0; 
  lu:=0; 
  sumalu:=0; 
  slu:=0; 
  os:=0; 
  for i:=1 to n do 
    begin 
      suma:=suma+tab[i]; 
      srednia:=suma/n; 
      if tab[i]=0 then 
        l0:=l0+1; 
      if tab[i]>0 then 
        begin 
          ld:=ld+1; 
          sumald:=sumald+tab[i]; 
          sld:=sumald/ld; 
        end; 
      if tab[i]<0 then 
        begin 
          lu:=lu+1; 
          sumalu:=sumalu+tab[i]; 
          slu:=sumalu/lu; 
        end; 
    end; 
  for i:=1 to n do 
    os:=os+(sqr(tab[i]-srednia)); 
  begin 
    os:=sqrt(os/n); 
  end; 
  writeln; 
  writeln('Suma liczb w ci¹gu= ', suma:2:4); 
  writeln; 
  writeln('Œrednia liczb w ci¹gu= ', srednia:2:4); 
  writeln; 
  writeln('Liczba zer w ciagu= ', l0:2:2); 
  writeln; 
  writeln('Œrednia liczby dodatnich w ci¹gu= ', sld:2:4); 
  writeln; 
  writeln('Œrednia liczby ujemnych w ci¹gu= ',slu:2:4); 
  writeln; 
  writeln('Odchylenie standardowe= ',os:2:10); 
end; 

var 
   tab:typtablicowy; 
   n:integer; 

begin 
  tablica(tab,n); 
  statystyki(tab,n); 
end.
