program GosiaPiotrekMichal; 

const 
   n=0; 
var 
   x,y,a,b,w,z: integer; 

procedure kwadraciki; 

begin
 
  x:=0; 
  a:=0; 
  while x<62 do 
    begin 
      rectangle(10+a, 10+b, 20+a, 20+b); 
      x:=x+1; 
      a:=a+11; 
    end; 
end; 

procedure p; 

begin 
  w:=random(255); 
  brush( 50,a+b,w*b,w); 
end; 

procedure wypelnienie; 

var 
   i,r,g,b:integer; 
begin 
  i:=0; 
  r:=255; 
  g:=255; 
  b:=255; 
  Brush( i,r,g,b ); 
end; 

procedure pisak; 

var 
   i,r,g,b:integer; 
begin 
  i:=3; 
  r:=0; 
  g:=0; 
  b:=0; 
  Pen( i,r,g,b ); 
end; 

procedure romb; 

var 
   d,e,h,z:integer; 
begin 
  d:=0; 
  e:=0; 
  for h:=0 to 4 do 
    begin 
      delay(70); 
      line(250,200-d,270+d,220); 
      line(250,240+d,270+d,220); 
      line(250,200-d,230-d,220); 
      line(250,240+d,230-d,220); 
      delay(70); 
      Rectangle(160+e,130+e,340-e,310-e); 
      d:=d+30; 
      e:=e+20; 
    end; 
  d:=0; 
  e:=0; 
  for z:=0 to 1 do 
    begin 
      delay(70); 
      Ellipse(138-d,108-d,362+d,332+d); 
      delay(70); 
      d:=d+30; 
      e:=e+20; 
    end; 
end; 

begin 
PlaySound( 3,'D:\Documents and Settings\mag\Pulpit\grafika\elvine.wav' );   
  repeat
 
  z:=0; 
  while z<10 do 
    begin 
      y:=0; 
      b:=0; 
      while y<55 do 
        begin 
          moveto (10,b); 
          kwadraciki; 
          y:=y+1; 
          b:=b+11; 
          p; 
        end; 
      z:=z+1; 
    end; 
   
    pisak; 
    wypelnienie; 
    romb; 
    clear; 
  until n=1 
end.