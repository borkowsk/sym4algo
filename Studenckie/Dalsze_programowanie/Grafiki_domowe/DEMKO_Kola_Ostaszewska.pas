Program KoloroweKola; 

const 
   width=200; 
   height=200; 
var 
   n: integer; 

procedure wylosuj_kolor; 

var 
   r,g,b:integer; 
begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Pen(1,r,g,b); 
end; 

procedure wylosuj_wypelnienie; 

var 
   r,g,b:integer; 
begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Brush(1,r,g,b); 
end; 

procedure dodaj_kolo; 

var 
   x,y,r:integer; 
begin 
  x:=100; 
  y:=100; 
  r:=random(40); 
  Ellipse(x-r,y-r,x+r,y+r); 
end; 

begin 
  n:=1; 
  repeat 
    begin 
      n:=n+1; 
      wylosuj_kolor; 
      wylosuj_wypelnienie; 
      dodaj_kolo; 
    end; 
  until n=5; 
end.
