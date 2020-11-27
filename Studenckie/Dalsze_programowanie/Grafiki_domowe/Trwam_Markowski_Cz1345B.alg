{
PRZESYLAMY PLIK TEKSTOWY, PONIEWA¯ (PRAWDOPODOBNIE ZE WZGLÊDU NA
PROBLEM ZE STRON¥ KODOW¥) PLIK Z ROZSZERZENIEM .ALG NIE URUCHAMIA
SIÊ W ALGO POPRAWNIE. OBAWIAMY SIÊ, ¯E KONIECZNE BÊDZIE SKOPIOWANIE
PROGRAMU PARTIAMI PRZEZ SCHOWEK.

/-------------------------------------\
|  Program do oceny przygotowa³a:     |
\-------------------------------------/
| Grupa Trzymaj¹ca W³adzê w sk³adzie: |
|     - Cezary Markowski              |   
|     - Magdalena Bartoszewska        |
|     - Anna Juniewicz                |  
|     - Jakub Kopiczyñski             | 
\_____________________________________/

Czwartek, 13:45
} 
Program rysunek; 

var 
   model : STRING; 
   i, x, y, q, z, t : integer; 

Procedure Prostokat1; 

begin 
  pen(3,0,0,0); 
  Brush(1,255,128,54); 
  rectangle(50,50,690,500); 
  pen(0,150,150,150) ; 
end; 

Procedure Ekran; 

begin 
  Brush(1,158,238,252); 
  pen(8,50,50,100); 
  rectangle(60,60,600,450); 
  Brush(0,0,0,0); 
end; 

Procedure Wiadomosci; 

var 
   i,j:integer; 
begin 
  i:=0; 
  j:=11; 
  for i:=0 to 10 do 
    begin 
      Font(j,5,800); 
      TextColor(255,20,20); 
      Brush(1,255,255,255); 
      MoveTo(75,100); 
      delay(30); 
      write('Prawdziwe Wiadomoœci'); 
      j:=j+1; 
      i:=i+1; 
    end; 
end; 

Procedure Prowadzacy; 

begin 
  penUp; 
  SetPosition(250,220); 
  penDown; 
  brush(1,255,255,206); 
  {Tu³ów} 
  For t:=230 to 460 do 
    Begin 
      MoveTo(t,430); 
      Pen(1,128,128,128); 
      LineTo(350, 200) 
    end; 
  {G³owa} 
  ellipse(250,150,450,350); 
  penUp; 
  SetPosition(300,230); 
  penDown; 
  {oczy} 
  for q:=1 to 25 do 
    begin 
      pen(5,255, 181, 106); 
      forward(3); 
      right(15); 
      pen(0,0,0,0); 
    end; 
  penUp; 
  SetPosition(380,230); 
  penDown; 
  for q:=1 to 25 do 
    begin 
      pen(5,255, 181, 106); 
      forward(3); 
      right(15); 
      pen(0,0,0,0); 
    end; 
  penUp; 
end; 
{oczy koniec} 
{oczy - spirale} 

Procedure Devilish_eyes; 

var 
   i:integer; 
begin 
  i:=15; 
  SetPosition(300,230); 
  penDown; 
  for q:=1 to 25 do 
    begin 
      pen(2,255, 0, 0); 
      forward(3); 
      right(i); 
      pen(0,0,0,0); 
      i:=i+2; 
      delay(20); 
    end; 
  penUp; 
  SetPosition(395,240); 
  penDown; 
  i:=15; 
  for q:=1 to 25 do 
    begin 
      pen(2,255, 0, 0); 
      forward(3); 
      right(i); 
      pen(0,0,0,0); 
      i:=i+1; 
      delay(20); 
    end; 
  penUp; 
  setPosition(1000,1000); 
end; 
{spirale - koniec} 
{rysowanie ust} 

Procedure usta; 

var 
   i,j,k,r,g,b:integer; 
begin 
  j:=2; 
  k:=6; 
  penUp; 
  for i:=1 to 10 do 
    begin 
      r:=random(256); 
      g:=random(10); 
      b:=random(10); 
      pen(2,r,g,b); 
      brush(1,r,g,b); 
      ellipse(320+j,300-k,380-j,325+k); 
      k:=k+1; 
      j:=j+1; 
      delay(200); 
    end; 
end; 

Procedure Stopka; 

var 
   i,x:integer; 
   j:string; 
begin 
  i:=0; 
  x:=165; 
  j:=('            TVN nadal atakuje Radio Maryja '); 
  for i:=0 to 20 do 
    begin 
      Brush(1,255,255,255); 
      Font(10,0,800); 
      TextColor(255,20,20); 
      MoveTo(x,425); 
      write(j); 
      delay(25); 
      x:=x-5; 
    end; 
end; 

Procedure Glosnik; 

begin 
  pen(3,128,64,0); 
  brush(1,155,155,155); 
  ellipse(610,100,680,250); 
end; 

Procedure Logo_trwam; 

begin 
  brush(1,158,238,252); 
  pen(5,255,0,0); 
  line(500,145,500,80); 
  line(480,100,520,90); 
  Font(17,0,900); 
  TextColor(255,0,0); 
  MoveTo(510,100); 
  write('rwam'); 
end; 

Procedure Logo_unitra; 

begin 
  rectangle(70,460,250,490); 
  Font(11,0,800); 
  TextColor(255,20,20); 
  MoveTo(75,465); 
  write(model); 
end; 

Procedure Przyciski; 

begin 
  pen(4,66, 156, 204); 
  brush(1,225,225,225); 
  ellipse(615,350,635,370); 
  ellipse(655,350,675,370); 
  ellipse(615,390,635,410); 
  ellipse(655,390,675,410); 
  Font(8,0,700); 
  TextColor(0,0,0); 
  MoveTo(610,423); 
  write('POWER'); 
  brush(1,255, 81, 81); 
  ellipse(655,420,675,440); 
  SetPosition(700,550); 
end; 

Begin 
  model := ('UNITRA - RYDZOÑ'); 
  Hide; 
  Prostokat1; 
  Ekran; 
  Prowadzacy; 
  Glosnik; 
  Logo_trwam; 
  Logo_unitra; 
  Stopka; 
  Przyciski; 
  Devilish_eyes; 
  Usta; 
  Wiadomosci; 
End.

