Program CA_1D_inne_zasady; 
{Zasada dzia³ania programu:
1. Komórka mo¿e przyjmowaæ 3 stany:
   ¯ywa  - oznaczona kolorem ¿ó³tym 
   Martwa  - oznaczona kolorem niebieskim  
   Œpi¹ca - oznaczona kolorem ró¿owym
2. Komórka pozostaje ¿ywa (przyjmuje wartoœæ 1) wtedy, gdy:
   ma jednego s¹siada ¿ywego i jednego martwego (poniewa¿ nie zostawi tego jednego z nieboszczykiem),
   ma jednego s¹siada œpi¹cego i jednego martwego (poniewa¿ czeka, a¿ ten jeden siê obudzi),
   ma jednego s¹siada ¿ywego i jednego œpi¹cego (bo obydwie czekaj¹, a¿ tamten siê obudzi)
3. Komórka pozostaje martwa (przyjmuje wartoœæ 0) wtedy, gdy:
   ma dwóch s¹siadów ¿ywych (poniewa¿ jest za ciasno)
4. Komórka zasypia (przyjmuje wartoœæ 4) wtedy, gdy:
   ma dwóch s¹siadów martwych (poniewa¿ jest nudno, jak s¹siedzi nie ¿yj¹),
   ma dwóch s¹siadów œpi¹cych (poniewa¿ panuje senna atmosfera)
} 
{GRAFIKA Z ALGO - NIE MA PRZENOŒNEJ GRAFIKI DLA PASCALA} 

const    Last=301;  {Rozmiar tablicy - Musi byc wiêksze ni¿ 1 i nieparzyste} 
         Steps=500; {Ile kroków mo¿na wykonaæ } 
         Wylosowane=false;
         Prob=0.001;
         
var      Swiat:array[1..Last] of integer; 
         NowyS:array[1..Last] of integer; 
         krok:integer;
         plik:text;

function ile_zywych:integer;
  var
    i:integer;
    licznik:integer;
  begin
    licznik:=0;
    for i:=1 to Last do
     begin
     if Swiat[i]=1 then 
     licznik:=licznik+Swiat[i];
     ile_zywych:=licznik;
     end;
  end;

function ile_spi:integer;
  var
    i:integer;
    liczniks:integer;
  begin
    liczniks:=0;
    for i:=1 to Last do
     begin
     if Swiat[i]=4 then 
     liczniks:=liczniks+Swiat[i];   {pamiêtaæ, ¿eby potem podzieliæ przez 4!!!!}
     ile_spi:=liczniks;
     end;
  end;
  
        
procedure zeruj; 
{Wyzerowanie "Swiat"a aktualnego} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=0; 
end; 

procedure losuj; 
{Wylosowanie "Swiat"a aktualnego} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    if random<Prob then 
      Swiat[i]:=0 
    else 
      Swiat[i]:=1; 
end; 

procedure wypisz(linia:integer); 
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 
var   i:integer; 
begin 
  for i:=1 to Last do
    begin 
    if Swiat[i]=0 then 
      Pen(1,26,18,237) {Niebieskie}
      else
    if Swiat[i]=1 then 
      Pen(1,254,254,10) {Zó³te}
      else
    if Swiat[i]=4 then
        Pen(1,252,83,83); {Pomarañczowe}
      Point(i,linia); 
    end; 
end; 

procedure wyrysuj;
{Wypisywanie na ekran graficzny} 
{To jest nieprzenoœne!!!} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    begin 
    if Swiat[i]=0 then 
      Pen(1,26,18,237) {Niebieskie}
      else
    if Swiat[i]=1 then 
      Pen(1,254,254,10) {Zó³te}
      else
    if Swiat[i]=4 then
        Pen(1,252,83,83); {Pomarañczowe}
      Line(i,15,i,24); 
    end; 
end; 

procedure przepisz; 
{Przepisywanie z "NowyS"[wiat] na "Swiat" aktualny} 
var  i:integer; 
begin 
  for i:=1 to Last do 
    Swiat[i]:=NowyS[i]; 
end; 

procedure zrób_krok; 
{W³asciwy krok modelu} 
var   i,j,k:integer; 
      {indeks lewej, œrodkowej i prawej komorki} 
      sas:integer; 
begin 
  for j:=1 to Last do 
    begin 
      sas:=0; 
      i:=j-1; 
      k:=j+1; 
    if (i>0) then 
       begin
        if (Swiat[i]=1) then 
          sas:=sas+1;
        if (Swiat[i]=4) then
          sas:=sas+4; 
       end;
      if (k<=Last) then
       begin
        if (Swiat[k]=1) then 
          sas:=sas+1;
        if (Swiat[k]=4) then
          sas:=sas+4
       end; 
       begin
         if (sas=0) or (sas=8) then 
           NowyS[j]:=4; 
         if (sas=1) or (sas=4) or (sas=5) then 
           NowyS[j]:=1;
         if (sas=2) then
           NowyS[j]:=0
       end; 
    end; 
end; 

begin 
assign(plik,'ilenielos2.out');
rewrite(plik);
writeln(plik,'N=',chr(9),Last,chr(9),'P0=',chr(9),Prob);

  Zeruj; 
  {¯eby nie komplikowaæ inicjacja w kodzie} 
    Swiat[6]:=1;  
    Swiat[(last+1) div 2]:=1;
   Swiat[29]:=1;
    Swiat[70]:=1;
 if wylosowane then
              losuj;
  writeln('Automat Irminy J. - "Jednowymiarowe ¯ycie i spanie" o ',Last,' komórkach'); 
  for krok:=1 to Steps do 
    begin 
      wyrysuj;
      wypisz(25+krok); 
      writeln(plik,0,chr(9),ile_zywych,chr(9),ile_spi,chr(9));
      zrób_krok; 
      przepisz; 
    end; 
    close(plik);
  writeln; 
  writeln('Voila!'); 
end.
