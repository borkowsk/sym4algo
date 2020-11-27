{grupa: Karolina Nowocin,Adam Fidusiewicz, Kamil Stankiewicz, £ukasz Kijak, Adam Królikowski}
{u¿yte funkcje graficzne: MoveTo,Brush,Rectangle,Font,TextColor,ellipse,
Fill,Pen,LineTo,Font }
program praca; 


procedure niebo; 

begin 
  brush(1,200,150,0); 
  rectangle(0,0,500,600); 
end; 

procedure gwiazda1; 

begin 
  moveto(75,396); 
  TextColor( 255,255,255 ); 
  Font( 30,0 ,1200 ); 
  writeln('*'); 
end; 

procedure gwiazda2; 

begin 
  moveto(403,67); 
  TextColor( 255,255,255 ); 
  Font( 30,0 ,1200 ); 
  writeln('*'); 
end; 

procedure gwiazda3; 

begin 
  moveto(300,83); 
  TextColor( 255,255,255 ); 
  Font( 35,0 ,1200 ); 
  writeln('*'); 
end; 

procedure gwiazda4; 

begin 
  moveto(400,470); 
  TextColor( 255,255,255 ); 
  Font( 25,0 ,1200 ); 
  writeln('*'); 
end; 

procedure gwiazda5; 

begin 
  moveto(26,34); 
  TextColor( 255,255,255 ); 
  Font( 40,0 ,1200 ); 
  writeln('*');
end;

procedure gwiazda6; 

begin 
  moveto(400,291); 
  TextColor( 255,255,255 ); 
  Font( 55,0 ,1200 ); 
  writeln('*'); 
end; 

procedure gwiazda7; 

begin 
  moveto(236,477); 
  TextColor( 255,255,255 ); 
  Font( 30,0 ,1200 ); 
  writeln('*'); 
end; 

procedure gwiazda8; 

begin 
  moveto(218,19); 
  TextColor( 255,255,255 ); 
  Font( 30,0 ,1200 ); 
  writeln('*'); 
end; 

procedure gwiazda9; 

begin 
  moveto(365,37); 
  TextColor( 255,255,255 ); 
  Font( 30,0 ,1200 ); 
  writeln('*'); 
end; 

procedure ksiezyc; 

begin 
  brush(1,192,192,192); 
  ellipse(50,150,400,450); 
end; 

Procedure domek; 

begin 
  brush(1,200,150,0); 
  Rectangle( 70,80 ,250 ,250 ); 
  moveto(150,10); 
  lineto(300,110); 
  lineto(20,110); 
  lineto(150,10); 
  brush(1,0,0,30); 
  fill(152,20); 
  fill(152,80); 
  fill(152,90); 
  Rectangle( 120,250 ,160 ,200 ); 
  brush(1,10,90,250); 
  Rectangle( 220,170 ,140 ,130 ); 
end; 

procedure E_T; 

begin 
  brush(1,0,200,0); 
  Ellipse(300 ,247 ,350 ,295 ); 
  pen(8,0,200,0); 
  moveto(322,293); 
  lineto(322,333); 
  lineto(341,359); 
  moveto(322,333); 
  lineto(293,354); 
  brush(1,0,0,0); 
  ellipse(290,258,326,282); 
  ellipse(353,257,325,290); 
  moveto(293,299); 
  lineto(347,323); 
  pen(5,0,150,0); 
  moveto(293,299); 
  lineto(271,281); 
  moveto(293,299); 
  lineto(278,295); 
  moveto(293,299); 
  lineto(274,308); 
end; 

begin 
  niebo; 
  delay(300); 
  gwiazda1; 
  delay(200); 
  gwiazda2; 
  delay(300); 
  gwiazda3; 
  delay(400); 
  gwiazda4; 
  delay(500); 
  gwiazda5; 
  delay(600); 
  gwiazda6; 
  delay(700); 
  gwiazda7; 
  delay(800); 
  gwiazda8; 
  delay(900); 
  gwiazda9; 
  delay(1000); 
  ksiezyc; 
  delay(1100); 
  domek; 
  delay(1200); 
  E_T; 
  delay(300); 
  moveto(10,512); 
  TextColor( 200,150,0 ); 
  Font( 30,0 ,1200 ); 
  writeln('E.T. GO HOME !!'); 
delay(3000);
end.
