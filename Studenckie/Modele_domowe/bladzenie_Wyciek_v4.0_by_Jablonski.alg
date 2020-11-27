Program plywajacy_plankton; 

const 
   s=500; 
   width = s; 
   height = s; 
var 
   x,y: integer; 
   r,g,b,i: integer; 
   opcja: integer; 

   Label 666,376; 

Function Distance(x1,y1,x2,y2:real):real; 

begin 
  Distance:=sqrt(sqr(x1-x2)+sqr(y1-y2)); 
end; 

begin 
  376: i:=0; 
  brush(1,0,0,0); 
  TextColor( 255,255,255 ); 
  fill(0,0); 
  writeln('wybierz metode okreslania wspolrzednych poczatku wylewu (i wcisnij ENTER):'); 
  writeln('[1] srodek'); 
  writeln('[2] losowo'); 
  writeln('[3] zdefiniowane przez uzytkownika'); 
  read(opcja); 
  if opcja=1 then 
    begin 
      x:=s div 2; 
      y:=s div 2; 
    end; 
  if opcja=2 then 
    begin 
      x:=100 +random(401); 
      y:=x; 
    end; 
  if opcja=3 then 
    begin 
      writeln('Podaj wspolrzedna "x" poczatku wylewu (100 do 500):'); 
      read(x); 
      writeln('Podaj wspolrzedna "y" poczatku wylewu (100 do 500):'); 
      read(y); 
    end; 
  clear; 
  brush(1,0,0,0); 
  fill(0,0); 
  point(0,528); 
  brush(1,0,0,0); 
  textcolor(255,255,255); 
  writeln('punkt startu: ',x,',',y); 
  if (x=250) and (y=250) then 
    writeln('punkt startu: srodek'); 
  pen(1,255,255,255); 
  ellipse(0,0, width-1, height-1); 
  i:=0; 
  r:=0; 
  g:=0; 
  b:=0; 
  repeat 
    begin 
      i:=i+1; 
      if i mod 1000 =0 then 
        begin 
          r:=(r+1); 
          g:=(g+10); 
          b:=(b+15); 
        end; 
      if distance(width div 2, height div 2, x,y ) >= height div 2 then 
        goto 666; 
      pen(1,r,g,b); 
      point(x,y); 
      x:=x+random(3)-1; 
      y:=y+random(3)-1; 
      point(15,30); 
      brush(1,0,0,0); 
      TextColor( 255,255,255 ); 
      write(i); 
    end 
  until IsEvent; 
  666: TextColor( 255,255,255 ); 
  point (75,558); 
  writeln('czy uruchomic program ponownie?'); 
  writeln('[1] tak'); 
  writeln('[2] nie'); 
  read(opcja); 
  if opcja= 1 then 
    begin 
      clear; 
      brush(1,0,0,0); 
      fill(0,0); 
      point(0,0); 
      goto 376; 
    end; 
end.
