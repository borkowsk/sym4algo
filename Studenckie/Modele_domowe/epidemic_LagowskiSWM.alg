Program Epidemic; 

Type 
   node=record 
        x,y:real; 
        state:integer; 
   end; 

   Const 
   Last=20; 
Var 
   TheNodes:array[1..Last] of node; 
   TheEdges:array[1..Last,1..Last] of real; 

   Const 
   ERatio=0.5; 
   Weighted=true; 
   Intensity=40; 
   Duration=7; 
   Immunity=7; 
   Radius=10; 
   Width=400; 
   Ring=true; 

Procedure CleanArrays; 

Var 
   i,j:integer; 
Begin 
  For i:=1 to Last do 
    Begin 
      TheNodes[i].x:=0; 
      TheNodes[i].y:=0; 
      TheNodes[i].state:=0; 
      For j:=1 to Last do 
        TheEdges[i,j]:=0; 
    end; 
end; 

Procedure RandomEdges(ratio:real); 

Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      If random<ratio then 
        TheEdges[i,j]:=1; 
end; 

Procedure swap(Var a,b:integer); 

Var 
   pom:integer; 
Begin 
  pom:=a; 
  a:=b; 
  b:=pom; 
end; 

Procedure SW; 

Var 
   i,j,k,l,m:integer; 
Begin 
  for j:=1 to last-2 do 
    for k:=1 to 2 do 
      TheEdges[j+k,j]:=1;{random*random*random; }
      
  TheEdges[last,2]:=0.5;{random*random*random ; }
  TheEdges[last,last-1]:=0.5;{random*random*random ; }
  TheEdges[last,1]:=0.5;{random*random*random ; }
  TheEdges[last-1,1]:=0.5;{random*random*random ; }
  TheEdges[2,1]:=0.5;{random*random*random ; }
end; 

Procedure WeightedEdges1; 

Var 
   i,j:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      TheEdges[i,j]:=random*random*random; 
end; 

Procedure SmallStep; 

Var 
   i,j:integer; 
   w:real; 
Begin 
  i:=1+random(Last); 
  Repeat 
    j:=1+random(Last); 
  until i<>j; 
  If i<j then 
    swap(i,j); 
  w:=TheEdges[i,j]; 
  If w>0 then 
    Begin 
      If (TheNodes[i].state=0)and (TheNodes[j].state>0)and (TheNodes[j].state<Duration)and(random<=w) then 
        TheNodes[i].state:=1; 
    end; 
  j:=1+random(Last); 
  Repeat 
    i:=1+random(Last); 
  until i<>j; 
  If j<i then 
    swap(i,j); 
  w:=TheEdges[i,j]; 
  If w>0 then 
    Begin 
      If (TheNodes[i].state=0)and (TheNodes[j].state>0)and (TheNodes[j].state<Duration)and(random<=w) then 
        TheNodes[i].state:=1; 
    end; 
end; 

Procedure TimeSlice; 

Var 
   i:integer; 
Begin 
  For i:=1 to Last do 
    If TheNodes[i].state>0 then 
      TheNodes[i].state:=(TheNodes[i].state+1)mod(Duration+Immunity); 
  For i:=1 to Intensity do 
    SmallStep; 
end; 

Procedure CalculateStat(Var infected, immune :integer); 

Var 
   i:integer; 
Begin 
  infected:=0; 
  immune:=0; 
  For i:=1 to Last do 
    If TheNodes[i].state>0 then 
      If TheNodes[i].state<Duration then 
        infected:=infected+1 
      else 
        immune:=immune+1; 
end; 

Procedure RandomPosition; 

Var 
   i:integer; 
Begin 
  For i:=1 to Last do 
    Begin 
      TheNodes[i].x:=random; 
      TheNodes[i].y:=random; 
    end; 
end; 

Procedure RingPositions; 

Var 
   i:integer; 
   alfa:real; 
Begin 
  For i:=1 to Last do 
    Begin 
      alfa:=((2*pi)/Last)*i; 
      TheNodes[i].x:=0.5+cos(alfa)*0.45; 
      TheNodes[i].y:=0.5+sin(alfa)*0.45; 
    end; 
end; 

Procedure ViewGraph; 


Procedure EdgeColor(v,min,max:real); 

Begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,round(255-v),round(255-v ),round(255-v)); 
end; 

Procedure NodeFill(v:integer); 

Begin 
  If v=0 then 
    Begin 
      Brush(1,0,0,155); 
      Pen(1,0,0,155); 
    end 
  else 
    If v<Duration then 
      Begin 
        v:=round(255-(v-1)/(Duration-1)*155); 
        Brush(1,v,0,0); 
        Pen(1,v,0,0); 
      end 
    else 
      Begin 
        v:=round(255-(v-Duration)/ (Duration+Immunity-Duration)*155); 
        Brush(1,0,v,0); 
        Pen(1,0,v,0); 
      end; 
end; 

Function Rescale(v,min,max:real;imax:integer):integer; 

Begin 
  v:=(v-min)/(max-min); 
  Rescale:=round(imax*v); 
end; 

Var 
   i,j:integer; 
   x1,y1,x2,y2:integer; 
Begin 
  For i:=2 to Last do 
    For j:=1 to i-1 do 
      If TheEdges[i,j]>0 then 
        Begin 
          x1:=Rescale(TheNodes[i].x,0,1,Width); 
          y1:=Rescale(TheNodes[i].y,0,1,Width); 
          x2:=Rescale(TheNodes[j].x,0,1,Width); 
          y2:=Rescale(TheNodes[j].y,0,1,Width); 
          EdgeColor(TheEdges[i,j],0,1); 
          Line(x1,y1,x2,y2); 
        end; 
  For i:=1 to Last do 
    Begin 
      x1:=Rescale(TheNodes[i].x,0,1,Width); 
      y1:=Rescale(TheNodes[i].y,0,1,Width); 
      x1:=x1-Radius; 
      y1:=y1-Radius; 
      x2:=x1+2*Radius; 
      y2:=y1+2*Radius; 
      NodeFill(TheNodes[i].state); 
      Ellipse(x1,y1,x2,y2); 
    end; 
end; 

Var 
   step:integer; 
   infected,immuned:integer; 

Begin 
  Clear; 
  step:=0; 
  CleanArrays; 
  If ring then 
    RingPositions 
  else 
    RandomPosition; 
  If weighted then 
    SW 
  else 
    RandomEdges(ERatio); 
  TheNodes[1].state:=1; 
  Repeat 
    Delay(500); 
    Pen(1,0,0,0); 
    Brush(1,255,255,255); 
    MoveTo(1,1); 
    CalculateStat(infected,immuned); 
    WriteLn(step,' ',infected,' ',immuned,' '); 
    ViewGraph; 
    step:=step+1; 
    TimeSlice; 
  until infected=0; 
end.
