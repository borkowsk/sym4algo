Program wielkanoc; 
{Karolina Lisiecka - Doktorantka ISS UW}
{Niezbyt wzorcowy kod, ale efekt godny pochwa³y}
Var 
   z,w,n,m,k,i:integer; 
   x,y:integer; 
   p,r,s:integer; 
   a,b,c,f:integer; 
   j,h: real; 

Procedure zajac; 

Begin 
  Pen (1,0,0,0); 
  Brush (5, 158, 158, 158); 
  Ellipse (75+x, 135+y, 100+x, 145+y); 
  Ellipse(50+x, 47+y, 60+x, 80+y); 
  Ellipse(70+x, 47+y, 80+x, 80+y); 
  Ellipse(50+x, 75+y, 80+x, 115+y); 
  Ellipse ( 50+x, 190+y,90+x, 200+y); 
  Ellipse(40+x, 115+y, 90+x, 190+y); 
  Brush (5, 255, 255, 255); 
  Ellipse (28+x, 161+y, 42+x, 176+y); 
  Brush (5, 39, 39, 39); 
  Ellipse (78+x,90+y,83+x,95+y); 
  Pen (1, 0,0,0); 
  Delay (200); 
end; 

Procedure trawka; 

Begin 
  MoveTo (0, 350); 
  m:=-1; 
  Brush (1,0, 202, 101); 
  For k:=1 to 5000 do 
    Begin 
      n:=350+m*20+random(10); 
      LineTo (k,n+20); 
      m:= -1 * m; 
      k:=k+5; 
    end; 
  Fill(450, 500); 
end; 

procedure pisklak; 

begin 
  z:=random (20); 
  pen (1,0,0,0) ; 
  brush (1,255, 255, 94); 
  ellipse (100+z, 200+z,150+z,250+z); 
  {brzuszek} 
  ellipse (110+z, 170+z, 140+z,200+z); 
  {glowka} 
  pen (4,255, 0, 0); 
  {nozki i dziub} 
  moveto (120 +z, 250+z); 
  lineto (110+z,265+z); 
  moveto(130+z,250+z); 
  lineto(140+z,265+z); 
  moveto (140+z,185+z); 
  lineto (150+z,175+z); 
  moveto(140+z,185+z); 
  lineto (150+z,185+z); 
  pen (4,0,0,0); 
  moveto (130+z,178+z); 
  lineto (132+z,178+z); 
  pen (1,0,0,0); 
  moveto (200+z,210+z); 
  {skrzydelko prawe} 
  lineto (150+z,220+z); 
  moveto (200+z,220+z); 
  lineto(170+z, 195+z); 
  moveto(170+z,195+z); 
  lineto(150+z,220+z); 
  fill (170+z,210+z); 
  moveto (50+z,210+z); 
  {skrzydelko lewe} 
  lineto (100+z,220+z); 
  moveto (50+z,220+z); 
  lineto(80+z, 195+z); 
  moveto(80+z,195+z); 
  lineto(100+z,220+z); 
  fill (80+z,210+z); 
  for x:=1 to 11 do 
    begin 
      fill (80+z,210+z); 
      pen(1,0,0,0); 
      moveto (200+z,210+x+z); 
      {skrzydelko prawe} 
      lineto (150+z,220+z); 
      pen(1,255, 255, 94); 
      moveto (188+z,209+x+z); 
      {skrzydelko prawe} 
      lineto (150+z,220+z); 
      pen(1,0,0,0); 
      moveto (50+z,210+x+z); 
      {skrzydelko lewe} 
      lineto (100+z,220+z); 
      pen(1,255,255,94); 
      moveto (62+z,209+x+z); 
      {skrzydelko prawe} 
      lineto (100+z,220+z); 
    end; 
  for y:=1 to 11 do 
    begin 
      fill (80+z,210+z); 
      pen(1,0,0,0); 
      moveto (200+z,220-y+z); 
      {skrzydelko lewe} 
      lineto (150+z,220+z); 
      pen(1,255,255,94); 
      moveto (188+z,222-y+z); 
      {skrzydelko prawe} 
      lineto (150+z,220+z); 
      pen(1,0,0,0); 
      moveto (50+z,220-y+z); 
      {skrzydelko lewe} 
      lineto (100+z,220+z); 
      pen(1,255,255,94); 
      moveto (62+z,222-y+z); 
      {skrzydelko prawe} 
      lineto (100+z,220+z); 
    end; 
  fill (80+z,220+z); 
  fill (170+z,220+z); 
  pen (1,255,255,255); 
  brush(1,255,255,255); 
  rectangle (0+z,0+z,230+z,270+z); 
end; 

Procedure jajo ; 

Begin 
  k:=10; 
  p:=random (300); 
  r:=random (300); 
  s:=random (300); 
  For z:=1 to 50 do 
    Begin 
      MoveTo (0,400); 
      Brush (1,p+10*z,r+10*z,s+10*z); 
      Ellipse (200, 350-k, 300, 350+k); 
      k:=k+1; 
      Delay (30); 
    end; 
end; 

Procedure jajo_statyczne; 

Begin 
  MoveTo (0,400); 
  Brush (1,255, 128, 0); 
  Ellipse (200, 290, 300, 410); 
  MoveTo(200, 350); 
  For f:=1 to 100 do 
    LineTo(f+200, round(350-15*sin(4*f/10))); 
  Delay (30); 
end; 

Procedure jajo2; 

