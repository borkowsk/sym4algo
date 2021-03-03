Program procedury_graficzne; 
{ Sk³ad grupy:
   Aneta Zalewska
   Dorota Szewczuk
   Katarzyna Popek
   Joanna Wierzbicka
   Jan Rybczyñski}

Procedure czysc; 

Begin 
  Pen(1,0,0,0); 
  Brush(1,0,0,0); 
  Rectangle (0,0,600,600); 
End; 

Procedure spirala; 

var 
   i,j,g,x,y,x2,y2 : integer; 
   kat : real; 
Begin 
  kat:=0; 
  x:=300; 
  y:=300; 
  for j:=0 to 2 do 
    begin 
      g := j*2; 
      {grubosc linii} 
      for i:=0 to 255 do 
        {rysowanie spirali} 
        begin 
          x2 := x; 
          y2 := y; 
          y:=300+round(i * sin(kat)); 
          {wyliczanie pkt spirali} 
          x:=300+round(i * cos(kat)); 
          if j = 0 then 
            pen(g,255,g*8,0); 
          {wybor koloru } 
          if j = 1 then 
            pen(g,0,255,g*8); 
          if j = 2 then 
            pen(g,g*8,0,255); 
          line(x,y,x2,y2); 
          kat:=kat+0.2; 
          if i mod 10 = 0 then 
            g := g + 1; 
          delay(15); 
        end; 
      delay(30); 
      g:=g + 5; 
      for i:=255 downto 0 do 
        {scieranie spirali} 
        begin 
          x2 := x; 
          y2 := y; 
          y:=300+round(i * sin(kat)); 
          x:=300+round(i * cos(kat)); 
          pen(g,0,0,0); 
          line(x,y,x2,y2); 
          kat:=kat-0.2; 
          if i mod 10 = 0 then 
            g := g - 1; 
          delay(15); 
        end; 
    end; 
End; 

Procedure pilka; 

var 
   i,j,x,y : integer; 
Begin 
  pen(1, 0, 100, 255); 
  brush(1, 0, 100, 255); 
  {pojawianie sie kola} 
  for i:=0 to 70 do 
    begin 
      ellipse(300-i,300-i,300+i,300+i); 
      delay(20); 
    end; 
  {odbijanie x3 } 
  for x := 0 to 3 do 
    begin 
      {spadanie} 
      for i:=0 to 58 do 
        begin 
          j:=i; 
          pen(1, 0,0,0); 
          brush(1, 0, 0,0); 
          ellipse(230, 230+4*j-4, 370, 370+j*4-4); 
          pen(1, 0, 100, 255); 
          brush(1, 0, 100+2*i, 255-2*i); 
          ellipse(230, 230+j*4, 370, 370+j*4); 
          delay(1); 
        end; 
      for i:=0 to 30 do 
        {znieksztalcnie pod wplywem zderzenia} 
        begin 
          pen(1, 0,0,0); 
          brush(1, 0, 0,0); 
          ellipse(230-i+2,460+i-2, 370+i-2, 600); 
          pen(1, 0, 100, 255); 
          brush(1, 8*i, 216, 139-4*i); 
          ellipse(230-i, 460+i, 370+i, 600); 
          delay(2); 
        end; 
      for i:=30 downto 0 do 
        {powrot do normalnego ksztaltu} 
        begin 
          pen(1, 0,0,0); 
          brush(1, 0, 0,0); 
          ellipse(230-i-2,460+i+2, 370+i+2, 600); 
          pen(1, 0, 100, 255); 
          brush(1, 8*i, 216, 139-4*i); 
          ellipse(230-i, 460+i, 370+i, 600); 
          delay(2); 
        end; 
      {po odbiciu droga w gore} 
      for i:=57 downto 0 do 
        begin 
          j:=i; 
          pen(1, 0,0,0); 
          brush(1, 0, 0,0); 
          ellipse(230, 230+4*j+4, 370, 370+j*4+4); 
          pen(1, 0, 100, 255); 
          brush(1, 0, 100+2*i, 255-2*i); 
          ellipse(230, 230+j*4, 370, 370+j*4); 
          delay(1); 
        end; 
    end; 
  {zanikanie kola} 
  for i:=0 to 70 do 
    begin 
      pen(2, 0,0,0); 
      brush(0, 0, 0,0); 
      ellipse(230+i,230+i,370-i,370-i); 
      delay(20); 
    end; 
End; 
procedure Okr¹g_z_kwadratow; 

var 
   i,j,g,x,y,x2,y2 : integer; 
   kat : real; 
Begin 
  kat:=0; 
  x:=300; 
  y:=300; 
  for j:=0 to 4 do 
    begin 
      g := j*2; 
      for i:=0 to 200 do 
        begin 
          y:=300+round(i * sin(kat)); 
          {wyliczanie pkt} 
          x:=300+round(i * cos(kat)); 
          if j = 0 then 
            brush(1,g,255,g*8); 
          {wybor koloru } 
          if j = 1 then 
            brush(1,200,0,g*8); 
          if j = 2 then 
            brush(1,0,g*8,255); 
          if j = 4 then 
            brush(1,g*8,250,5); 
          if j = 3 then 
            brush(1,250-g*8,0,255); 
          {rysownie kwadratow} 
          Rectangle(x-4,y-4,x+4,y+4); 
          if i > 5 then 
            begin 
              y:=300+round((i-5) * sin(kat-1.0)); 
              x:=300+round((i-5) * cos(kat-1.0)); 
              brush(1,0,0,0); 
              Rectangle(x-4,y-4,x+4,y+4); 
            end; 
          kat:=kat+0.2; 
          if i mod 10 = 0 then 
            g := g + 1; 
          delay(15); 
        end; 
      delay(30); 
      g:=g + 5; 
    end; 
  Delay(200); 
End; 

Procedure prostokaty; 

var 
   kol1, kol2, kol3, x,y,i :integer; 
Begin 
  Randomize; 
  {rysowanie 1000 kwadratow} 
  for i:=0 to 1000 do 
    begin 
      {losowanie koorow} 
      kol1:= Random(254)+1; 
      kol2:= Random(254)+1; 
      kol3:= Random(254)+1; 
      pen(3,kol1,kol2,kol3); 
      brush(1,kol1,kol2,kol3);
      {losowanie wspolrzednych} 
      x:=Random(560); 
      y:=Random(560); 
      Rectangle(x,y,x+Random(35)+5,y+Random(35)+5); 
      delay(1); 
    end; 
  pen(1,0,0,0); 
  brush(1,0,0,0); 
  {zamazanie ekranu koncowegp} 
  for i:=0 to 40 do 
    begin 
      rectangle(280-7*i,280-7*i,320+7*i,320+7*i) ; 
      delay(7); 
    end; 
  MoveTo(280,280); 
  TextColor(255,255,255); 
  Write('KONIEC PROGRAMU'); 
End; 

BEGIN 
  czysc; 
  spirala; 
  pilka; 
  Okr¹g_z_kwadratow; 
  prostokaty; 
END.