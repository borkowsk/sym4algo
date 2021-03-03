Program Getto;
{pisany wysoko nad Europ¹ i kawa³kiem Afryki}
(*						2011-02002 20:02
witam,
w drodze na wakacje, nie znaj¹c jeszcze ocen ostatecznych, uda³o mi
siê zrobiæ rozszerzenie getto, tak "na wszelki wypadek" :) szkoda mi
trochê nie pochwaliæ siê programem, który pisa³am z pe³nym
poœwiêceniem 10 000 metrów nad ziemi¹, wiêc korzystam z (wreszcie!)
uruchomionego internetu w kraju i wysy³am model do oceny.

¿yczê mi³ego pobytu za oceanem

Olga Górnicka
*)
type
 agent=record
 alife:boolean;
 race:integer;
 stres:real;
end;

const
 Last=50;
 Side=10;
 ProbAlife=0.5;
 HowManyRaces=3; 
 
type
 world=array[1..Last, 1..Last] of agent;
var
  prom:integer; {promieñ tablicy}
  
procedure Init(var Tab:world);
 var
  i,j:integer;
 begin
   write ('Jaki ma byæ promieñ s¹siedztwa?  ');
   readln(prom);
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

function SElem(var Tab:world;race:integer;K,L:integer):integer;
 begin
  begin
    if(K>0)and(L>0)
           and(K<=Last)
           and(L<=last)
           and(Tab[K,L].alife)
           and(Tab[K,L].race<>race)then 
      SElem:=1 
     else 
      SElem:=0;
 end;
 end;

procedure CalculateStres(var Tab:world);
  var
   i,j:integer;
   cr:integer;
   Summ:integer;
   x,y:integer;
   sas:integer; {liczba s¹siadów}
  begin
   sas:=(2*prom+1)*(2*prom+1)-1; {gdzieœ nad turcj¹ obliczam pole powierzchni o boku -promieñ do +promieñ i odejmujê agenta, dla którego stres liczê}
   for i:=1 to Last do
   for j:=1 to Last do
   if Tab[i,j].alife then
    begin
     cr:=Tab[i,j].race; 
     Summ:=0;
     for y:=-prom to prom do
      for x:=-prom to prom do {t¹ pêtlê pisa³am jakieœ 10 tys metrów nad morzem czarnym :) przesuwa siê po tablicy s¹siedztwa} 
       Summ:=Summ+SElem(Tab,cr,i+x,j+y);
     Summ:=Summ-SElem(Tab,cr,i,j);
     Tab[i,j].stres:=Summ/sas;
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
    
procedure Draw (var Tab:World;x,y,side:integer);
 var i,j:integer;
  begin
   for i:=1 to Last do 
   for j:=1 to Last do
   if Tab[i,j].alife then
    begin
     ChangeBorder (Tab[i,j].stres,0,1);
     ChangeFill (Tab[i,j].race,0,HowManyRaces-1);
     ellipse( x+i*side-side, y+j*side-side,x+i*side, y+j*side);
    end
   else
    begin
     Brush(1,255,255,255);
     Pen(1,255,255,255);
     rectangle(x+i*side-side, y+j*side-side,x+i*side, y+j*side);
    end;
  end;

procedure swap(var cell1,cell2:agent);
var pom:agent;
 begin
  pom:=cell1;
  cell1:=cell2;
  cell2:=pom;
 end; 

procedure MonteCarloStep(var Tab:world);
var a,steplenght,i,j,ni,nj:integer;
 begin 
  steplenght:=sqr(Last);
  for a:=1 to steplenght do 
   begin
    i:=1+random(Last); 
    j:=1+random(Last);    
     if(Tab[i,j].alife)and(random<Tab[i,j].stres) then
      begin
       repeat 
        ni:=1+random(Last);
        nj:=1+random(Last);
       until not Tab[ni,nj].alife;
       swap(Tab[i,j],Tab[ni,nj]);
       end;
      end
    end;
function MeanStres(var Tab:World):real;
 var Summ:real;N:integer; i,j:integer;
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
    

var 
TheWorld:World;
step:integer;
MSt:real;
log:text;

begin 
assign(log,'Getto4.log');
rewrite(log);
writeln(log,Last,'x',Last,'P=',ProbAlife,'R=',HowManyRaces);
Writeln(log,'Step',chr(9),'MeanStres');
step:=0;
Init(TheWorld);
repeat 
 MoveTo(0,Last*side+10);
 Pen(1,0,0,0);
 Brush(1,255,255,255);
 CalculateStres(TheWorld);
 MSt:=MeanStres(TheWorld);
 Writeln(Step,' ',MSt:10:8);
 Writeln(log,Step,chr(9),MSt);
 if step mod 10=0 then
  Draw(TheWorld,10,10,Side);
  MonteCarloStep(TheWorld);
  Step:=Step+1;
  until isEvent;close(log);
 end.