
{grupa œroda 13:45 przesy³a swoj¹ grafikê
sk³ad:

Monika Borowska
Marta D¹bkowska
Paulina Gaw³owska
Micha³ K³osowski
Anna Sidorowicz
Pawe³ Wakuluk}

{Fajne, tylko dlaczego grupa 6 osobowa? I przerwaæ trudno...}

Program STORM; 

Var 
   width,height:integer; 

Procedure dodaj_punkt; 

Var 
   x,y:integer; 
Begin 
  x:=random(450); 
  y:=random(450); 
  Point(x,y); 
end; 

Procedure dodaj_linie; 

Var 
   x1,y1,x2,y2:integer; 
Begin 
  x1:=0; 
  y1:=500; 
  x2:=500; 
  y2:=500; 
  Line(x1,y1,x2,y2); 
end; 

Procedure Fale; 

Var 
   i: integer; 
Begin 
  MoveTo (0,500); 
  For i:=1 to 500 do 
    LineTo(i, round (500-10*sin(i/10))); 
end; 

Procedure dodaj_kolo; 

Var 
   x,y,r:integer; 
Begin 
  x:=random(width); 
  y:=random(height); 
  r:=random(100); 
  Ellipse(x-r,y-r,x+r,y+r); 
end; 

Procedure prostokat; 

Var 
   x1,y1,x2,y2,r,g,b:integer; 
Begin 
  Rectangle(200, 450, 80, 499); 
  Pen(1, 255, 0, 0); 
end; 

Procedure prostokat2; 

Var 
   x1,y1,x2,y2,r,g,b:integer; 
Begin 
  Rectangle(170, 250, 130, 264); 
  Pen(1, 255, 0, 0); 
end; 

Procedure Maszt; 

Begin 
  Line( 250, 450, 150, 90); 
  Pen( 2, 0, 0,255); 
  Line (150, 450,150, 90); 
  Pen( 2, 0, 0,255); 
  Line (150, 450,250, 450); 
  Pen( 2, 0, 0,255); 
  Line(150,90, 90, 350); 
  Pen( 2, 0, 0,255); 
  Line (90, 350, 150,350); 
end; 

Procedure napis_w; 

Begin 
  Font(10,10,200); 
  WriteLn('Storm of the CENTURY!'); 
  Font(8,2,300); 
  WriteLn('Pêdz¹ce imad³a SOS'); 
end; 

Procedure napis2;
Begin
MoveTo(80,600);
Font(10,18,200); 
  WriteLn('Za³oga:Miguel,Paciul,Zord,...'); 
  end;

Procedure wylosuj_kolor; 

Var 
   r,g,b:integer; 
Begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Pen(1,r,g,b); 
end; 

Procedure wylosuj_wypelnienie; 

Var 
   r,g,b:integer; 
Begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Brush(1,r,g,b); 
end; 

Procedure WOW; 

Var 
   i: integer; 
Begin 
  For i:=15 to 200 do 
    Begin 
      MoveTo(400,i); 
      Pen(1,60,2*i-30,2*i-60); 
      LineTo(150, 250) 
      {punkt styczny z bocianim gniazdem} 
    end; 
end; 

Begin 
  width:=20; 
  height:=50; 
  While true do 
    Begin 
      wylosuj_kolor; 
      wylosuj_wypelnienie; 
      dodaj_kolo; 
      dodaj_linie; 
      Fale; 
      wylosuj_kolor; 
      dodaj_punkt; 
      prostokat; 
      Maszt; 
      napis_w; 
      WOW; 
      prostokat2; 
      napis2;
      Delay(80); 
    end; 
end.

