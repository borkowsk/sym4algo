Program CA_1D_Wolfram_stat; 
{Program implementuje 256 jednowymiarowych automatów binarnych Wolframa
w skonczonej tablicy z brzegami zawsze o stanie 0 } 
{GRAFIKA Z ALGO - NIE MA PRZENOŒNEJ GRAFIKI DLA PASCALA} 

const 
   {Binarny kod automatu wg Wolframa} 
   Szablon='111 110 101 100 011 010 001 000'; {TEGO NIE ZMIENIAÆ}
    
   {TO MOZNA ZMIENIAÆ} 
   CACodeBin='01101110'; 
   
   (* CACodeBin='00011110';  {30}  {Brzydki efekt brzegowy po stronie lewej} 
    CACodeBin='00110011'; {51} Odwracanie bitów
    CACodeBin='01011010'; {90}
    CACodeBin='01101110'; {110}  
    CACodeBin='01111110'; {126}
    CACodeBin='10000001'; {129}
    CACodeBin='10110010'; {178}
    CACodeBin='11101000'; {232}
    CACodeBin='11111010'; {250} 
    CACodeBin='11111110'; {254}*) 
   Last=500; 
   {Rozmiar tablicy - Musi byc wiêksze ni¿ 1 i nieparzyste} 
   Prob=0.995; 
   {Prawdopodobienstwo inicjacji zerem } 
   Monte=false; 
   {false/true - tryb symulacji Monte-Carlo albo synchronicznie} 
   Torus=true; 
   {false/true - czy dzia³amy na torusie czy na "wyspie"} 
   Wizualizuj=true; 
   {false/true - czy rysujemy czy tylko liczymy} 
   PierwszaY=40; 
   {Pierwsza linia na rysownie historii automatu} 
   IleKroków=800; 
   {Ile kroków mo¿na wykonaæ } 
var 
   CACode:integer; 
   {Kod automatu wg. Wolframa w wersji liczbowej} 
   Swiat,NowyS:array[1..Last] of integer; 
   Rules:array[0..7] of boolean; 

procedure RóbRegu³y; 
{Przeksztalcanie ³añcucha z binarnym zapisem regu³ na dane wewnêtrzne} 
{Zamiast pêtli "kod rozwiniêty"} 
begin 
  Rules[0]:=(CACodeBin[8]='1'); 
  Rules[1]:=(CACodeBin[7]='1'); 
  Rules[2]:=(CACodeBin[6]='1'); 
  Rules[3]:=(CACodeBin[5]='1'); 
  Rules[4]:=(CACodeBin[4]='1'); 
  Rules[5]:=(CACodeBin[3]='1'); 
  Rules[6]:=(CACodeBin[2]='1'); 
  Rules[7]:=(CACodeBin[1]='1'); 
  CACode:=0; 
  if Rules[0] then 
    CACode:=1; 
  if Rules[1] then 
    CACode:=CACode+2; 
  if Rules[2] then 
    CACode:=CACode+4; 
  if Rules[3] then 
    CACode:=CACode+8; 
  if Rules[4] then 
    CACode:=CACode+16; 
  if Rules[5] then 
    CACode:=CACode+32; 
  if Rules[6] then 
    CACode:=CACode+64; 
  if Rules[7] then 
    CACode:=CACode+128; 
end; 

procedure KodNaRegu³y; 
begin 
  {  Rules[0]:=((CACode and 1) <> 0); NIE DA SIE - BRAK LOGICZNEGO and!!!} 
end; 

procedure Zeruj; 
{Wyzerowanie "Swiat"a aktualnego} 
var 
   i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=0; 
end; 

procedure Losuj; 
{Wylosowanie "Swiat"a aktualnego} 
var 
   i:integer; 
begin 
  if 1.0*(1-Prob)*Last>1.0 then 
    begin 
      for i:=1 to Last do 
        if random<Prob then 
          Swiat[i]:=0 
        else 
          Swiat[i]:=1 
    end 
  else 
    begin 
      Zeruj; 
      Swiat[Last div 2]:=1; 
    end; 
end; 

procedure zrób_krok_synchronicznie; 
{W³asciwy krok modelu w stylu synchronicznym} 
var 
   i:integer; 
   a,b,c:integer; 
   {wartoœæ lewej, œrodkowej i prawej komorki} 
begin 
  {Ustalanie nowych wartosci} 
  for i:=1 to Last do 
    begin 
      if 1<i then 
        a:=Swiat[i-1] 
      else 
        a:=0; 
      b:=Swiat[i]; 
      if i<Last then 
        c:=Swiat[i+1] 
      else 
        c:=0; 
      if Rules[a*4+b*2+c] then 
        NowyS[i]:=1 
      else 
        NowyS[i]:=0; 
    end; 
  {Przepisywanie z "NowyS"[wiat] na "Swiat" aktualny} 
  for i:=1 to Last do 
    Swiat[i]:=NowyS[i]; 
