program AttitudeStrenght; 
{Porzadna implementacja modelu Nowaka/Latane z si³ami} 
{ i bezpiecznym sprawdzaniem wyboru bez ukrytego biasu} 
{ z liczeniem ENTROPI INFORMACYJNEJ H}
const 
   Rozm=14;  {D³ugoœæ boku agenta} 
   Brzeg=2;  {Obwodka} 
   NajmRoz=2; {Jaki rozmiar maj¹ najslabsi agenci} 
   
   Bok=25;    {Dlugoœæ boku œwiata} 
   IlePogl¹dów=2; {Liczba konkuruj¹cych pogladów} 
   Gêstoœæ=1; {Gêstoœæ zaludnienia} 
   MaxSi³a=1000;{Najwieksza sila - musi byc odpowiednio du¿a do rozk³adu} 
   Rozk³ad=2;   {Stopien rozk³adu "Pareto" >=0 - zero daje brak rozkladu, same MaxSi³a} 
   Noise=0.01;  {Szum decyzyjny} 
type 
   Agent=record 
        pogl¹d:integer;  {0..IlePogladow-1} 
        si³a:integer;    {Jeœli 0 to martwy} 
   end; 
   
   Œwiat=array[1..Bok,1..Bok] of Agent; {Œwiat symulacji "zamieszkany" przez Agentów } 
   
type 
   ZbiórLiczników=array[0..IlePogl¹dów{-1}] of integer;{Zestaw liczników wp³ywów lub wyznawców}   

procedure Inicjacja(var TenŒwiat:Œwiat); 
{Wype³nianie œwiata. Nie¿ywe maj¹ si³ê = 0}
var 
   i,j,k:integer; 
   pomoc:real; 
begin 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        if Random<Gêstoœæ then 
          begin {¯ywy} 
            TenŒwiat[i,j].pogl¹d:=random(IlePogl¹dów); 
            pomoc:=1; 
            for k:=1 to Rozk³ad do 
              pomoc:=pomoc*random; 
            TenŒwiat[i,j].si³a:=1+trunc(pomoc*(MaxSi³a-1)); 
          end 
        else 
          begin {Martwy} 
            TenŒwiat[i,j].pogl¹d:=IlePogl¹dów; 
            TenŒwiat[i,j].si³a:=0; {Bo 0 znaczy MARTWY!!!} 
          end; 
      end; 
end; 

function Przeskaluj(v,min,max:real):real; 
{Do wizualizacji}
begin 
  Przeskaluj:=(v-min)/(max-min); 
end; 

function Przelogarytmuj(v,max:real):real; 
{Do wizualizacji}
begin 
  v:=ln(v+1); 
  Przelogarytmuj:=v/ln(max+1); 
end; 

procedure Wizualizacja(var TenŒwiat:Œwiat); 
{Kwadratami o wielkosci proporcjonalnej do logarytmu sily} 
var 
   i,j:integer;    {Przechodzenie po agentach} 
   q,r,rRoz:real;  {Przeliczone cechy agenta} 
   WRoz,ri,vi:integer;{Rozmiar wewnêtrzny i pozycjonowanie} 
begin 
  RRoz:=1-NajmRoz/Rozm;
  WRoz:=Rozm-Brzeg; {Nie uwaglêdniamy szerokoœci obwódki (Bord), ale to specyfika ALGO}
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        pen(Brzeg,100,100,100); 
        brush(1,128,128,128); 
        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
        if TenŒwiat[i,j].si³a>0 then 
          begin 
            q:=Przeskaluj(TenŒwiat[i,j].pogl¹d,0,IlePogl¹dów-1)*255; 
            r:=Przelogarytmuj(TenŒwiat[i,j].si³a,MaxSi³a)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:={Brzeg div 2+}(Rozm-ri) div 2;                      
            Pen(1,0,0,0);
            Brush(1,round(20+q*0.7),round(20+q*0.3),round(20+q*0.3)); 
            Rectangle(i*Rozm+vi,j*Rozm+vi,i*Rozm+vi+ri,j*Rozm+vi+ri); 
          end; 
      end; 
end; 

procedure KrokSymulacji(var TenŒwiat:Œwiat); 
{Procedura zmiany stanu symulacji. Zawiera procedury pomocnicze.} 
 
procedure ZliczWp³ywy(x,y:integer;var Liczniki:zbiórliczników); 
{Wewnetrzna procedura dla KrokSymulacji} 
var 
   lewo,prawo,góra,dó³,i,j:integer; 
begin 
  lewo:=x-1;   if lewo<1 then lewo:=1; 
  prawo:=x+1;  if prawo>Bok then  prawo:=Bok; 
  góra:=y-1;   if góra<1 then góra:=1; 
  dó³:=y+1;    if dó³>Bok then dó³:=Bok; 
  
  for i:=lewo to prawo do 
    for j:=góra to dó³ do 
      if TenŒwiat[i,j].si³a>0 then 
        Liczniki[TenŒwiat[i,j].pogl¹d]:=Liczniki[TenŒwiat[i,j].pogl¹d]+TenŒwiat[i,j].si³a;{!!!} 
