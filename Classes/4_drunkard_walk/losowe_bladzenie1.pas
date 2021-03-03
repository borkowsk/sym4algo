Program Losowe_b³¹dzenie1; 
{Losowe b³¹dzenie w obcym œrodowisku} 

const 
   width=500; 
   height=500; 
var 
   x,y:integer; 

begin 
  randomize(200);
  ellipse(0,0,width-1,height-1); 
  pen(1,128,0,128);
  
  x:=width div 2; 
  y:=height div 2; 
  repeat 
  x:=x+random(3)-1;
  y:=y+random(3)-1;
  point(x,y);
  until IsEvent; 
  
end.
