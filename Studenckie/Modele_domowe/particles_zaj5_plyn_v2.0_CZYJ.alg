Program plyn; 

Const 
   Last=500; 
Type 
   particle=record 
        x,y:integer; 
   end; 
   world=array[1..Last] of particle; 

   Const 
   init_r=-5; 
   MaxMove=5; 
   Width=500; 
   Height=500; 
   LogFileName='Particles.txt'; 

function Distance(x1,y1,x2,y2:real):real; 

begin 
  Distance:=sqrt(sqr(x1-x2)+sqr(y1-y2)); 
end; 

function MeanDistance(first,last:integer;Var W:world;L:integer):real; 

var 
   k,z,p1,p2:integer; 
   dist,summ:real; 
begin 
  z:=last-first+1; 
  summ:=0; 
  for k:=1 to L do 
    begin 
      p1:=first+random(z); 
      p2:=first+random(z); 
      dist:=distance(W[p1].x,W[p1].y,W[p2].x,W[p2].y); 
      summ:=summ+dist; 
    end; 
  if L>0 then 
    MeanDistance:=summ/L 
  else 
    MeanDistance:=-9999; 
end; 

Procedure RandomPosition2(first,last:integer;Var W:world;x,y,r:integer); 

Var 
   i,rr:integer; 
   alfa:real; 
Begin 
  For i:=first to last do 
    Begin 
      rr:=random(r); 
      alfa:=random*2*pi; 
      W[i].x:=round(x+sin(alfa)*rr); 
      W[i].y:=round(y+cos(alfa)*rr); 
    end; 
end; 

Procedure RandomPosition1(first,last:integer;Var W:world); 

Var 
   i:integer; 
Begin 
  For i:=first to last do 
    Begin 
      W[i].x:=1+random(Width-1); 
      W[i].y:=1+random(Height-1); 
    end; 
end; 

Procedure InitPosition(first,last:integer;Var W: world); 

Var 
   i:integer; 
Begin 
  For i:=first to last do 
    Begin 
      W[i].x:=Width div 2; 
      W[i].y:=Height div 2; 
    end; 
end; 

Procedure DrawAll(first,last:integer;Var W:world;r,g,b:integer); 

Var 
   i:integer; 
Begin 
  Pen(1,r,g,b); 
  For i:=first to last do 
    Point(W[i].x,W[i].y); 
end; 

Function Inside(x,y:integer):boolean; 

Begin 
  Inside:= (0<x)and(x<Width) and (0<y)and(y<Height); 
end; 

Procedure RandomMove(first,last:integer;Var W:world); 

Var 
   i,dx,dy:integer; 
Begin 
  For i:=first to last do 
    Begin 
      dx:=MaxMove div 2 - random(MaxMove); 
      dy:=MaxMove div 2 - random(MaxMove); 
      if inside(W[i].x+dx,W[i].y+dy) then 
        Begin 
          W[i].x:=W[i].x+dx; 
          W[i].y:=W[i].y+dy; 
        end; 
    end; 
end; 

var 
   TheWorld:World; 
   Step:integer; 
   mDist: real; 
   log: Text; 

Begin 
  Assign(log, LogFileName); 
  Rewrite(log); 
  Writeln(log,'Symulacja dyfunduj¹cych cz¹steczek'); 
  Writeln(log,'N;Init_R;Max_Move'); 
  Writeln(log,Last,';',Init_R,';',MaxMove); 
  Writeln(log); 
  Writeln(log,'Step;MeanDist'); 
  Rectangle(0,0,Width+1,Height+1); 
  Pen(1,255,50,50); 
  Point(Width,Height); 
  if init_r>0 then 
    RandomPosition2(1,Last,TheWorld,Width div 2,Height div 2,init_r) 
  else 
    begin 
      if init_r=-5 then 
        InitPosition(1,Last,TheWorld) 
      else 
        RandomPosition1(1,Last,TheWorld); 
    end; 
  DrawAll(1,last,TheWorld,0,0,0); 
  step:=0; 
  While not IsEvent do 
    Begin 
      DrawAll(1,last,TheWorld,200,255,255); 
      RandomMove(1,Last,TheWorld); 
      DrawAll(1,last,TheWorld,0,0,0); 
      Step:=Step+1; 
      mDist:=MeanDistance(1,Last,TheWorld,Last div 5); 
      MoveTo(0,0); 
      Writeln(step,' ',mDist:3:2); 
      Writeln(log,step,';',mDist); 
    end; 
  Writeln('The End'); 
  Close(log); 
end.