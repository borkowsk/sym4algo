{W za³¹czniku przesy³am pracê domow¹.

Pozdrawiam!

Jan Biñczyk}

{Utrudnia pan sobie prace unikaj¹c formatowania}

Program Wahad³o; 

var 
i,s:integer; 
k,m:integer; 

Procedure ko³o(x,y:integer); 
{rysuj kulkê na sznurku w pozycji(x,y)} 

Begin 
moveto(134,50); 
lineto(x+25,y); 
Ellipse(x, y, 50+x, 50+y); 
end; 

Begin 
i:=0; 
for s:=1 to 10 do 
{ iloœæ cykli wahad³a} 
begin 
While i<10 do 
{ruch w prawo} 
begin 
clear; 
{kasowanie zawartoœco okna} 
i:=i+1; 
k:=100+trunc(100*sin(i/10)); 
{wsp. x} 
m:=100+trunc(50*cos(i/10)); 
{wsp. y} 
Pen(2 ,0,0,255 ); 
{gruboœæ i kolor kreski} 
ko³o(k,m); 
{wywo³anie procedury} 
delay(50); 
{opóŸnienie} 
end; 
While i>-10 do 
{ruch w lewo} 
begin 
clear; 
{kasowanie zawartoœco okna} 
i:=i-1; 
k:=100+trunc(100*sin(i/10)); 
{wsp. x} 
m:=100+trunc(50*cos(i/10)); 
{wsp. y} 
Pen(2 ,0,0,255 ); 
{gruboœæ i kolor kreski} 
ko³o(k,m); 
{wywo³anie procedury} 
delay(50); 
{opóŸnienie} 
end; 
end; 
end.
