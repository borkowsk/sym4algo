Program Practicles; 

const 
   Last=500; 
type 
   particle=record 
        x,y:integer; 
   end; 
   world=array[1..Last] of particle; 

   const 
   Init_r=5; 
   MaxMove=5; 
   Width=500; 
   Height=500; 
   LogName='Particles.log';
   procedure RandomPosition1(first,last:integer;var W:world); 

var 
   i:integer; 

begin 

   for i:=first to last do 
    begin 
      W[i].x:=1+ random(width-1); 
      W[i].y:=1+ random(height-1); 
    end; 
end; 
procedure RandomPosition2(first,last:integer; var W:world;x,y,r:integer);
var
i,rr:integer;
alfa:real;
begin
for i:=first to last do
begin
rr:= 1;
alfa:=random*2*pi;
W[i].x:=round(x+sin(alfa)*rr);
W[i].y:=round(y+sin(alfa)*rr);
end;
end;




procedure DrawAll(first,last:integer; var W:world;r,g,b:integer); 

var 
   i:integer; 
begin 
  Pen(1,r,g,b); 
  For i:= first to last do 
    Point(W[i].x, W[i].y); 
end; 

Function Inside(x,y:integer): boolean; 

begin 
  inside:= (0<x)and(x<Width) and (0<y)and(y<Height); 
end; 
procedure InitPosition(first,last:integer;var W:world); 

var 
   i:integer; 

begin 

   for i:=first to last do 
    begin 
      W[i].x:=width div 2; 
      W[i].y:=height div 2;
      end;
      end; 
Procedure RandomMove(first,last:integer; Var W:world); 

var 
   i,dx,dy:integer; 
begin 
  for i:=first to last do 
    begin 
      dx:=MaxMove div 2-random(MaxMove); 
      dy:=MaxMove div 2-random(MaxMove); 
      if inside(W[i].x+dx,W[i].y+dy) then 
        begin 
          W[i].x:=W[i].x+dx; 
          W[i].y:=W[i].y+dy; 
        end; 
    end; 
end;
Function Distance (x1,y1,x2,y2:real):real;
begin
distance:=sqrt(sqr(x1-x2)+sqr(y1-y2));
end;
Function MeanDistance(first,last:integer;Var W:World;L:integer):real;
Var k,z,p1,p2:integer;
dist,summ:real;
Begin
z:=last-first+1;
summ:=0;
for k:=1 to L do
begin
p1:=first+random(z);
p2:=first+random(z);
dist:= distance (W[p1].x,W[p1].y,W[p2].x,W[p2].y);
summ:=summ+dist;
end;
if L>0 then
MeanDistance:=summ/L
else
MeanDistance:=-9999;
end; 

var
MDist:real;   
TheWorld:World;
Step:integer;
begin
rectangle(0,0,Width+1, Height+1);
Pen(1,255,50,50);
Point(Width,Height);
 if init_r>0 then
 RandomPosition2(1,Last,TheWorld,Width div 2,Height div 2, init_r)
 else
 RandomPosition1(1,Last,TheWorld);
 DrawAll(1,Last,TheWorld,0,0,0);
 step:=0;
 while not IsEvent do
 begin
 delay(80);
 
 DrawAll(1,last,TheWorld,255,255,255);
 RandomMove(1,Last,TheWorld);
 DrawAll(1,Last,TheWorld,0,0,0);
 Step:=Step+1;
 
 MDist:=MeanDistance(1,Last,TheWorld,Last div 10);
 
 MoveTo(0,0);
 Writeln(Step,' ',mDist:3:2);
 end;
 end.
{
Przepisa³em kod tak jak jest na stronie ale program nie dzia³a tak jak powinien.
Nie wiem jak w zwiazku z tym zrobic prace domowa.
}