Begin 
  k:=10; 
  p:=random (300); 
  r:=random (300); 
  s:=random (300); 
  For z:=1 to 40 do 
    Begin 
      MoveTo (0,400); 
      Brush (1,p+10*z,r+10*z,s+10*z); 
      Ellipse (300, 350-k, 370, 350+k); 
      k:=k+1; 
      Delay (30); 
    end; 
end; 

Procedure jajo2_statyczne; 

Begin 
  MoveTo (0,400); 
  Brush (1,255, 255, 0); 
  Ellipse (300, 300, 370, 400); 
  MoveTo(302, 340); 
  For f:=1 to 65 do 
    LineTo(f+302, round(340-10*sin(10*f/10))); 
  Delay (30); 
end; 

Procedure jajo3; 

Begin 
  k:=10; 
  p:=random (300); 
  r:=random (300); 
  s:=random (300); 
  For z:=1 to 20 do 
    Begin 
      MoveTo (0,400); 
      Brush (1,p+10*z,r+10*z,s+10*z); 
      Ellipse (150, 350-k, 200, 350+k); 
      k:=k+1; 
      Delay (30); 
    end; 
end; 

Procedure jajo3_statyczne; 

Begin 
  MoveTo (0,400); 
  Brush (1,0, 255, 255); 
  Ellipse (150, 320, 200, 380); 
  MoveTo(155, 335); 
  For f:=1 to 44 do 
    LineTo(f+155, round(335-5*sin(7*f/10))); 
  Delay (30); 
end; 

Procedure jajo4 ; 

Begin 
  k:=10; 
  p:=random (300); 
  r:=random (300); 
  s:=random (300); 
  For z:=1 to 60 do 
    Begin 
      MoveTo (0,400); 
      Brush (1,p+10*z,r+10*z,s+10*z); 
      Ellipse (260, 320-k, 350, 320+k); 
      k:=k+1; 
      Delay (30); 
    end; 
end; 

Procedure jajo4_statyczne; 

Begin 
  Brush (1,255, 0, 128); 
  Ellipse (260, 250, 350, 400); 
  MoveTo(275, 290); 
  For f:=1 to 65 do 
    LineTo(f+275, round(290-10*sin(4*f/10))); 
  Delay (30); 
end; 

Procedure jajo5 ; 

Begin 
  k:=10; 
  p:=random (300); 
  r:=random (300); 
  s:=random (300); 
  a:=random(200); 
  b:=random(200); 
  For z:=1 to 20 do 
    Begin 
      MoveTo (0,400); 
      Brush (1,p+10*z,r+10*z,s+10*z); 
      Ellipse (350, 350-k, 400, 350+k); 
      k:=k+1; 
      Delay (30); 
    end; 
end; 

Procedure jajo5_statyczne; 

Var 
   f:integer; 
Begin 
  MoveTo (0,400); 
  Brush (1,0, 255, 0); 
  Ellipse (350, 320, 400, 380); 
  Begin 
    MoveTo(350, 350); 
    For f:=1 to 50 do 
      LineTo(f+350, round(350-10*sin(3*f/10))); 
    Delay (30); 
  end; 
end; 

Procedure przejscie ; 

Begin 
  Pen (1,0,0,0); 
  Brush (5,155, 155, 155); 
  Ellipse (85-x,340-y, 110-x,350-y) ; 
  Ellipse(110-x, 240-y, 120-x, 270-y); 
  Ellipse(130-x, 240-y, 140-x, 270-y); 
  Ellipse(110-x, 265-y, 140-x, 315-y); 
  Ellipse(100-x, 315-y, 150-x, 385-y); 
  Ellipse (95-x, 380-y,145-x,390-y); 
  Brush (5, 255, 255, 255); 
  Ellipse (148-x, 355-y,163-x, 370-y); 
  Brush (5, 0,0,0); 
  Ellipse (105-x, 282-y, 112-x, 287-y); 
  Delay (300); 
end; 

Begin 
  x:=10; 
  y:=150; 
  z:=1; 
  k:=random(6000); 
  trawka; 
  While z<45 do 
    Begin 
      Pen (1, 255,255,255); 
      Brush (5,255, 255, 255); 
      Rectangle (x+20, y-10,100+x,205+y); 
      x:=x+z; 
      y:=100+round(cos(z*2)*50); 
      z:=z+1; 
      zajac; 
    end; 
  z:=1; 
  While z<10 do 
    Begin 
      jajo4; 
      jajo5; 
      jajo; 
      jajo2; 
      jajo3; 
    end; 
  Begin 
    z:=-100; 
    x:=-800; 
    y:=-600; 
    jajo5_statyczne; 
    jajo4_statyczne; 
    jajo_statyczne; 
    jajo2_statyczne; 
    jajo3_statyczne; 
    For z:=-100 to -51 do 
      Begin 
        Pen (1,255,255,255); 
        Brush (5,255, 255, 255); 
        Rectangle (85-x,90-y,165-x,393-y); 
        x:=x-z-57; 
        y:=100+round(cos(-z*2)*60); 
        z:=z+1; 
        przejscie; 
      end; 
  end; 
  przejscie; 
  p:=random (300); 
  r:=random (300); 
  s:=random (300); 
  z:=random (300); 
  while not isevent do 
    Begin 
      pisklak; 
      TextColor(p,r,s); 
      Brush (1,255,255,255); 
      MoveTo (240,150); 
      Font(20,30, 800); 
      WriteLn('Weso³ych'); 
      MoveTo (480,80); 
      Font(20,-20, 800); 
      WriteLn ('Œwi¹t!'); 
      p:=p+3*z; 
      r:=r+100*z; 
      s:=s-20*z; 
    end; 
end.
