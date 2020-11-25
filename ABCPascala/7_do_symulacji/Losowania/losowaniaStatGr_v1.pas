program LosowaniaIStatystykiGraf; 
{U¿ycie generatora liczb pseudolosowych
do ró¿nych losowañ i badanie co wylosowano} 

const 
   {Niemal najwiêksza tabela danych jak¹ siê da zadeklarowac w ALGO to 54200 liczb real} 
   LastData=10000; 
   {Histogramu tyle ile trzeba} 
   LastHist=100; 
   {Maksymalny pasek histogramu przy rysowaniu} 
   HistHeight=500; 
   {Sta³e zwi¹zane z zakresem liczb zmiennoprzecinkowych} 
   REALMAX=1.6999999999999999999999e308; 
   REALMIN=-1.699999999999999999999e308; 
   REALLAST=0.000000000000000000001; 
   REALEPS=1.0e-323; 
type 
   histogram=array[1..LastHist] of integer; 
   rawdata=array[1..LastData] of real; 

procedure Error(message:string); 

begin 
  writeln(message); 
  {halt; NIE MA W ALGO - ZATRZYMUJEMY PROGRAM WYWO£UJ¥C DZIELENIE PRZEZ 0 !!!} 
  writeln(1/0); 
end; 

procedure RandomIntRange(var Tab:rawdata;N,ranges,rangee:integer); 

var 
   i,r:integer; 
begin 
  if ranges>=rangee then 
    Error('Zakres losowania nieprawid³owy'); 
  {Ustalenie parametru funkcji random} 
  r:=rangee-ranges+1; 
  {Pêtla losowania} 
  For i:=1 to LastData do 
    Tab[i]:=ranges+random(r); 
end; 

procedure RandomRange(var Tab:rawdata;N:integer;ranges,rangee:real); 

var 
   i:integer; 
   r:real; 
begin 
  if ranges>=rangee then 
    Error('Zakres losowania nieprawid³owy'); 
  {Ustalenie mno¿nika} 
  r:=rangee-ranges; 
  {Pêtla losowania} 
  For i:=1 to LastData do 
    Tab[i]:=ranges+random*r; 
end; 

procedure RandomQuotient(var Tab:rawdata;N:integer); 

var 
   i:integer; 
   r:real; 
begin 
  {Pêtla losowania} 
  For i:=1 to LastData do 
    Tab[i]:=1/(random+REALLAST); 
end; 

procedure RandomSumm(var Tab:rawdata;N,S:integer); 

var 
   i,j:integer; 
   summ:real; 
begin 
  {Pêtla losowania wartoœci} 
  For i:=1 to LastData do 
    begin 
      summ:=0; 
      {Petla losowania sk³adników} 
      For j:=1 to S do 
        summ:=summ+random; 
      Tab[i]:=summ; 
    end; 
end; 

procedure RandomPseudoNorm(var Tab:rawdata;N,S:integer;ranges,rangee:real); 

var 
   i,j:integer; 
   summ,r:real; 
begin 
  if ranges>=rangee then 
    Error('Zakres losowania nieprawid³owy'); 
  {Ustalenie mno¿nika od razu z dzieleniem przez liczbê sk³adników} 
  r:=(rangee-ranges)/S; 
  {Pêtla losowania wartoœci} 
  For i:=1 to LastData do 
    begin 
      summ:=0; 
      {Petla losowania sk³adników} 
      For j:=1 to S do 
        summ:=summ+random; 
      Tab[i]:=ranges+summ*r; 
    end; 
end; 

procedure RandomProduct(var Tab:rawdata;N,S:integer;ranges,rangee:real); 

var 
   i,j:integer; 
   product,r:real; 
begin 
  if ranges>=rangee then 
    Error('Zakres losowania nieprawid³owy'); 
  {Ustalenie mno¿nika do rozci¹gniêcia zakresu} 
  r:=rangee-ranges; 
  {Pêtla losowania wartoœci} 
  For i:=1 to LastData do 
    begin 
      product:=1; 
      {Petla losowania sk³adników} 
      For j:=1 to S do 
        product:=product*random; 
      Tab[i]:=ranges+product*r; 
    end; 
end; 

procedure MinMax(var Tab:rawdata;N:integer;var Min,Max:real); 

var 
   i:integer; 
begin 
  {Inicjujemy na tak¹ wartoœæ, która na pewno zostanie zmieniona} 
  Max:=REALMIN; 
  Min:=REALMAX; 
  {Pêtla poszukiwania} 
  For i:=1 to LastData do 
    begin 
      if Tab[i]<Min then 
        Min:=Tab[i]; 
      if Tab[i]>Max then 
        Max:=Tab[i]; 
    end; 
end; 

procedure MakeHistogramInt(var Tab:rawdata;N,Min,Max:integer;var Hist:histogram); 

var 
   i,a:integer; 
   x:real; 
begin 
  {Zerowanie histogramu} 
  for i:=1 to LastHist do 
    hist[i]:=0; 
  {Zliczanie histogramu} 
  for i:=1 to N do 
    begin 
      {a z zakresu MIN..MAX} 
      a:=trunc(Tab[i]); 
      a:=a-MIN+1; 
      hist[a]:=hist[a]+1; 
    end; 
end; 

procedure MakeHistogram(var Tab:rawdata;N:integer;Min,Max:real;var Hist:histogram;NofR:integer); 

var 
   i,a:integer; 
   x:real; 
begin 
  {Zerowanie histogramu} 
  for i:=1 to LastHist do 
    hist[i]:=0; 
  {Zliczanie histogramu} 
  for i:=1 to N do 
    begin 
      {Do zakresu 0..1} 
      x:=(Tab[i]-Min)/(Max-Min); 
      {a z zakresu 1..NofR, Max na si³ê do ostatniego} 
      if x>=1 then 
        a:=NofR 
      else 
        a:=trunc(x*NofR+1); 
      hist[a]:=hist[a]+1; 
    end; 
