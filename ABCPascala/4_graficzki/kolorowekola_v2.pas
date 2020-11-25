Program KoloroweKo�a; 
{Losowo polozone i pokolorowane ko�a} 
var 
   width,height:integer;    

procedure wylosuj_kolor; 

var 
   r,g,b:integer; 
begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Pen(1,r,g,b); 
end; 


procedure wylosuj_wype�nienie; 
var 
   r,g,b:integer; 
begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Brush(1,r,g,b); 
end; 

procedure dodaj_ko�o; 
var 
   x,y,r:integer; 
begin 
  x:=random(width); 
  y:=random(height); 
  r:=random(30); 
  Ellipse(x-r,y-r,x+r,y+r); 
end; 

begin 
  writeln('podaj d�ugo�� i szeroko�� okna:');
  readln(width);
  readln(height);
  
  While true  do 
    begin 
      wylosuj_kolor; 
      wylosuj_wype�nienie;       
      dodaj_ko�o; 
    end; 
end.
