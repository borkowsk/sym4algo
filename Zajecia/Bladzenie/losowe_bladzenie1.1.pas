Program Losowe_b��dzenie1; 
{Losowe b��dzenie w obcym �rodowisku} 

const 
   s=500;    
var 
   x,y:integer; 

begin 
  ellipse(0,0,s-1,s-1); 
  pen(1,128,0,128);
  
  x:=s div 2; 
  y:=s div 2; 
  repeat 
  point(x,y);
  x:=x+random(3)-1;
  y:=y+random(3)-1;
  until IsEvent; 
  
end.
