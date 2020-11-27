Program MrówkaL;

const
last=200;
n_mrówek=1;
gestosc=0.01;
czas=0;
szerokosc=3;{Nie mniej ni¿ 3}

type
    mrówka=record
     x:integer;
     y:integer;
     k:integer;
    end;
    swiat=array[1..last,1..last] of boolean;     
    mrówki=array[1..n_mrówek] of mrówka;
    
var
world:swiat;
mrowisko:mrówki;

procedure init(var world:swiat; var mrowisko:mrówki);
var 
 i,j:integer;
begin
 for i:=1 to last do
  for j:=1 to last do
   if random<gestosc then
    world[i,j]:=true
   else
    world[i,j]:=false;
 for i:=1 to n_mrówek do
  begin
   mrowisko[i].x:=1+random(last);
   mrowisko[i].y:=1+random(last);
   mrowisko[i].k:=random(4);
  end;
  
 {Pierwsze rysowanie}
 for i:=1 to last do
  for j:=1 to last do
   if not world[i,j] then
    begin
     brush(1,0,0,0);
     rectangle(szerokosc*i-szerokosc,szerokosc*j-szerokosc,szerokosc*i,szerokosc*j);
    end;
end;

procedure przeliczanie(var world:swiat; var mrowisko:mrówki);
var
 i:integer; 
begin
 for i:=1 to n_mrówek do
  begin
   world[mrowisko[i].x,mrowisko[i].y]:=not world[mrowisko[i].x,mrowisko[i].y];
   
   {rysowanie}
   if world[mrowisko[i].x,mrowisko[i].y] then
    brush(1,255,255,255)
   else
    brush(1,0,0,0);
   rectangle(szerokosc*mrowisko[i].x-szerokosc,szerokosc*mrowisko[i].y-szerokosc,szerokosc*mrowisko[i].x,szerokosc*mrowisko[i].y);
    
   if mrowisko[i].k=0 then
    if mrowisko[i].x>1 then
     mrowisko[i].x:=mrowisko[i].x-1
    else
     mrowisko[i].x:=last;
     
   if mrowisko[i].k=1 then
    if mrowisko[i].y>1 then
     mrowisko[i].y:=mrowisko[i].y-1
    else
     mrowisko[i].y:=last;
   
   if mrowisko[i].k=2 then
    if mrowisko[i].x<last then
     mrowisko[i].x:=mrowisko[i].x+1
    else
     mrowisko[i].x:=1;
   
   if mrowisko[i].k=3 then
    if mrowisko[i].y<last then
     mrowisko[i].y:=mrowisko[i].y+1
    else
     mrowisko[i].y:=1;  
   
   if world[mrowisko[i].x,mrowisko[i].y] then
    mrowisko[i].k:=(mrowisko[i].k + 1) mod 4
   else
    mrowisko[i].k:=(mrowisko[i].k + 3) mod 4;
  end;  
end;



begin
init(world,mrowisko);
repeat
przeliczanie(world,mrowisko);
delay(czas);
until IsEvent; 

end.
