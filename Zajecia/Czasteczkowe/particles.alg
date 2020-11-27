Program Particles; 

Const 
   Last=100; 
   Width=500; 
   Height=500; 
   MaxMove=11; 
type 
   particle=record 
        x,y:integer; 
   end; 
   World=array[1..Last] of particle; 

Procedure RandomPosition(first,last:integer;var W:World); 

var 
   i:integer; 
Begin 
  for i:=first to last do 
    begin 
      W[i].x:=random(Width); 
      W[i].y:=random(Height); 
    end; 
end; 

Procedure DrawAll(first,last:integer;var W:World;r,g,b:integer); 

var 
   i:integer; 
Begin 
  Pen(1,r,g,b); 
  for i:=first to last do 
    Point(W[i].x,W[i].y); 
end; 

Procedure RandomMove(first,last:integer;var W:World); 

var 
   i,dx,dy,newx,newy:integer; 
Begin 
  for i:=first to last do 
    begin 
      dx:=MaxMove div 2 - random(MaxMove); 
      dy:=MaxMove div 2 - random(MaxMove); 
      W[i].x:=W[i].x+dx; 
      W[i].y:=W[i].y+dy; 
    end; 
end; 

var 
   TheWorld:World; 
   Step:integer; 
Begin 
  Step:=0;
  RandomPosition(1,Last,TheWorld); 
  DrawAll(1,last,TheWorld,0,0,0); 
  while true do 
    begin 
      delay(40); 
      DrawAll(1,last,TheWorld,(255+Step) mod 255,200,200); 
      {czyszczenie} 
      RandomMove(1,Last,TheWorld); 
      DrawAll(1,last,TheWorld,0,0,0); 
      {rysowanie na nowych pozycjachRandomMove(1,Last,TheWorld);} 
      Step:=Step+1;
    end; 
end.
