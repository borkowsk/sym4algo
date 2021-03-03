program liczby_zespolonefinal; {to jest 1 program na obydwie prace domowe, nalezy wybrac rownanie} 


var 
   x1, x2, y2, y1,i:integer; 
   a,b,c,d:real; 
   n,g:integer; 
   j,licznik:integer; 

procedure czytanie; 

begin 
  TextColor( 202, 0, 0); 
  Font( 20, 0, 4000); 
  writeln('Welcome to "COMPLEX VISUALIZATION" v.2.0'); 
  Font( 20, 0, 120); 
  writeln ('Choose the operation you want to visualize:'); 
  writeln (' "1" for addition, "2" for multiplication'); 
  
  read (n); 
 
end; 

procedure podzia³ka; 

var 
   a, b, c, d: integer; 
begin 
  b:=0; 
  d:=0; 
  pen (1,192, 192, 192); 
  for a:=0 to 100 do 
    begin 
      line (b, d+10*a, b+1000, d+10*a); 
      line (b+10*a, d, b+10*a, d+1000); 
    end; 
end; 

procedure os_wspolrzednych; 

var 
   r,s,v:integer; 
begin 
  pen (3, 0,0,0); 
  moveto (500, 0); 
  lineto (500, 1000); 
  moveto (0, 300); 
  lineto (1000, 300); 
  s:=40; 
  v:=0; 
  for r:=1 to 13 do 
    begin 
      moveto (498, 300+s); 
      lineto(502,300+s); 
      moveto (498, 300-s); 
      lineto (502,300-s); 
      moveto (500+s,298); 
      lineto (500+s,302); 
      moveto (500-s,298); 
      lineto(500-s,302); 
      moveto (480,300+40*v); 
      font (6, 0, 80); 
      write('-', v); 
      moveto (480,300-40*v); 
      write(v); 
      moveto (500+40*v, 305); 
      write (v); 
      moveto (500-40*v,305); 
      write ('-',v); 
      s:=s+40; 
      v:=v+1; 
    end; 
end; 

procedure click; 

begin 
  event (j,x1,y1); 
  if j=2 then 
    begin 
      ellipse (x1-2, y1-2, x1+2,y1+2); 
      moveto(x1,y1); 
      font (8,0,80); 
      TextColor( 0,0,128); 
      Pen( 3,0,0,128 ); 
      write ('Z1:x=',(x1-500)/40:3:2,'y=',(300-y1)/40:3:2); 
    end; 
  event (j,x2,y2); 
  if j=2 then 
    begin 
      Pen( 3,0,64,64); 
      ellipse (x2-2, y2-2, x2+2,y2+2); 
      moveto(x2,y2); 
      textcolor( 0, 64, 64); 
      write ('Z2:x=',(x2-500)/40:3:2,'y=',(300-y2)/40:3:2); 
    end; 
end; 

procedure rysowanie_dodawania; 

var 
   z,¿ :integer; 
begin 
  z:=(x1-500)+(x2-500); 
  ¿:=(y1-300)+(y2-300); 
  moveto (500+z, ¿+300); 
  TextColor( 202, 0, 0 ); 
  write('Z3:x=',z/40:3:2,'y=',¿/40:3:2); 
  moveto (z+500, 300-¿); 
  pen(3, 202, 0, 0 ); 
  ellipse (z+500-2, ¿+300-2,z+500+2, ¿+300+2); 
end; 

procedure rysowanie_mnozenia; 

var 
   x3, y3, x4,y4:integer; 
   z,¿:integer; 
begin 
  x3:=(x1-500); 
  y3:=(300-y1); 
  x4:=(x2-500); 
  y4:=(300-y2); 
  z:=(x3*x4)-(y3*y4); 
  ¿:=(x3*y4)+(x4*y3); 
  moveto (round(z/40)+500,300-round(¿/40)); 
  TextColor( 202, 0, 0 ); 
  write('Z3:x=',z/1600:3:2,'y=',¿/1600:3:2); 
  moveto (round(z/40)+500, 300-round(¿/40)); 
  pen(3, 202, 0, 0 ); 
  ellipse (round(z/40)+500, 300-round(¿/40)-2, round(z/40)+500+2, 300-round(¿/40)+2); 
end; 

procedure koncowka; 

begin 
  font(15,0,4000); 
  TextColor( 202, 0, 0); 
  writeln ('Do you feel like checking another calculation ?'); 
  writeln ('If yes, press "1", if you want to quit, press "2"'); 
  read (g); 
end; 

procedure programik; 

begin 
   czytanie; 
  clear; 
   podzia³ka; 
  os_wspolrzednych; 
  moveto (30,530); 
  font(11,0,4000); 
  TextColor( 202, 0, 0); 
  writeln ('Now pick the localization of your complex numbers by clicking on the screen!'); 
  moveto (30,560); 
  writeln('When finished, press any key'); 
  click; 
  font (8,0,80); 
  case n of 
    1: 
      rysowanie_dodawania; 
    2: 
      rysowanie_mnozenia; 
  end; 
  repeat 
  until isevent; 
  clear; 
   koncowka; 
  clear; 
end; 

begin 
  repeat 
    programik 
  until g=2; 
  TextColor( 202, 0, 0); 
  font(15,0,4000); 
  writeln ('thank you, it was a real pleasure:)'); 
end.