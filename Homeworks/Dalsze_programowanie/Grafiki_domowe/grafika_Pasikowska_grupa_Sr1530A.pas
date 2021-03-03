program Grafika_czo³g; 
{Sk³ad Grupy:
Ania Ciecierska
Kasia Chaciñska
Agata Pasikowska
Marcin Go³aszewski
Filip Latawiec
œroda 15:30} 

var 
   t,i 
   {licznik},z,y,k:integer; 

procedure tlo; 

begin 
  brush (1, 0, 255, 255); 
  fill(10,10); 
end; 

procedure trawnik; 

begin 
  Brush(1, 0, 255, 0); 
  rectangle (1,200,1200,2700); 
end; 

procedure czolg; 

begin 
  i:=0; 
  while i<150 do 
    {g¹œenica lewa} 
    begin 
      Brush(1, 0, 160,40); 
      Ellipse(110+i, 180+i, 160+i, 240+i); 
      i:=i+30; 
    end; 
  i:=0; 
  while i<150 do 
    {g¹œenica prawa} 
    begin 
      Brush(1, 0, 160,40); 
      Ellipse(200+i, 180+i, 250+i, 240+i); 
      i:=i+30; 
    end; 
  i:=0; 
  while i<160 do 
    begin 
      pen(10,0,120,40); 
      line(140+i,180,250+i,330); 
      i:=i+1; 
    end; 
  pen(120, 0, 100,50); 
  line(230, 190,285, 250); 
  pen(70, 0, 100,50); 
  line(240, 190,330, 272); 
  i:=0; 
end; 

Procedure slonce; 

begin 
  pen(28,250,255,1); 
  ellipse(20, 20, 50, 50); 
end; 

procedure wierzyczka; 

begin 
  pen(48,0,80,20); 
  line(230,150,200,200); 
  line(325,200,290,150); 
  pen(55,0,80,20); 
  line(290,145,230,145); 
  line(200,200,320,200); 
end; 

procedure lufa; 

begin 
  pen(35,0,50,20); 
  line(270,145,420,190); 
end; 

procedure domek; 

begin 
pen(1,255,255,255);
brush(1,255,255,0);
  moveto(550,200); 
  lineto(650, 380);
  lineto(650,480);
  lineto(450,480);
  lineto(450,380);  
  lineto(550, 200); 
  fill(641, 450);
  brush(1,205,0,00);
  line(450,380,650,380);
  fill(570,370); 
end; 
procedure wystrza³;
begin
i:=0; 
  while i<150 do 
    begin 
      Brush(1, 100+i,0,random(50)); 
      Ellipse(425, 195, 450+(i*4), 210+(i*3)); 
      i:=i+30;
      delay(100); 
    end; 
  i:=0; 
end;
begin 
  tlo; 
  trawnik; 
  czolg; 
  slonce; 
  wierzyczka; 
  lufa;
  delay(100); 
  domek;
  delay(1200);
  wystrza³;
  font(20,0,2000);
  writeln ('boooom'); 
  Brush(1, 0, 160,40); 
  Moveto(250,290); 
  font(20,0,1600); 
  TextColor(255,255,255); 
  Delay (330); 
  writeln('Rudy 102'); 
  Moveto(400,5); 
  font(9,0,1600); 
  Delay (130); 
  writeln('by:'); 
  Moveto(400,25); 
  Delay (130); 
  writeln('Kasia Chaciñska'); 
  Moveto(400,45); 
  Delay (130); 
  writeln('Ania Ciecierska'); 
  Moveto(400,65); 
  Delay (130); 
  writeln('Marcin Go³aszewski'); 
  Moveto(400,85); 
  Delay (130); 
  writeln('Filip Latawiec'); 
  Moveto(400,105); 
  Delay (130); 
  writeln('Agata Pasikowska'); 
end.