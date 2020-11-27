Program wizja; 


Procedure rgb_los; 

Var 
r,g,b:integer; 
Begin 
r:=random(256); 
g:=random(256); 
b:=random(256); 
Pen(1,r,g,b); 
end; 

Procedure rgb_lok; 

Var 
r,g,b:integer; 
Begin 
r:=random(256); 
g:=random(256); 
b:=random(256); 
brush(1,r,g,b); 
end; 

Procedure rgb_pen; 

Var 
r,g,b:integer; 
Begin 
r:=random(256); 
g:=random(256); 
b:=random(256); 
pen(1,r,g,b); 
end; 

Var 
z,h,g,n,f,t,d,m,w,a:integer; 

Begin 
g:=0; 
while g<12 do 
For z:=random(10) to 700 do 
Begin 
g:=12; 
pen(256,0,250,0); 
MoveTo(600,z-200); 
rgb_pen; 
pen(1,60,z*20,256); 
LineTo(0, z); 
g:=g+2 ; 
end ; 
Begin 
begin 
m:=500; 
w:=0; 
f:=110; 
n:=0; 
While m>0 do 
Begin 
rgb_los; 
Ellipse(1, 1, w, n); 
n:=n+1; 
w:=w+1; 
m:=m-1; 
delay(20); 
end; 
write('____'); 
end; 
Begin 
Font(9,0,9); 
TextColor(0, 0, 255); 
delay(1150); 
WriteLn('Mia³em dzi? ol?nienie z góry ..... '); 
delay(1150); 
clear; 
If true then 
begin 
g:=0; 
while g<12 do 
For z:=random(10) to 700 do 
Begin 
g:=12; 
pen(256,0,250,0); 
MoveTo(600,z-200); 
rgb_pen; 
pen(1,z*60,z*20,256); 
LineTo(0, z); 
g:=g+2 ; 
end ; 
Begin 
d:=150; 
f:=11; 
While d>0 do 
Begin 
rgb_los; 
For z:=1 to random(40) do 
Ellipse(1, 10, n, f); 
rgb_los; 
For z:=21 to 80 do 
Ellipse(1, 10, n, f); 
rgb_los; 
For z:=81 to random(160) do 
Ellipse(1, z, n, f); 
rgb_los; 
For z:=161 to 200 do 
Ellipse(1, z, n, f); 
d:=d-1; 
f:=f+4; 
n:=n+1; 
delay(10); 
end; 
end; 
Begin 
delay(1150); 
write('Zobaczy³em têczowy spodek......'); 
delay(1150); 
If true then 
clear; 
d:=50; 
z:=1; 
g:=107; 
n:=10; 
h:=100; 
While d>0 do 
begin 
Rectangle(g, z, n, h); 
delay(50); 
Rectangle(g, z, n, h); 
delay(50); 
Rectangle(g, z, n, h); 
delay(50); 
h:=h-1; 
n:=n+1; 
g:=g+2; 
d:=d-1; 
z:=z+11; 
end; 
end; 
end; 
n:=1; 
while n <100 do 
begin 
Writeln('Z jego wnêtrza wysune³y siê schody ... '); 
Rectangle(0, 2,1, 2); 
delay(50); 
rgb_lok; 
Fill(10, 10); 
n:=n+1; 
end; 
Begin 
clear; 
Point(50,10); 
Point(40,10); 
Point(30,10); 
Point(20,10); 
delay(150); 
Point(20,20); 
Point(20,30); 
Point(20,40); 
Point(30,40); 
Point(40,40); 
Point(50,40); 
Point(50,50); 
Point(50,60); 
delay(150); 
Point(50,70); 
Point(40,70); 
Point(30,70); 
Point(20,70); 
delay(150); 
Pen(5,3,131,251); 
Point(100,40); 
Point(90,40); 
Point(80,40); 
Point(70,40); 
delay(150); 
Point(60,40); 
Point(100,30); 
Point(100,20); 
Point(100,10); 
delay(150); 
Point(90,10); 
Point(80,10); 
Point(70,10); 
Point(60,10); 
delay(150); 
Point(60,20); 
Point(60,30); 
Point(60,40); 
Point(60,50); 
delay(150); 
Point(60,60); 
Point(60,70); 
Pen(5,5,184,35); 
Point(110,10); 
Point(110,20); 
Point(110,30); 
Point(110,40); 
delay(150); 
Point(110,50); 
Point(110,60); 
Point(110,70); 
Pen(1,215,0,167); 
Point(120,10); 
Point(120,20); 
Point(120,30); 
Point(120,40); 
delay(300); 
Point(120,50); 
Point(120,60); 
Point(120,70); 
Point(130,30); 
delay(300); 
Point(140,20); 
Point(150,10); 
Point(130,50); 
Point(140,60); 
Point(150,70); 
{kolor - red} 
Pen(5,255,0,0); 
line(20,10,50,10); 
Pen(5,255,0,0); 
line(20,10,20,40); 
Pen(5,255,0,0); 
line(20,40,50,40); 
Pen(5,255,0,0); 
line(50,40,50,70); 
Pen(5,255,0,0); 
line(50,70,20,70); 
delay (150); 
{kolor - blue} 
Pen(5,0,0,255); 
line(60,10,100,10); 
Pen(5,0,0,255); 
line(60,70,60,10); 
Pen(5,0,0,255); 
line(60,40,100,40); 
Pen(5,0,0,255); 
line(100,10,100,40); 
delay(150); 
{kolor - green} 
Pen(5,0,255,0); 
line(110,10,110,70); 
delay(150); 
{kolor - black} 
Pen(5,50,50,50); 
line(120,10,120,70); 
Pen(5,50,50,50); 
line(150,10,120,40); 
Pen(5,50,50,50); 
line(150,70,120,40); 
delay(150); 
{opis grupy} 
Font(10,0,400); 
writeLn(''); 
writeLn(''); 
WriteLn('Dziêkujemy za uwagê :-)'); 
delay(250); 
Font(8,0,800); 
WriteLn(' Janek Trawiñski'); 
delay(250); 
Font(8,0,800); 
WriteLn(' Mariusz Karbowski'); 
delay(250); 
Font(8,0,800); 
WriteLn(' Karolina Józwiak'); 
delay(250); 
Font(8,0,800); 
WriteLn(' Dorota Wardecka'); 
delay(250); 
Font(10,0,800); 
WriteLn(' to ju¿ koniec! :-(');
begin 
a:=1; 
while a<5 do 
begin 
delay(450); 
clear; 
Pen( 20, 51, 33,3); 
Line(30, 200, 50, 30); 
Delay(70); 
Pen( 20, 251, 3,3); 
Line(30, 200, 100, 30); 
Delay(70); 
Pen( 20, 251, 3,196); 
Line(30, 200, 200, 30); 
Delay(70); 
Pen( 20, 184, 3,251); 
Line(30, 200, 300, 30); 
Delay(70); 
Pen( 20, 79, 3,251); 
Line(30, 200, 400, 30); 
Delay(70); 
Pen( 20, 3, 131,251); 
Line(30, 200, 500, 30); 
Delay(70); 
Pen( 20, 3, 225,251); 
Line(30, 200, 600, 60); 
Delay(70); 
Pen( 20, 3, 251,44); 
Line(30, 200, 700, 100); 
Delay(70); 
Pen( 20, 149, 251,3); 
Line(30, 200, 800, 160); 
Delay(70); 
Pen( 20, 242, 251,3); 
Line(30, 200, 900, 230); 
Delay(70); 
Pen( 20, 251, 184,3); 
Line(30, 200, 1000, 310); 
Pen( 20, 251, 3,3); 
Line(30, 200, 900, 360); 
Delay(70); 
Pen( 20, 251, 36,196); 
Line(30, 200, 800, 400); 
Delay(70); 
Pen( 20, 184, 69,251); 
Line(30, 200, 700, 440); 
Delay(70); 
Pen( 20, 79, 34,251); 
Line(30, 200, 600, 480); 
Delay(70); 
Pen( 20, 0, 13, 61); 
Line(30, 200, 500, 500); 
Delay(70); 
Pen( 20, 65, 5, 1); 
Line(30, 200, 400, 530); 
Delay(70); 
Pen( 20, 1, 255, 0); 
Line(30, 200, 300, 570); 
Delay(70); 
Pen( 20, 49, 51,632); 
Line(30, 200, 200, 600); 
Delay(70); 
Pen( 20, 242, 251,3); 
Line(30, 200, 110, 650); 
Delay(70); 
Pen( 20, 251, 4,33); 
Line(30, 200, 50, 670); 
Delay(70); 
Pen( 20, 5, 162,96); 
Line(30, 200, 0, 700); 
a:=a+1; 
if a=5 then 
begin 
font(8,0,800); 
writeLn('teraz to ju¿ na prawdê koniec ;-)'); 
delay(900); 
clear; 



end; 
end;
end;
end;
end;
end;
end.
