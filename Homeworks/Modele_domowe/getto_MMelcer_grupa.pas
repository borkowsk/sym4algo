{Prac� wykonali: Marta Melcer, Blanka Naborowska, Marcin Czaban,
 pozosta�e osoby nie wyrazi�y ch�ci wsp�pracy}

Program Getto; {jeden z 6 zrobionych przez nas program�w}

type 
   agent=record 
        alife:boolean; 
        race:integer; 
        stres:real; 
   end; 

   const 
   Last=50; 
   Side=10; 
   ProbAlife=0.66; 
   HowManyRaces=5; 
type 
   world=array[1..Last,1..Last] of agent; 

procedure Init(var Tab:world); 
{Inicjuje �wiat wg. zadanych parametr�w} 

var 
   i,j:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if random<ProbAlife then 
        begin 
          Tab[i,j].alife:=true; 
          Tab[i,j].stres:=0; 
          Tab[i,j].race:=random(HowManyRaces); 
        end 
      else 
        Tab[i,j].alife:=false; 
end; 

function SElem(var Tab:world;race:integer;k,l:integer):integer; 
{Sprawdza czy s�siad istnieje i jest �ywy i pozwala} 
{doliczy� s�siada do sumy stres�w je�li jest innej "rasy"} 

begin 
  if (k>0)and(l>0)and(k<=Last)and(l<=last) and(Tab[k,l].alife)and(Tab[k,l].race<>race) then 
    SElem:=1 
  else 
    SElem:=0; 
end; 

{procedure CalculateStres(var Tab:world); }
{Oblicza aktualne stresy dla wszystkich agent�w} 
{
var 
   i,j:integer; 
   cr:integer; }
   {"Current race" - zmienna pomocnicza} 
{   Summ:integer;} 
   {Suma stres�w} 
{begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].alife then }
      {Liczy si� tylko �ywym} 
{        begin 
          cr:=Tab[i,j].race; }
          {Sprawdzamy s�siedztwo Von Neumana} 
{          Summ:=SElem(Tab,cr,i+1,j)+ SElem(Tab,cr,i-1,j) + SElem(Tab,cr,i,j+1)+ SElem(Tab,cr,i,j-1); 
          Tab[i,j].stres:=Summ/4; }
          {czterech s�siad�w} 
{        end; 
end; }

procedure CalculateStresM(var Tab:world);
{Oblicza aktualne stresy dla wszystkich agent�w}
var
i,j:integer;
cr:integer; {"Current race" - zmienna pomocnicza}
Summ:integer; {Suma stres�w}
begin
for i:=1 to Last do
for j:=1 to Last do
if Tab[i,j].alife then
begin
cr:=Tab[i,j].race;
{Sprawdzamy s�siedztwo 8 sp�jne}
Summ:=SElem(Tab,cr,i+1,j) + SElem(Tab,cr,i-1,j)
+SElem(Tab,cr,i,j+1) + SElem(Tab,cr,i,j-1)
+SElem(Tab,cr,i+1,j+1) + SElem(Tab,cr,i-1,j-1)
+SElem(Tab,cr,i-1,j+1) + SElem(Tab,cr,i+1,j-1);
{Maksymalnie o�miu s�siad�w mo�e by� innych}
Tab[i,j].stres:=Summ/8;
end;
end;

procedure ChangeBorder(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,0,round(v),0); 
end; 

procedure ChangeFill(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Brush(1,round(v*0.7),round(v*0.3),round(v*0.3)); 
end; 

procedure swap( var cell1,cell2: agent); 

var 
   pom:agent; 
begin 
  pom:=cell1; 
  cell1:=cell2; 
  cell2:=pom; 
end; 

procedure MonteCarloStep(var Tab:world); 

var 
   a,steplenght,i,j,ni,nj:integer; 
begin 
  steplenght:=sqr(Last); 
  {Ile losowa�} 
  for a:=1 to steplenght do 
    begin 
      i:=1+random(Last); 
      {Kt�ra kom�rka} 
      j:=1+random(Last); 
      {Im wi�kszy stres tym �atwiej si� przeprowadza} 
      if (Tab[i,j].alife)and(random<Tab[i,j].stres) then 
        begin 
          {Trzeba znale�� puste miejsce} 
          repeat 
            ni:=1+random(Last); 
            nj:=1+random(Last); 
          until not Tab[ni,nj].alife; 
          {I zamieni� zawarto�ci kom�rek} 
          swap(Tab[i,j],Tab[ni,nj]); 
        end; 
    end 
end; 
{FUNKCJA - �REDNI STRES} 

function MeanStres(var Tab:World):real; 

var 
   Summ:real; 
   N:integer; 
   i,j:integer; 
begin 
  Summ:=0; 
  N:=0; 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].alife then 
        begin 
          N:=N+1; 
          Summ:=Summ+Tab[i,j].stres; 
        end; 
  if N>0 then 
    MeanStres:=Summ/N 
  else 
    MeanStres:=-9999; 
end; 

procedure Draw(var Tab:World;x,y,side:integer); 
{Rysuje �wiat za pomoc� elips pokazuj�cych ras� i stres} 

var 
   i,j:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].alife then 
        begin 
          ChangeBorder(Tab[i,j].stres,0,1); 
          ChangeFill(Tab[i,j].race,0,HowManyRaces-1); 
          ellipse(x+i*side-side,y+j*side-side, x+i*side,y+j*side); 
        end 
      else 
        begin 
          Brush(1,255,255,255); 
          Pen(1,255,255,255); 
          rectangle(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
        end; 
end; 
{PROGRAM G��WNY} 

var 
   TheWorld:World; 
   step:integer; 
   MSt:real; 
   log:text; 

begin
assign(log,'Getto4.log');
rewrite(log);
writeln(log,Last,'x',Last,' P=',ProbAlife,' R=',HowManyRaces);
Writeln(log,'Step',chr(9),'MeanStres');
step:=0;
Init(TheWorld);
repeat
MoveTo(0,Last*side+10);
Pen(1,0,0,0);
Brush(1,255,255,255);
CalculateStresM(TheWorld);
MSt:=MeanStres(TheWorld);
Writeln(Step,' ',MSt:10:8);
Writeln(log,Step,chr(9),MSt);
if step mod 10 = 0 then
Draw(TheWorld,10,10,Side);
MonteCarloStep(TheWorld);
Step:=Step+1;
until isEvent;
close(log);
end.