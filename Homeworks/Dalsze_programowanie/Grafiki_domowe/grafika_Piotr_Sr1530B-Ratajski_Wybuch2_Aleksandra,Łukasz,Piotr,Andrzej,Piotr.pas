Program wybuch2; 

var 
   q,w,e,r,t,y:integer; 

 

Begin 
  q:=1;
  w:=0;
  e:=0;
  r:=200;
  t:=0;
  y:=45;
  while t<100
  
do begin
Pen( r,e,t,8 );
Line( 12, t,100 ,100 );

Line(12,t,t,688);
Fill( 100,t );
delay(100);
t:=t+1;

end;

while e<1000
do begin
Ellipse( 2,e ,e ,t );
Brush( 12,e ,23,50);
MoveTo( e,100 );
delay(300);
e:=e+190;
end;
while w<10
do begin
Coordinates( t,w );
Fill( w,39 );
Pen( w,w,39,230 );
MoveTo( 12,w );
Font( 12,w ,3 );
delay(23);

w:=w+12;



end; clear;
end.
 