{Grupa:  
Zuzanna Rutkowska, Karolina Kasperska, Olga Koz³owska, Piotr Harland 
} 
{Za du¿o zmiennych globalnych i brak ich w procedurach ale fajny pomysl}
Program butterfly; 
var 
   j,i,k,l,a,b,c,d,x,y,t,r,ruch1,ruch2: integer; 

procedure t³o; 

begin 
  brush(1,204,253,237); 
  rectangle(0,25,650,800); 
end; 

procedure kwiatek; 

begin 
  pen(2,7,145,4); 
  line(325,410,310,760); 
  pen(1,0,0,0); 
  ellipse(300,340,360,400); 
  brush(1,248,24,192); 
  ellipse(305,280,365,340); 
  brush(1,248,24,192); 
  ellipse(360,330,420,390); 
  brush(1,248,24,192); 
  ellipse(330,390,390,450); 
  brush(1,248,24,192); 
  ellipse(265,385,325,445); 
  brush(1,248,24,192); 
  ellipse(245,320,305,380); 
  brush(1,255,255,128); 
end; 

procedure rozwin; 

begin 
  i:=x-150; 
  j:=y; 
  k:=x+150; 
  l:=y; 
  a:=x-150; 
  b:=y; 
  c:=x+150; 
  d:=y; 
  t:=0; 
  r:=0; 
  while t<95 do 
    begin 
      moveto(i,j); 
      pen(3,255,255-r,0); 
      lineto(x, y); 
      i:=i+1; 
      j:=j-1; 
      moveto(k,l); 
      pen(3,255-r,255,0+r); 
      lineto(x, y); 
      k:=k-1; 
      l:=l-1; 
      moveto(a,b); 
      pen(3,255-r,255,0+r); 
      lineto(x, y); 
      a:=a+1; 
      b:=b+1; 
      moveto(c,d); 
      pen(3,255,255-r,0+r); 
      lineto(x, y); 
      c:=c-1; 
      d:=d+1; 
      t:=t+1; 
      r:=r+2; 
    end; 
end; 

procedure zloz; 

begin 
  t:=0; 
  while t<=95 do 
    begin 
      moveto(i,j); 
      pen(3,204,253,237); 
      lineto(x, y); 
      i:=i-1; 
      j:=j+1; 
      moveto(k,l); 
      pen(3,204,253,237); 
      lineto(x, y); 
      k:=k+1; 
      l:=l+1; 
      moveto(a,b); 
      pen(3,204,253,237); 
      lineto(x, y); 
      a:=a-1; 
      b:=b-1; 
      moveto(c,d); 
      pen(3,204,253,237); 
      lineto(x, y); 
      c:=c+1; 
      d:=d-1; 
      t:=t+1; 
    end; 
end; 

procedure losuj; 

begin 
  ruch1:=random(2); 
  ruch2:=random(2); 
end; 

procedure ruch; 

begin 
  if ruch1=1 then 
    x:=x+4 
  else 
    x:=x-4; 
  if ruch2=1 then 
    y:=y+4 
  else 
    y:=y-4; 
end; 

procedure koniec; 

begin 
  x:=340; 
  y:=310; 
  kwiatek; 
  rozwin; 
  delay(70); 
  zloz; 
  kwiatek; 
  delay(70); 
end; 

procedure ClearEvent; 
{Wczytuje jedno zdarzenie i ignoruje jego tresc} 

var 
   a,b,c:integer; 
begin 
  Event(a,b,c); 
end; 

begin 
  x:=300; 
  y:=300; 
  textcolor(0,64,128); 
  font(12,0,1); 
  write('Wciœnij klawisz ¿eby motyl usiad³ na kwiatku :D'); 
  t³o; 
  while not isevent do 
    begin 
      kwiatek; 
      rozwin; 
      zloz; 
      t³o; 
      kwiatek; 
      losuj; 
      ruch; 
    end; 
  ClearEvent; 
  while not isevent do 
    koniec; 
end.
