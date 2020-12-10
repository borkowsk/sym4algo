{Grupa œroda 13,45
Jachym Pawe³ 7795
Priwieziencew Katarzyna 7523
Ro¿entalska Ewa 7705
Wyganowska Karolina 7558}

{Brak procedur. Poza tym OK}

Program Guma; 

Var 
   i,a,b,c :integer; 

Begin 
  MoveTo (165,190); 
  Font(10,15,300); 
  WriteLn ('kaszkiet'); 
  MoveTo(30,340); 
  Font(10,0,350); 
  WriteLn('gumowa r¹czka'); 
  MoveTo (270,240); 
  WriteLn('gumowa r¹czka'); 
  MoveTo(60,225); 
  WriteLn('gumowa g³ówka'); 
  MoveTo(220,450); 
  Font(10,280,350); 
  WriteLn('gumowe nó¿ki'); 
  Pen(10, 100,100,100); 
  {kolor szyji} 
  Line (225,260,225,270); 
  {szyja} 
  MoveTo (50,30); 
  Font(15,0,600); 
  TextColor(1,1,255); 
  WriteLn('CZ£OWIEK GUMA JEST WŒRÓD NAS!!!!!!!'); 
  MoveTo (20,80); 
  Font (15,0,400); 
  TextColor(1,255,1); 
  WriteLn('CZY PRZYPADKIEM NIE JEST '); 
  MoveTo (200,120); 
  WriteLn ('OBOK CIEBIE???????'); 
  Font(30,20,700); 
  MoveTo (80,650); 
  TextColor(255,1,1); 
  WriteLn('BEWARE!!!!!!!!!!!!!!!'); 
  Repeat 
    Begin 
      Delay(15); 
      b:=random(10); 
      c:=random (10); 
      Pen(1,150,150,0); 
      {gruboœc korpusu} 
      Brush (1,150,150,0); 
      {kolor korpusu} 
      Ellipse (190,270,250,410); 
      {korpus} 
      {pocz¹tek prawej rêki} 
      Pen(8,150,150,0); 
      MoveTo(238,283); 
      For i:=238 to 400 do 
        LineTo(i, round(310-40*sin(i/20-c))); 
      Delay(30); 
      Pen(8,255,255,255); 
      MoveTo(238,283); 
      For i:=238 to 400 do 
        LineTo(i, round(310-40*sin(i/20-c))); 
      {koniec prawej rêki} 
      {korpus} 
      Pen(1,150,150,0); 
      Brush (1,150,150,0); 
      Ellipse (190,270,250,410); 
      {pocz¹tek lewej rêki} 
      Pen(8,150,150,0); 
      MoveTo (30,270); 
      For i:=30 to 195 do 
        LineTo(i, round(290-40*sin(i/20-c))); 
      Delay(30); 
      Pen(8,255,255,255); 
      MoveTo (30,270); 
      For i:=30 to 195 do 
        LineTo(i, round(290-40*sin(i/20-c))); 
      Pen(1,150,150,0); 
      {gruboœc korpusu} 
      Brush (1,150,150,0); 
      {kolor korpusu} 
      Ellipse (190,270,250,410); 
      {korpus} 
      Pen(8,150,150,0); 
      MoveTo(220,390); 
      Line (220,390,180,480); 
      Line (220,390,260,480); 
      Pen(3,255,255,255); 
      Ellipse (200-b,200,250-b,260); 
      {g³owa} 
      Pen(13,1,1,1); 
      Line (170,220,250,210); 
      Line (170,220, 250,196); 
      Line (250,196, 250,210); 
      {kaszkiet} 
      Pen(10,150,150,0); 
      a:=random(90); 
      Line (180,480,180-a,560); 
      Line (260,480,260+a,560); 
      Delay (50); 
      Pen (10,255,255,255); 
      Line (180,480,180-a,560); 
      Line (260,480,260+a,560); 
    end; 
  until a=100; 
{¿eby siê nie zatrzymywa³ ;-)}
end.

