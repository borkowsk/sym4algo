program Losowanie; 
{Najprostrzy przyk³ad u¿ycia generatora liczb pseudolosowych} 

const 
   ile_razy=10000; 
   MaxX=3.9; 
var 
   MAxY:real; 
   i:integer; 
   x,y,y1:real; 

function fun(x:real):real; 

begin 
  fun:=0.1*exp(x); 
end; 

procedure kolor255(c:integer);
var kat:real;
begin
  kat:=(PI*2)*k/255.;                   
  wal1:=(long)(255*sin(kat*1.22));          
  if(wal1<0)then wal1:=0;                    
  wal2:=(long)(255*(-cos(kat*0.46)));         
  if(wal2<0)then  wal2:=0;                    
  wal3:=(long)(255*(-cos(kat*0.9)));          
  if(wal3<0)then  wal3:=0;
end;

begin 
  maxY:=fun(MaxX); 
  {writeln('Losowanie z zakresu <0..1)'); } 
  for i:=1 to ile_razy do 
    begin 
      x:=Random*MaxX; 
      y:=fun(x); 
      y1:=(random+random+random+random+random+random)/6; 
      pen(1,round(y1*255),round(x/MaxX*255),round(y/MaxY*255)); 
      point(round(x*100),round((MaxY-(y+y1*y))*100));
  end;  
  
end.
