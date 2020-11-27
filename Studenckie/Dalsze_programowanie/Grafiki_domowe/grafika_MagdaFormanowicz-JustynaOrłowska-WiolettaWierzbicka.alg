Program JMV1; 
{autorki: Magda Formanowicz, Justyna Or³owska, Wioletta Wierzbicka; œr. 15.30;
program rysuje kwiatek, ktorego wielkoœæ jest uzale¿niona od wartoœci podanej przez u¿ytkownika} 

const 
   b=2; 
   {sta³a, potrzebna do wype³nienia æwiartek ko³a} 
var 
   a:integer; 
   {zmienna, od ktorej zale¿y wielkoœæ kwiatka} 
   i:integer; 
   {zmienna obs³uguj¹ca pêtle} 

procedure zapytaj; 

var 
   w:integer; 
begin 
  font (10,0,200); 
  textColor(0,0,255); 
  writeln('Podaj wielkoœæ kwiatka'); 
  {program pyta o wielkosc kwiatka-ograniczamy jego wielkosc miedzy 10 a 70} 
  readln(w); 
  while w<10 do 
    begin 
      clear; 
      font (10,0,200); 
      textcolor(255,0,0); 
      writeln('To za ma³y kwiatek dla Ciebie'); 
      writeln('Podaj wielkoœæ kwiatka'); 
      readln(w); 
    end; 
  while w>70 do 
    begin 
      clear; 
      font (9,0,0); 
      textcolor(255,0,0); 
      writeln('Tak du¿ego kwiatka nie moge narysowaæ'); 
      writeln('Podaj wielkoœæ kwiatka'); 
      readln(w); 
    end; 
  clear; 
  a:=w; 
end; 

procedure lodyzka; 

Var 
   i:integer; 
Begin 
  for i:=10*a downto 4*a do 
    begin 
      delay(10); 
      Point( 3*a,i ); 
      Pen(4,110,139,61); 
      {program rysuje lodyzke} 
    end; 
  begin 
    pen(1,0,0,1); 
    brush(2,255,50,61); 
    rectangle (3*a-a div 4,4*a-a div 4,3*a + a div 4,4*a + a div 4); 
    {program rysuje srodek kwiatka} 
  end; 
  begin 
    for i:=a*7 to a*8 do 
      begin 
        moveto(a*4,i); 
        pen(2,110,139,61); 
        lineto(a*3,a*10); 
        delay(10); 
        {program rysuje prawy lisc} 
      end; 
    begin 
      for i:=a*6 to a*7 do 
        begin 
          moveto(a*2,i); 
          pen(2,110,139,61); 
          lineto(a*3,a*8); 
          delay(10); 
          {program rysuje lewy lisc} 
        end; 
    end; 
  end; 
end; 

procedure wypelnij; 

var 
   r,g,b:integer; 
begin 
  delay(30); 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  brush(2,r,g,b); 
  {program wype³nia kolka losowymi kolorami} 
end; 

procedure mruganie(x,y:integer); 

begin 
  wypelnij; 
  fill(x+b,y-a div 2 -2*b ); 
  wypelnij; 
  fill(x+a div 2 +b, y-a+2*b); 
  wypelnij; 
  fill(x+a div 2 -b, y-2*b); 
  wypelnij; 
  fill(x+a div 2+b, y-2*b); 
  {poszczegolne cwiartki kolek losowo zmieniaja kolory} 
end; 

procedure kolko (x,y:integer); 

begin 
  wypelnij; 
  ellipse(x,y,x+a,y-a); 
  line(x,y-a div 2, x+a, y-a div 2); 
  line(x+a div 2, y, x+ a div 2, y-a); 
  {program rysuje 4 kolka, poczawszy do lewego w gornym rogu oraz 2 linie w ka¿dym kolku} 
end; 

procedure rosnij(x,y:integer); 

begin 
  wypelnij; 
  ellipse(x-a div 3,y+a div 3,x+a+a div 3,y-a-a div 3); 
end; 

procedure gleba; 

begin 
  moveto(a,10*a); 
  lineto(5*a,10*a); 
  {program rysuje podloze dla kwiatka} 
end; 

Begin 
  zapytaj; 
  gleba; 
  lodyzka; 
  kolko(2*a - a div 2, 4*a - a div 2); 
  kolko(2*a - a div 2, 5*a + a div 2); 
  kolko(3*a + a div 2, 4*a - a div 2); 
  kolko(3*a + a div 2, 5*a + a div 2); 
  for i:=1 to 20 do 
    begin 
      delay(3); 
      mruganie(2*a - a div 2 ,4*a - a div 2); 
      mruganie(2*a - a div 2, 5*a + a div 2); 
      mruganie(3*a + a div 2, 4*a - a div 2); 
      mruganie(3*a + a div 2, 5*a + a div 2); 
    end; 
  rosnij(3*a + a div 2, 5*a + a div 2); 
  rosnij(2*a - a div 2, 4*a - a div 2); 
  rosnij(2*a - a div 2, 5*a + a div 2); 
  rosnij(3*a + a div 2, 4*a - a div 2); 
end.