end; 

procedure zrób_synchronicznie_po_torusie; 
{W³asciwy krok modelu w stylu synchronicznym} 
var 
   i:integer; 
   a,b,c:integer; 
   {wartoœæ lewej, œrodkowej i prawej komorki} 
begin 
  {Ustalanie nowych wartosci} 
  for i:=1 to Last do 
    begin 
      if 1<i then 
        a:=Swiat[i-1] 
      else 
        a:=Swiat[Last]; 
      {bo torus, aczkolwiek prymitywnie zrobiony} 
      b:=Swiat[i]; 
      if i<Last then 
        c:=Swiat[i+1] 
      else 
        c:=Swiat[1]; 
      {bo torus, aczkolwiek prymitywnie zrobiony} 
      if Rules[a*4+b*2+c] then 
        NowyS[i]:=1 
      else 
        NowyS[i]:=0; 
    end; 
  {Przepisywanie z "NowyS"[wiat] na "Swiat" aktualny} 
  for i:=1 to Last do 
    Swiat[i]:=NowyS[i]; 
end; 

procedure zrób_krok_montecarlo; 
{W³asciwy krok modelu w stylu Monte-Carlo} 
var 
   monte,i,a,b,c:integer; 
   {indeks lewej, œrodkowej i prawej komorki} 
begin 
  for monte:=1 to Last do 
    begin 
      i:=1+random(Last); 
      if 1<i then 
        a:=Swiat[i-1] 
      else 
        a:=0; 
      b:=Swiat[i]; 
      if i<Last then 
        c:=Swiat[i+1] 
      else 
        c:=0; 
      if Rules[a*4+b*2+c] then 
        Swiat[i]:=1 
      else 
        Swiat[i]:=0; 
    end; 
end; 

procedure zrób_montecarlo_po_torusie; 
{W³asciwy krok modelu w stylu Monte-Carlo} 
var 
   monte,i,a,b,c:integer; 
   {indeks lewej, œrodkowej i prawej komorki} 
begin 
  for monte:=1 to Last do 
    begin 
      i:=1+random(Last); 
      if 1<i then 
        a:=Swiat[i-1] 
      else 
        a:=Swiat[Last]; 
      {bo torus, aczkolwiek prymitywnie zrobiony} 
      b:=Swiat[i]; 
      if i<Last then 
        c:=Swiat[i+1] 
      else 
        c:=Swiat[1]; 
      {bo torus, aczkolwiek prymitywnie zrobiony} 
      if Rules[a*4+b*2+c] then 
        Swiat[i]:=1 
      else 
        Swiat[i]:=0; 
    end; 
end; 

Procedure Poka¿Regu³y; 
{Wypisywanie regul na ekran graficzny} 
{To jest nieprzenoœne ze wzgledu na procedury graficzne ALGO!!!} 
var 
   i,j,x,y:integer; 
begin 
  Coordinates(x,y); 
  x:=0; 
  for i:=0 to 7 do 
    for j:=0 to 2 do 
      begin 
        if Szablon[1+i*4+j]='1' then 
          Brush(1,255,0,0) 
        else 
          Brush(1,0,0,0); 
        Rectangle(x,y,x+9,y+9); 
        if j<>2 then 
          x:=x+10 
        else 
          x:=x+20; 
      end; 
  y:=y+10; 
  x:=10; 
  for j:=7 downto 0 do 
    begin 
      if Rules[j] then 
        Brush(1,255,0,0) 
      else 
        Brush(1,0,0,0); 
      Rectangle(x,y,x+9,y+9); 
      x:=x+40; 
    end; 
  Brush(1,255,255,255); 
  MoveTo(0,PierwszaY); 
end; 

procedure Wypisz(linia:integer); 
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 
var 
   i:integer; 
begin 
  for i:=1 to Last do 
    begin 
      if Swiat[i]=1 then 
        Pen(1,255,linia div 8,linia div 4) 
      else 
        Pen(1,0,0,0); 
      Point(i,linia); 
    end; 
end; 

procedure Wyrysuj; 
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 
var 
   i:integer; 
begin 
  for i:=1 to Last do 
    begin 
      if Swiat[i]=0 then 
        Pen(1,0,0,1) 
      else 
        Pen(1,255,255,0); 
      Line(i,PierwszaY,i,PierwszaY+9); 
    end; 
end; 

procedure ZróbStatystyki(var npl:text;numer_kroku:integer); 
{Uzywamy dobrodziejstw PASCALA :) i tworzymy funkcje pomocnicze w procedurze} 


function stres:real; 
{Obliczanie sredniego stresu w przypadku jednowymiarowym} 
var 
   i,j,k:integer; 
   licz:integer; 