end; 

procedure MakeHistogramTrick(var Tab:rawdata;N:integer;Min,Max:real;var Hist:histogram;NofR:integer); 

var 
   i,a:integer; 
   x,s:real; 
begin 
  {Zerowanie histogramu} 
  for i:=1 to LastHist do 
    hist[i]:=0; 
  {Szacowanie skali} 
  s:=Max-Min; 
  s:=s*1.000000000000001; 
  {Zliczanie histogramu} 
  for i:=1 to N do 
    begin 
      {Do zakresu 0..0.99999 - fikcyjny Max o 0.000000000000001 wiecej ni¿ faktyczny} 
      x:=(Tab[i]-Min)/s; 
      {a z zakresu 1..NofR, Max do ostatniego} 
      a:=trunc(x*NofR+1); 
      hist[a]:=hist[a]+1; 
    end; 
end; 

procedure MakeHistogramRound(var Tab:rawdata;N:integer;Min,Max:real;var Hist:histogram;NofR:integer); 

var 
   i,a:integer; 
   x:real; 
begin 
  {Zerowanie histogramu} 
  for i:=1 to LastHist do 
    hist[i]:=0; 
  {Zliczanie histogramu} 
  for i:=1 to N do 
    begin 
      {Do zakresu 0..1} 
      x:=(Tab[i]-Min)/(Max-Min); 
      {"a" z zakresu 1..NofR - Min i Max s¹ œrodkami swoich przedzia³ów} 
      { - które przez to s¹ mniejsze!} 
      a:=1+round(x*(NofR-1)); 
      hist[a]:=hist[a]+1; 
    end; 
end; 

procedure WriteHistogram(var Hist:histogram;NofR:integer); 

var 
   i:integer; 
begin 
  for i:=1 to NofR do 
    writeln(Hist[i]); 
  writeln('Pierwszy za = ',Hist[NofR+1]); 
end; 

procedure DrawHistogram(var Hist:histogram;NofR:integer); 
var 
   i,n:integer; 
   x,y:integer;
begin 
  for i:=1 to NofR do 
    begin 
      n:=Hist[i]; 
      {n:=trunc(n/LastData*HistHeight);}
      n:=(n*HistHeight)div LastData;
      Coordinates(x,y);
      Rectangle(0,y,n,y+15);
      MoveTo(n,y);
      Writeln(Hist[i]);
    end; 
  writeln('Pierwszy za = ',Hist[NofR+1]); 
end; 

var 
   TheData:rawdata; 
   TheHist:histogram; 
   TheMin,TheMax:real; 

begin 
  writeln('Ró¿ne losowania i ich statystyki'); 
  writeln('--------------------------------'); 
  writeln('Losowanie z zakresu <-4,3>'); 
  RandomIntRange(TheData,LastData,-4,3); 
  MinMax(TheData,LastData,TheMin,TheMax); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:10:0,' Max=',TheMax:10:0); 
  TextColor(0,0,255); 
  MakeHistogramInt(TheData,LastData,trunc(TheMin),trunc(TheMax),TheHist); 
  DrawHistogram(TheHist,3-(-4)+1); 
  TextColor(0,0,0); 
  {*} 
  writeln('Losowanie z zakresu <-5.5,5.5>'); 
  RandomRange(TheData,LastData,-5.5,5.5); 
  MinMax(TheData,LastData,TheMin,TheMax); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
  TextColor(0,0,255); 
  MakeHistogram(TheData,LastData,TheMin,TheMax,TheHist,10); 
  DrawHistogram(TheHist,10); 
  (*TextColor(255,0,0); 
  MakeHistogramTrick(TheData,LastData,TheMin,TheMax,TheHist,10); 
  WriteHistogram(TheHist,10); *) 
  TextColor(0,0,0); 
  {*} 
  writeln('Losowanie 1/random'); 
  RandomQuotient(TheData,LastData); 
  MinMax(TheData,LastData,TheMin,TheMax); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
  TextColor(0,0,0); 
  {*} 
  writeln('Suma 3 funkcji Random'); 
  RandomSumm(TheData,LastData,3); 
  MinMax(TheData,LastData,TheMin,TheMax); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
  TextColor(0,0,0); 
  {*} 
  writeln('Suma 9 funkcji Random'); 
  RandomSumm(TheData,LastData,9); 
  MinMax(TheData,LastData,TheMin,TheMax); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
  TextColor(0,0,0); 
  {*} 
  writeln('Rozk³ad pseudonormalny (9 funkcji Random) w zakresie <-5.5,5.5>'); 
  RandomPseudoNorm(TheData,LastData,9,-5.5,5.5); 
  MinMax(TheData,LastData,TheMin,TheMax); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
  TextColor(0,0,255); 
  MakeHistogram(TheData,LastData,TheMin,TheMax,TheHist,10); 
  DrawHistogram(TheHist,10); 
  (*TextColor(255,0,0); 
  MakeHistogram(TheData,LastData,-5.5,5.5,TheHist,10);
  WriteHistogram(TheHist,10);*) 
  TextColor(0,0,0); 
  {*} 
  writeln('Rozk³ad ukoœny (6 funkcje Random) w zakresie <-5.5,5.5>'); 
  RandomProduct(TheData,LastData,6,-5.5,5.5); 
  MinMax(TheData,LastData,TheMin,TheMax); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
  TextColor(0,0,255); 
  MakeHistogram(TheData,LastData,TheMin,TheMax,TheHist,10); 
  DrawHistogram(TheHist,10); 
  TextColor(0,0,0); 
end.
