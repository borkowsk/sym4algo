{W za��czniku przesy�am prac� domow�.

Pozdrawiam!

Jan Bi�czyk}

{Utrudnia pan sobie prace unikaj�c formatowania}

Program Wahad�o; 

var 
i,s:integer; 
k,m:integer; 

Procedure ko�o(x,y:integer); 
{rysuj kulk� na sznurku w pozycji(x,y)} 

Begin 
moveto(134,50); 
lineto(x+25,y); 
Ellipse(x, y, 50+x, 50+y); 
end; 

Begin 
i:=0; 
for s:=1 to 10 do 
{ ilo�� cykli wahad�a} 
begin 
While i<10 do 
{ruch w prawo} 
begin 
clear; 
{kasowanie zawarto�co okna} 
i:=i+1; 
k:=100+trunc(100*sin(i/10)); 
{wsp. x} 
m:=100+trunc(50*cos(i/10)); 
{wsp. y} 
Pen(2 ,0,0,255 ); 
{grubo�� i kolor kreski} 
ko�o(k,m); 
{wywo�anie procedury} 
delay(50); 
{op�nienie} 
end; 
While i>-10 do 
{ruch w lewo} 
begin 
clear; 
{kasowanie zawarto�co okna} 
i:=i-1; 
k:=100+trunc(100*sin(i/10)); 
{wsp. x} 
m:=100+trunc(50*cos(i/10)); 
{wsp. y} 
Pen(2 ,0,0,255 ); 
{grubo�� i kolor kreski} 
ko�o(k,m); 
{wywo�anie procedury} 
delay(50); 
{op�nienie} 
end; 
end; 
end.