end; 

function UstalPogl¹d(var Liczniki:zbiórliczników):integer; 
{Wewnetrzna funkcja dla KrokSymulacji, znajduj¹ca nawiêkszy licznik} 
var 
   max,nowy,i,j:integer; 
begin 
  max:=0; 
  nowy:=-1; 
  j:=random(IlePogl¹dów);{Zeby uniknac niejawnego bias-owania} 
  for i:=0 to IlePogl¹dów-1 do {Petla tylko dba o przejrzenioe calej tablicy}
  begin
    if liczniki[j]>max then 
      begin 
        max:=liczniki[j]; 
        nowy:=j; 
      end; 
    j:=(j+1)mod IlePogl¹dów; {Zeby obejsc cala tablice zaczynajac z losowego miesjca}  
  end;    
  UstalPogl¹d:=nowy; 
end; 

var 
   i,j,k,l,N:integer; 
   liczniki:zbiórliczników; 
begin 
  N:=Bok*Bok; 
  for k:=1 to N do 
    begin 
      for l:=0 to IlePogl¹dów do 
        liczniki[l]:=0; 
      i:=1+random(Bok); 
      j:=1+random(Bok); 
      if random<Noise then
        TenŒwiat[i,j].pogl¹d:=random(IlePogl¹dów)
      else
        begin
          ZliczWp³ywy(i,j,liczniki); 
          TenŒwiat[i,j].pogl¹d:=UstalPogl¹d(liczniki); 
        end;
    end; 
end; 

procedure ZliczPogl¹dy(var TenŒwiat:Œwiat;var Liczniki:ZbiórLiczników);
var i,j:integer;
begin
for i:=0 to IlePogl¹dów do
    Liczniki[i]:=0;
for i:=1 to Bok do
   for j:=1 to Bok do
      if TenŒwiat[i,j].si³a>0 then {Tylko dla ¿ywych}
        Liczniki[TenŒwiat[i,j].pogl¹d]:=Liczniki[TenŒwiat[i,j].pogl¹d]+1;              
end;

function log2(v:real):real;
begin
log2:=ln(v)/ln(2);{Argument logarytmu musi byæ > 0}
end;

function Entropia(var Liczniki:ZbiórLiczników):real;
var i:integer;
    Suma:integer;
    p,H:real;
begin
suma:=0;
for i:=0 to IlePogl¹dów do
    Suma:=Suma+Liczniki[i];
H:=0;    
for  i:=0 to IlePogl¹dów do 
    if Liczniki[i]>0 then
       begin
       p:=Liczniki[i]/suma;
       H:=H-p*log2(p);
       end;
Entropia:=H;       
end;

procedure NarysujHist(x,y,s³upek,szerokoœæ:integer;var Hist:ZbiórLiczników);  
var  i,n:integer;
     Max:integer;
begin  
  brush(1,255,255,255); 
  pen(1,0,0,0);
  Max:=Bok*Bok;
  moveto(x,y); 
  for i:=0 to IlePogl¹dów-1 do  
    begin  
      n:=Hist[i];  
      n:=(n*szerokoœæ) div Max; {==> n:=trunc(n/Max*szerokoœæ);} 
      y:=y+s³upek;
      brush(1,128,128,128);
      Rectangle(0,y,n,y+s³upek);
      brush(1,255,255,255);  
      MoveTo(n+2,y);
      Writeln(Hist[i],'   ');
    end;  
  {writeln('Pierwszy za = ',Hist[IlePogl¹dów]);  DEBUG}
end; 

procedure WypiszHistogram(var f:text;var Hist:ZbiórLiczników);  
var  i:integer;  
begin  
 for i:=0 to IlePogl¹dów-1 do  
    write(f,Hist[i],chr(9));      
end; 

var 
   ŒwiatSymulacji:Œwiat; 
   NumerKroku:integer; 
   Histogram:ZbiórLiczników;
   H:real;
   Out:text;
begin 
  assign(Out,'Attitude.out');
  rewrite(Out); 
  Inicjacja(ŒwiatSymulacji); 
  numerkroku:=0; 
  repeat 
    if NumerKroku mod 20=0 then
       begin
         Wizualizacja(ŒwiatSymulacji); 
         writeln;
       end;
    {Liczenie statystyki, jej wyœwietlanie i zapis do pliku}
    ZliczPogl¹dy(ŒwiatSymulacji,Histogram);
    NarysujHist(0,(Bok+2)*Rozm,16,Bok*Rozm,Histogram);
    brush(1,255,255,255); 

    H:=Entropia(Histogram);
    writeln('Krok: ',NumerKroku,' H=',H:10:8); 
    
    write(out,NumerKroku,chr(9));
    WypiszHistogram(out,Histogram);
    writeln(out,H);       
         
    {Nowy krok}     
    KrokSymulacji(ŒwiatSymulacji); 
    NumerKroku:=NumerKroku+1; 
  until IsEvent; 
  close(Out);
end.
