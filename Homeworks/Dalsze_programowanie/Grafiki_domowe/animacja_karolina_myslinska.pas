Program Animator; 
{
***********************************

   Program wyswietla animacje :P

***********************************
} 

const 
   maxX=600; 
   maxY=600; 
var 
   a,b,i,x,y: integer; 
   imie: string; 

procedure tlo; 

begin 
  pen(1,0,0,0); 
  brush(1,50,60,70); 
  rectangle(10,10,600,600); 
end; 

procedure start; 

begin 
  TextColor(140,180,170); 
  Moveto(15,170); 
  Font(10,2,280); 
  Writeln('Program "Animator" (rozdzielczosc ok. 700x700) '); 
  for i:=1 to 170 do 
    begin 
      TextColor(50+i,60+i,170-i); 
      Moveto(15,595); 
      Font(10,-3,610); 
      Writeln('Projekt zaliczeniowy'); 
      Moveto(10,650); 
      Font(9,5,600); 
      Writeln('autor : Karolina Myœliñska'); 
      Delay(10); 
    end; 
  Moveto(15,30); 
  TextColor(200,180,160); 
  Font(11,-4,600); 
  Writeln('Wpisz swoje imie : '); 
  readln(imie); 
  tlo; 
end; 

procedure smiglo(imie:string); 

begin 
  if imie='' then 
    imie:='brak imienia'; 
  for i:=1 to 300 do 
    begin 
      TextColor(i,160,i); 
      Moveto(300,300); 
      Font(12,i*2,600); 
      Writeln(imie); 
      Moveto(300,300); 
      Font(11,i*2+180,600); 
      Writeln(imie); 
      Moveto(300,300); 
      Font(11,i*6,600); 
      Writeln(imie); 
      Moveto(300,300); 
      Font(11,i*6+180,600); 
      Writeln(imie); 
      Delay(10); 
      tlo; 
    end; 
end; 

procedure pileczki; 

begin 
  x:=20; 
  y:=20; 
  tlo; 
  pen(1,255,255,255); 
  brush(1,190,68,86); 
  randomize; 
  a:=random(10); 
  b:=random(10); 
  for i:=1 to 500 do 
    begin 
      tlo; 
      if x<30 then 
        a:=random(16); 
      if y<30 then 
        b:=random(16); 
      if x>maxX-100 then 
        a:=random(16)-20; 
      if y>maxY-100 then 
        b:=random(16)-20; 
      pen(1,255,255,255); 
      brush(1,a-b,x,y); 
      x:=x+a; 
      y:=y+b; 
      ellipse(x+10-b,y+10-b,x+80-a,y+80-a); 
      ellipse(y+10-a,x+10-a,y+80-b,x+80-b); 
      delay(1); 
    end; 
end; 

procedure koniec; 

begin 
  x:=20; 
  tlo; 
  for i:=1 to 200 do 
    begin 
      tlo; 
      brush(1,100,i*2,i); 
      rectangle(0,600,i*3,0); 
      delay(10); 
    end; 
  Moveto(0,0); 
  Font(8,0,600); 
  for i:=1 to 350 do 
    begin 
      TextColor(i,i*2,i); 
      Write(' • KONIEC PROGRAMU'); 
    end; 
end; 

begin 
  tlo; 
  start; 
  smiglo(imie); 
  pileczki; 
  koniec; 
end.