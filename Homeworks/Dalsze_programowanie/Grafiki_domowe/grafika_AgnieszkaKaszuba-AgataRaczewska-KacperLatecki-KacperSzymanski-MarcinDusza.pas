(*Sklad grupy: Agnieszka Kaszuba, Agata Raczewska, Kacper Latecki, Kacper Szymanski, Marcin Dusza*)

program Grafika;

const 
   x=100; 
var 
   t,p,y,z:integer; 

procedure kwadrat; 

begin 
  rectangle (x,x,3*x,3*x); 
end; 

procedure trawnik; 

begin 
  pen(5,0,200,0); 
  line(1,3*x,1000,3*x); 
  t:=0; 
  while t<1000 do 
    begin 
      line(10+t, 300, 10+t, 290); 
      t:=t+10; 
    end; 
end; 

procedure daszek; 

begin 
  for z:=x to 3*x do 
    begin 
      moveto (z,x+1); 
      pen (1,(100+x),(300-x),random (500)); 
      lineto (200,50); 
    end; 
end; 

procedure tlo; 

begin 
  brush (1, 0, 255, 255); 
  fill(1,1); 
end; 

procedure linie; 

begin 
  pen (3,100,100,500); 
  line (2*x,x,2*x,3*x); 
  line (1*x,2*x,3*x,2*x); 
end; 

procedure wypelnienie; 

begin 
  brush (1,random(100),random(300),random(900)); 
  fill (x+10,x+10); 
  brush (1,random(100),random(900),random(300)); 
  fill (2*x+10,x+10); 
  brush (1,random(900),random(300),random(100)); 
  fill (x+10,2*x+10); 
  brush (1,random(300),random(900),random(100)); 
  fill (2*x+10,2*x+10); 
end; 

Procedure elip; 

begin 
  pen(3,255,255,128); 
  Ellipse(20, 20, 50, 50); 
end; 

procedure podpis; 

begin 
  moveto(5*x,320); 
  textcolor(60,60,255); 
  writeln('Made for SPiK'); 
end; 

procedure ludzik; 

begin 
  line(400,270,370,300); 
  line(400,270,430,300); 
  line(400,270,400,200); 
  ellipse(380,170,425, 200); 
  line(400,225,370,250); 
end; 

procedure start; 

begin 
  pen(2,255,255,128); 
  line(50,50,70,70); 
  line(60,40,80,50); 
  line(60,25,100,30); 
  tlo; 
  ludzik; 
  tlo; 
  trawnik; 
  kwadrat; 
  daszek; 
  linie; 
  wypelnienie; 
  elip; 
  podpis; 
end; 

begin 
start;
line(400,225,430,250);
  (*start;                       - tutaj miala byc animacja, ludzik powinien machac reka.
                                   Niestety nie da sie wymazac konkretnych elementow  
                                   lub dlatego, ze komputer zbyt wolno generuje obraz co powoduje niewlasciwe
                                   generowanie tego efektu. Mozna to uzyskac jedynie bez tla. Czyli animacja samej reki.                                   
                                    
  while true do 
    begin 
      line(400,225,435,205); 
      delay(50); 
      clear; 
      start; 
      line(400,225,435,225); 
      delay(50); 
      clear; 
      start; 
      line(400,225,430,245); 
      delay(50); 
      clear; 
      start; 
   end;  *) 
end.