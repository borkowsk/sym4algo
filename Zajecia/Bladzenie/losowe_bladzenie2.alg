Program Losowe_b³¹dzenie2; 
{Losowe b³¹dzenie w obcym œrodowisku} 

const 
   s=500; 
var 
   x,y,licznik:integer; 

function distance(x1,y1,x2,y2:real):real;
begin
distance:=sqrt(sqr(x1-x2)+sqr(y1-y2));
end;

begin 
  licznik:=0;
  ellipse(0,0,s-1,s-1); 
  x:=s div 2; 
  y:=s div 2; 
  repeat 
    pen(1,licznik div 128,licznik div 1024,licznik mod 128); 
    point(x,y); 
    moveto(0,0);write(licznik);
    x:=x+random(3)-1; 
    y:=y+random(3)-1; 
    licznik:=licznik+1;
  until (distance(x,y,s/2,s/2)>s/2); 
end.