begin 
  licz:=0; 
  for j:=1 to Last do 
    begin 
      i:=j-1; 
      k:=j+1; 
      if (0<i)and(Swiat[i]<>Swiat[j]) then 
        licz:=licz+1; 
      if (k<=Last)and(Swiat[k]<>Swiat[j])then 
        licz:=licz+1; 
    end; 
  {Ma³a sztuczka :) - jeœli torus to "czasem" licznik trzeba zwiekszyæ o 2} 
  if Torus and (Swiat[1]<>Swiat[Last]) then 
    licz:=licz+2; 
  stres:=licz/Last; 
end; 

function zliczstan(jaki:integer):integer; 
{Poni¿sze mo¿na by wykonac w jednej petli, ale by³oby trudniejsze :) } 
var 
   i:integer; 
   licz:integer; 
begin 
  licz:=0; 
  for i:=1 to Last do 
    if Swiat[i]=jaki then 
      licz:=licz+1; 
  zliczstan:=licz; 
end; 

function klastering(jaki:integer):real; 
{Poni¿sze mo¿na by wykonac w jednej petli, ale by³oby trudniejsze :) } 
var 
   i,j,k:integer; 
   liczzgodne:integer; 
   liczstan:integer; 
begin 
  liczzgodne:=0; 
  liczstan:=0; 
  for j:=1 to Last do 
    if Swiat[j]=jaki then 
      begin 
        liczstan:=liczstan+1; 
        i:=j-1; 
        k:=j+1; 
        if (0<i)and(Swiat[i]=Swiat[j]) then 
          liczzgodne:=liczzgodne+1; 
        if (k<=Last)and(Swiat[k]=Swiat[j])then 
          liczzgodne:=liczzgodne+1; 
      end; 
  {Ma³a sztuczka :) - jeœli torus to "czasem" licznik trzeba zwiekszyæ o 2} 
  if Torus and (Swiat[1]=jaki)and(Swiat[Last]=jaki) then 
    liczzgodne:=liczzgodne+2; 
  klastering:=liczzgodne/liczstan; 
end; 

begin 
  {Nag³ówek wypisywany tylko raz} 
  if numer_kroku=0 then 
    writeln(npl,'Krok',chr(9),'stres',chr(9),'liczba 0',chr(9),'liczba 1',chr(9),'klast 0',chr(9),'klast 1'); 
  {W³aœciwe dane wypisywane w ka¿dym kroku} 
  write(npl,numer_kroku); 
  write(npl,chr(9),stres); 
  write(npl,chr(9),zliczstan(0)); 
  write(npl,chr(9),zliczstan(1)); 
  write(npl,chr(9),klastering(0)); 
  write(npl,chr(9),klastering(1)); 
  writeln(npl); 
end; 

procedure NazwijPlik(var npl:text); 
var 
   s:string; 
   b:string; 
begin 
  s:='CA_'; 
  str(CACode,b); 
  s:=s+b; 
  str(IleKroków,b); 
  s:=s+'x'+b; 
  if torus then 
    s:=s+'T'; 
  if monte then 
    s:=s+'M'; 
  s:=s+'.out'; 
  assign(npl,s); 
end; 

var 
   naszPlik:text; 
   krok:integer; 

begin 
  RóbRegu³y; 
  Losuj; 
  NazwijPlik(naszPlik); 
  rewrite(naszPlik); 
  write('Jednowymiarowy automat Wolframa ',CACode,', ',Last,' komórek'); 
  write(naszPlik,'Jednowymiarowy automat Wolframa ',CACode,', ',Last,' komórek'); 
  if Torus then 
    begin 
      write(', w pêtli ("torus" jednowymiarowy)'); 
      write(naszPlik,' w pêtli'); 
    end; 
  if Monte then 
    begin 
      write(' w trybie "Monte-Carlo"'); 
      write(naszPlik,' w trybie "Monte-Carlo"'); 
    end; 
  writeln; 
  writeln(naszPlik); 
  {TU SIÊ KONCZY PISANIE A ZACZYNA RYSOWANIE} 
  Poka¿Regu³y; 
  for Krok:=0 to IleKroków do 
    begin 
      if Wizualizuj then 
        begin 
          Wyrysuj; 
          Wypisz(PierwszaY+10+Krok); 
        end; 
      ZróbStatystyki(naszPlik,Krok); 
      if Monte then 
        if Torus then 
          zrób_montecarlo_po_torusie 
        else 
          zrób_krok_montecarlo 
      else 
        if Torus then 
          zrób_synchronicznie_po_torusie 
        else 
          zrób_krok_synchronicznie; 
    end; 
  writeln; 
  close(naszPlik); 
  writeln('Zakoñczono ',Krok,' kroków'); 
end.
