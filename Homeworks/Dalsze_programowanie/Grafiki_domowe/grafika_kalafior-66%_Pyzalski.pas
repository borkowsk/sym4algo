{Micha³ Pyzalski
Bartosz Kuszewski i spó³ka}

{Spó³ka to kto? - a w programie nie ma w³aœciwie procedur
te co s¹ pochodz¹ z przypadkowo zalaczonego zupelnie innego programu!!!
A do tego straszliwy ba³agan w kodzie}

Program kazimiera; 

Const 
   init_r=5; 
   last=500; 
   MaxMove=5; 
   Width=250; 
   Height=250; 
   LogName='Particles.log'; 
Type 
   particle=record 
        x,y:integer; 
   end; 
   world=array[1..Last] of particle; 


Function Sign(x:integer):integer; 

begin 
  if x<0 then 
    Sign:=-1 
  else 
    if x>0 then 
      Sign:=1 
    else 
      Sign:=0; 
end; 

Procedure FlockConsolidation(first,last:integer;Var W:World); 

var 
   i,z,p:integer; 
begin 
  z:=last-first+1; 
  For i:=first to last do 
    begin 
      p:=first+random(z); 
      W[i].x:=W[i].x+Sign(W[p].x-W[i].x); 
      W[i].y:=W[i].y+Sign(W[p].y-W[i].y); 
    end; 
end;
  
Procedure DrawAll(first,last:integer; Var W:world;r,g,b:integer); 

Var 
   i:integer; 
Begin 
  Pen(1,r,g,b); 
  for i:=first to last do 
    Point(W[i].x, W[i].y); 
end; 


Function Inside(x,y:integer):boolean; 

Begin 
  Inside:=(0<x)and(x<Width)and (0<y)and (y<Height); 
end; 

Procedure RandomMove(first,last:integer; Var W:world); 

Var 
   i,dx,dy,newx,newy:integer; 
Begin 
  For i:=first to last do 
    Begin 
      dx:=MaxMove div 2 - random(MaxMove); 
      dy:=MaxMove div 2 - random(MaxMove); 
      if inside (W[i].x+dx,W[i].y+dy) then 
        Begin 
          W[i].x:=W[i].x+dx; 
          W[i].y:=W[i].y+dy; 
        end; 
    end; 
end; 

Var 
   TheWorld:World; 
   Step:integer; 
   i:integer;
   j:integer;
   
Begin 
 Brush(0,0,0,0);
pen(0,0,0,0);
    Rectangle(0,0,501, 501); 
  Pen(1,255,0,0); 
  Point(Width, Height); 
  DrawAll(1,Last,TheWorld,255,0,0); 
  Step:=0; 
      for Step:=0 to Width do
      begin
      delay(4); 
      pen(0,0,0,0);
       Rectangle(Step+255,Width-(Step+6),Step-(Height-6),Step+255);
      
     pen(1,255,255,255);
       Rectangle(Step+250,Width-(Step+2),Step-(Height-2),Step+250);
       
      
      end;

 
            
  for i:=0 to Width do
  begin
  j:=i;
  i:=i+10;
  j:=j+10;
  delay(2);
  pen(1,0,0,0);
  
  Ellipse(0,0,i,j);
  Ellipse(500,500,500-i,500-j);
  Ellipse(0,500,i,500-j);
  Ellipse(500,0,500-i,j);
     
     
            end;
  
 
                
      for Step:=0 to Width do
      begin 
      
      delay(6);
      Pen(1,255,0,0);
      Line(Step+Width,Step-Height,Step-Width,Step+Height);
      Line(Step-Width,Step+Height,Step+Width,Step-Height);
      Pen(1,0,0,0);
      Line(Step,Step,Step+Width,Height-Step);
  Line(Step-Width,Step,Step,Step-Height);
          
      Line(Step+Width,Height-Step,Step,Step);
  
end;

                  
      
   for Step:=0 to Width do
      begin 
      
      delay(3);
      Pen(1,0,0,0);
      Line(Step+Width,Step-Height,Step-Width,Step+Height);
      Line(Step-Width,Step+Height,Step+Width,Step-Height);
      Pen(1,255,0,0);
      Line(Step+Width,Height-Step,Step,Step);
Brush(0,0,0,255);
Pen(0,0,0,55);
            Ellipse(Step+255,Width-Step,Step-Height,Step+255);
      
      
            end;
            
              for Step:=0 to Width do
      begin 
      
      delay(3);
      Pen(1,0,0,0);
    Brush(0,0,0,0);
Pen(0,100,0,0);
MoveTo(Step-Width,Step-Height);
            Rectangle(0,0,10,10);
      
      
            end;
                
                Pen(0,0,0,0);
                Rectangle(0,0,500,500);
                
  
           
  for i:=0 to width do     
  begin
  j:=i;
  i:=i+10;
  j:=j+10;
  delay(4);
  pen(1,255,255,255);
  
  rectangle(0,0,i,j);
  rectangle(500,500,500-i,500-j);
  rectangle(0,500,i,500-j);
  rectangle(500,0,500-i,j);
  
  
           
     
            end;            
                                
  
  
    for Step:=0 to Width do
      begin 
      
      delay(3);
      Pen(1,0,0,0);
      Line(500-Step,500-Height,Step+Width,Step-500);
      Line(500-Width,Step+Height,Step+Width,500-Height);
      
end;
  
  
  
  
  
  
     for Step:=0 to Width do
      begin 
      
      delay(3);
      Pen(1,50,50,0);
      Line(Step+Width,Step-Height,Step-Width,Step+Height);
      Line(Step-Width,Step+Height,Step+Width,Step-Height);
      Pen(1,0,0,0);
  textColor(255,0,0);
  
  MoveTo(Step , 230+Height);
     write('ala ma kota na punkcie tarota');
  
   textColor(200,0,0);
  
  MoveTo(Step-25 , 210+Height);
     write('kapeæ Joli Jolê boli');
   
   textColor(150,0,0);
  
  MoveTo(Step-50 , 190+Height);
     write('Wujek Iwo lubi piwo');
  
    textColor(100,0,0);
  
  MoveTo(Step-75 , 170+Height);
     write('Grafika w Algo rzšdzi ?wiatem');

  textColor(50,0,0);
  
  MoveTo(Step-100 , 150+Height);
     write('Kazimiera Szczuka swych implantów szuka');


end;


end.
