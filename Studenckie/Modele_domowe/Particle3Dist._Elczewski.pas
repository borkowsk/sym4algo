Program Particles3; 
{Adrian Elczewski - dyfundujace particles z 
obliczaniem œredniej odleg³osci miêdzy cz¹steczkami}
Const 
   Last = 500; 
   Width = 500; 
   Height = 500; 
   MaxMove = 5; 
   Promien = 50; 
type 
   particle = record 
        x, y:integer; 
   end; 
   World = array[1..Last] of particle; 
var 
   widthdiv2,  heightdiv2,  count,  loopI,  loopJ:integer; 
   dist:real; 

Procedure RandomPosition(first, last:integer;var W:World;x, y,  r:integer); 

var 
   i, rr:integer; 
   alfa:real; 
Begin 
  for i := first to last do 
    begin 
      rr := random(r); 
      alfa := random * 2 * Pi; 
      W[i].x := round(x + sin(alfa) * rr); 
      W[i].y := round(y + cos(alfa) * rr); 
    end; 
end; 

Procedure DrawAll(first, last:integer;var W:World;r, g, b:integer); 

var 
   i:integer; 
Begin 
  Pen(1, r, g, b); 
  for i := first to last do 
    Point(W[i].x, W[i].y); 
end; 

Function Inside(x, y:integer):boolean; 
{Sprawdzanie czy punkt jest w obszarze dozwolonym} 

begin 
  Inside := (0<x)AND(x<Width)AND(0<y)AND(y<Height); 
end; 

Function InsideCircle(x, y:integer):boolean; 

begin 
  InsideCircle := (sqrt(sqr(x - widthdiv2) + sqr(y-heightdiv2)) <= Promien); 
end; 

Function RandomMove(first, last:integer;var W:World) : integer; 

var 
   i, dx, dy, newx, newy,  in:integer; 
Begin 
  in  :=  0; 
  for i := first to last do 
    begin 
      dx := MaxMove div 2 - random(MaxMove); 
      dy := MaxMove div 2 - random(MaxMove); 
      if inside(W[i].x + dx, W[i].y + dy) then 
        begin 
          W[i].x := W[i].x + dx; 
          W[i].y := W[i].y + dy; 
          if insideCircle(W[i].x,  W[i].y) then 
            in  :=  in  +  1; 
        end; 
    end; 
  RandomMove  :=  in; 
  dist  :=  0; 
  for loopI  :=  1 to Last do 
    begin 
      for loopJ  :=  1 to Last do 
        begin 
          if loopI <> loopJ then 
            begin 
              dist  :=  dist  +  sqrt( sqr(W[loopI].x - W[loopJ].x )  +  sqr(W[loopI].y - W[loopJ].y) ); 
            end; 
        end; 
    end; 
end; 

var 
   TheWorld:World; 
   Step:integer; 

Begin 
  Rectangle(0, 0, Width + 1, Height + 1); 
  count  :=  0; 

  Pen(1, 255, 50, 50); 
  Point(Width, Height); 
 
  RandomPosition(1, Last, TheWorld, Width div 2, Height div 2, 100); 
  DrawAll(1, last, TheWorld, 0, 0, 0); 
  widthdiv2  :=  Width div 2; 
  heightdiv2  :=  Height div 2; 
 
  Step := 0; 
  while not isEvent do 
    begin
      DrawAll(1, last, TheWorld, 200, 255, 255); 
      count  :=  RandomMove(1, Last, TheWorld); 
      DrawAll(1, last, TheWorld, 0, 0, 0); 
      Delay(100); 
      ellipse( (widthdiv2) - Promien,  (heightdiv2) - Promien,  (widthdiv2)  +  Promien,  (heightdiv2)  +  Promien); 
      Step := Step + 1; 
      MoveTo(0, 0); 
      Write(Step); 
      MoveTo(0, height - 10); 
      Write('Liczba cz¹steczek w okrêgu '); 
      if count < 10 then 
        writeln('  ',  count) 
      else 
        begin 
          if count < 100 then 
            writeln(' ',  count) 
          else 
            writeln(count); 
        end; 
      write(' œredni dystans miêdzy cz¹steczkami: ',  dist / Last,  '    '); 
    end; 
end.

