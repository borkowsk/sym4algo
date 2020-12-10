

{ZAJÊCIA:czwartek 12.00
{TEAM: Kamil Górakowski
Jacek £agowski
Rados³aw Partyka
Tomasz Pastuszka}


Program dog; 
var 
   i,x,y,z:integer; 

procedure credits; 

begin 
  x:=0; 
  while x<20 do 
    begin 
      delay (300); 
      hide; 
      Fill (0,0); 
      Brush (1,30+x*10,50+x*10,10+x*20); 
      Font (10+x,0,40); 
      MoveTo (80,10); 
      WriteLn ('AUTORZY:'); 
      WriteLn ('Kamil Górakowski'); 
      WriteLn ('Jacek £agowski'); 
      WriteLn ('Rados³aw Partyka'); 
      WriteLn ('Tomasz Pastuszka'); 
      WriteLn ('>>TEAM czwartek 12.00'); 
      x:=x+1; 
    end; 
end; 

Procedure fala1; 

Begin 
  For i:=0 to 600 do 
    LineTo (i, round ((250+x)-50*sin(i/15))); 
  MoveTo (0,20); 
end; 

Procedure fala2; 

Begin 
  For i:=0 to 600 do 
    LineTo (i, round (260-50*sin(i/15))); 
  MoveTo (0,20); 
end; 

Procedure fala3; 

Begin 
  For i:=0 to 600 do 
    LineTo (i, round ((240-x)-50*sin(i/15))); 
  MoveTo (0,20); 
end; 

Procedure wave; 

Begin 
  x:=0; 
  z:=0; 
  While z<60 do 
    Begin 
      hide; 
      fala1; 
      fala3; 
      x:=x+z; 
      z:=z+1; 
      Delay (150); 
    end; 
end; 

procedure klops; 

begin 
  x:=0; 
  repeat 
    hide; 
    Fill(20,20); 
    Brush (1,100,0,150); 
    right(10+x); 
    forward(30); 
    right(10-x); 
    forward(30); 
    right(10+x); 
    forward(30); 
    right(10-x); 
    forward(30); 
    right(10+x); 
    forward(30); 
    right(10-x); 
    forward(30); 
    delay (30); 
    x:=x+1; 
  until x=270; 
end; 

procedure klops2; 

begin 
  x:=0; 
  repeat 
    hide; 
    Fill(20,20); 
    Brush (1,0,100,200); 
    right(30+x); 
    forward(140); 
    right(30-x); 
    forward(60); 
    right(30+x); 
    forward(140); 
    right(30-x); 
    forward(60); 
    right(30+x); 
    forward(140); 
    right(30-x); 
    forward(60); 
    x:=x+1; 
  until x=320; 
  delay (5); 
end; 

procedure tekst1; 

begin 
  x:=0; 
  while x<60 do 
    begin 
      Fill (0,0); 
      Brush (1,200,200,0-x*60); 
      Font (40+x*2,0-x,40); 
      MoveTo (30,0); 
      WriteLn ('D!G!taL !LLuS!on$'); 
      x:=x+1; 
    end; 
end; 

procedure tekst2; 

begin 
  x:=1; 
  repeat 
    Font (20,0,40); 
    MoveTo (140+x*2,470-x); 
    WriteLn('Spinal_Cord'); 
    x:=x+1; 
  until x=60; 
  delay(5); 
end; 

Procedure trawnik; 

Begin 
  i:=0; 
  x:=0; 
  y:=0; 
  MoveTo (0, 350); 
  x:=-1; 
  Pen (3,100,200,0); 
  Brush (1,100, 200, 0); 
  For i:=1 to 5000 do 
    Begin 
      y:=300+x*20+random(10); 
      LineTo (i,y+0); 
      x:= -1 * x; 
      i:=i+5; 
    end; 
  Fill(0,500); 
  begin 
    Brush (1,40,80,130); 
    Fill(0,0); 
  end; 
end; 

Procedure main; 

begin 
  begin 
  end; 
  x:=0; 
  y:=0; 
  begin 
    Pen (1,130,90,0); 
    Brush (1,130,90,0); 
    {tuluw} 
    Rectangle (250,240,500,340); 
    Rectangle (485,340,500,380); 
    Rectangle (475,340,460,380); 
    Rectangle (335,340,350,380); 
    Rectangle (360,340,375,380); 
    Rectangle (500,240,550,250); 
  end; 
  begin 
    Pen (1,80,0,0); 
    Brush (1,80,10,10); 
    Rectangle (250,240,270,260); 
  end; 
  {oczy} 
  begin 
    Pen (1,0,0,0); 
    Brush (1,250,250,250); 
    Ellipse (300,250,330,260); 
    Ellipse (335,250,365,260); 
  end; 
  begin 
    Pen (1,0,0,0); 
    Brush (1,50,50,50); 
    Ellipse (310,250,320,260); 
    Ellipse (345,250,355,260); 
  end; 
  begin 
    {uszy} 
    hide; 
    PenUp; 
    SetPosition (340,240); 
    Pen (11,130,90,0); 
    Brush (1,130,90,0); 
    PenDown; 
    Right (45); 
    Forward (20); 
    Right (135); 
    Forward (14); 
    Right (-135); 
    Forward (20); 
    Right (135); 
    Forward (14); 
  end; 
  begin 
    Pen (2,0,0,0); 
    PenUp; 
    SetPosition (250,305); 
    PenDown; 
    Left (45); 
    Forward (20); 
    Right (260); 
    Forward (20); 
    Left (-110); 
    Forward (20); 
    Right (250); 
    Forward (20); 
    Right (-280); 
    Forward (20); 
  end; 
  begin 
    Pen (1,160,160,160); 
    Brush (1,160,160,160); 
    Rectangle (50,250,160,370); 
    Ellipse (50,200,160,300); 
  end; 
  begin; 
    MoveTo(65,250); 
    Font(13,0,20); 
    WriteLn('R.I.P.'); 
MoveTo(65,280); 
    Font(12,0,20); 
    WriteLn('Pavlov'); 
  end; 
end; 

Procedure dream1; 

begin 
x:=0;
  repeat
  for x:=0 to 3 do
  
    begin 
     delay (200); 
      Pen (1,160,160,160); 
      Brush (1,250,250,250); 
      Ellipse (320,215,330,220); 
       
    end; 
    
      for x:=0 to 3 do
    begin 
     
      Pen (1,160,160,160); 
      Brush (1,250,250,250); 
      Ellipse (340,195,370,210); 
       delay (200); 
    end;
    
       for x:=0 to 3 do 
    begin 
     
      Pen (1,160,160,160); 
      Brush (1,250,250,250); 
      Ellipse (365,160,430,190); 
       delay (200); 
    end; 
  
     for x:=0 to 3 do
    begin 
      Pen (1,160,160,160); 
      Brush (1,250,250,250); 
      Ellipse (290,50,500,150); 
       delay (200); 
    end; 
 
  
     for x:=3 to 5 do 
    begin 
      Pen (1,180,180,150); 
      Brush (1,180,180,150); 
      Rectangle (338,90,450,110); 
      Ellipse (320,80,350,100); 
      Ellipse (320,100,350,120); 
      Ellipse (435,80,465,100); 
      Ellipse (435,100,465,120); 
       delay (50); 
    end; 
    x:=x+1;
   until x=5;
     
end; 

begin
hide;
credits;
clear;
wave;
clear;
tekst1;
klops;
clear;  
klops2; 
tekst2;
clear;
trawnik;
main;
dream1;
end. 
   