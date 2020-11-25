Program Grafiki; 

const 
   MaxX=300; 
   MaxY=200; 
Var 
   x,y:integer; 

Begin 
  {Linia po przek¹tnej} 
  Line(0,0,MaxX,MaxY); 
  {Linia od koñca poprzedniej do podanego punktu} 
  LineTo(0,MaxY); 
  {Przesuniecie bez rysowania do podanego punktu} 
  MoveTo(MaxX div 2,MaxY div 2); 
  {Odczytanie aktualnego polozenia kursora} 
  Coordinates(x,y); 
  {Wypisanie odczytanego po³ozenia } 
  write(x,' ',y); 
  {Zmiana koloru rysowania na czerwony} 
  Pen(1,255,0,0); 
  {Zmiana koloru wype³niania na niebieski} 
  Brush(1,0,0,255); 
  {Zmiana koloru pisania na zielony} 
  TextColor(0,255,0); 
  {Prostok¹t} 
  Rectangle(0,0,50,25); 
  write('Oto prostok¹t'); 
  {Elipsa} 
  Ellipse(MaxX-100,MaxY-50,MaxX,MaxY); 
  {Pojedyncze punkty}
  for x:=1 to MaxX div 2 do 
    begin 
      Point(x*2,MaxY div 2); 
      Delay(10) 
    end; 
  {Zmiana koloru wype³niania na cyan} 
  Brush(1,0,255,255);  
  {Ponowne wype³nienie prostok¹ta}
  Fill(10,10); 
  {Zmiana parametrów wypisywania tekstu}
  Font(10,30,400);
  {Baner koñcowy}
  MoveTo(MaxX div 2-25,MaxY div 2-25);
  Write('To ju¿ jest koniec...');
end.
