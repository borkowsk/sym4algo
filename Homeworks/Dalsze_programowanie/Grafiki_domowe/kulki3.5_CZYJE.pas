Program Kulki2; 

Const 
IleSym=100; 
IleKul=20; 
Wyscig=10; 
Margin=64; 
PrMin=60; 
PrMax=80; 
PrMod=10; 
r=8; 
Wyswietl=true; 
Type 
kulka=record 
  reakt,x:real; 
  pred,wygr,stres,przeg,rutyna:integer; 
end; 
Var 
i,j,liczba,los,finished,h1,m1,s1,h2,m2,s2,t:integer; 
rpr:real;
kulki:array[1..IleKul] of kulka; 
wybrane:Array[1..Wyscig] of integer; 
finish:Array[1..Wyscig] of integer; 
plik: Text; 

Procedure LosujKulki(); 

begin 
  for i:=1 to IleKul do 
 begin 
kulki[i].reakt:=(sqr(sin(((random(100)+1)/100)*pi))*2)-1; {rozklad}
kulki[i].pred:=random((PrMax-PrMin)+1)+PrMin; 
kulki[i].wygr:=0; 
kulki[i].przeg:=0; 
kulki[i].stres:=random(7)-3; 
kulki[i].rutyna:=0; 
kulki[i].x:=20; 
 end; 
 rpr:=(IleSym*Wyscig)/IleKul;
end; 

Procedure RysujPlansze(); 

begin 
  pen(1,0,0,0); 
  rectangle(0+Margin,0,500+Margin,Wyscig*40); 
  brush(1,0,0,0); 
  for i:=0 to Wyscig*2-1 do 
 begin 
rectangle(460+((i mod 2)*20)+Margin,i*20,480+((i mod 2)*20)+Margin,(i+1)*20); 
 end; 
  brush(1,255,255,255); 
  moveto(0, Wyscig*40 +40); 
  writeln('Symulacja #',j); 
end; 

Function CzyJest(liczba:integer;ilosc:integer):boolean; 

begin 
  CzyJest:=false; 
  for i:=1 to ilosc do 
 begin 
if wybrane[i]=liczba then 
  CzyJest:=true; 
 end; 
end; 

Procedure WybierzKulki(); 

begin 
  for i:=1 to Wyscig do 
 if IleKul=Wyscig then
 wybrane[i]:=i
 else
 begin 
repeat 
  los:=random(IleKul)+1; 
until not CzyJest(los,i); 
wybrane[i]:=los; 
kulki[wybrane[i]].rutyna:=kulki[wybrane[i]].rutyna+1; 
 end; 
 finish[i]:=0; 
end; 

Procedure RysujKulki(); 

begin 
  for i:=1 to Wyscig do 
 begin 
pen(1,0,0,0); 
if kulki[wybrane[i]].reakt <=0 then 
  brush(1,0,0,round(255*abs(kulki[wybrane[i]].reakt))) 
else 
  brush(1,round(255*abs(kulki[wybrane[i]].reakt)),0,0); 
ellipse(round(kulki[wybrane[i]].x)-r+Margin,i*40-20-r,round(kulki[wybrane[i]].x)+r+Margin,i*40-20+r); 
 end; 
end; 

Procedure WymazKulki(); 

begin 
  for i:=1 to Wyscig do 
 begin 
brush(1,255,255,255); 
pen(1,255,255,255); 
rectangle(round(kulki[wybrane[i]].x)-r+Margin,i*40-20-r,round(kulki[wybrane[i]].x)+r+Margin,i*40-20+r); 
 end; 
end; 

Procedure WypiszDane(); 

begin 
  brush(0,255,255,255); 
  for i:=1 to Wyscig do 
 begin 
moveto(0,(i-1)*40+8); 
writeln(wybrane[i],'   '); 
writeln(kulki[wybrane[i]].pred,'   '); 
 end; 
end; 

Procedure Scigaj(); 

begin 
  finished:=0; 
  while finished<Wyscig do 
 begin 
{ delay(1); } 
if Wyswietl then 
  WymazKulki; 
for i:=1 to Wyscig do 
  if kulki[wybrane[i]].x<480 then 
 begin 
kulki[wybrane[i]].x:=kulki[wybrane[i]].x+((kulki[wybrane[i]].pred+(1-(kulki[wybrane[i]].rutyna/rpr))*(PrMod*kulki[wybrane[i]].reakt*(-kulki[wybrane[i]].stres/3)))/20); 
if kulki[wybrane[i]].x>=480 then 
  begin 
 finished:=finished+1; 
 finish[finished]:=i; 
  end; 
 end; 
if Wyswietl then 
  RysujKulki; 
 end; 
  for i:=1 to Wyscig do 
 kulki[wybrane[i]].x:=20; 
end; 

Procedure OcenWyniki(); 

begin 
  brush(0,255,255,255); 
  moveto(0,40*Wyscig+40); 
  for i:=1 to Wyscig do 
 begin
if i<=3 then 
  begin 
 kulki[wybrane[finish[i]]].wygr:=kulki[wybrane[finish[i]]].wygr+1; 
 if kulki[wybrane[finish[i]]].stres >-3 then 
kulki[wybrane[finish[i]]].stres:=kulki[wybrane[finish[i]]].stres-1; 
  end 
else 
  if i>=8 then 
 begin 
kulki[wybrane[finish[i]]].przeg:=kulki[wybrane[finish[i]]].przeg+1; 
if kulki[wybrane[finish[i]]].stres <3 then 
  kulki[wybrane[finish[i]]].stres:=kulki[wybrane[finish[i]]].stres+1; 
 end; 
 end; 
end; 

Procedure ZapiszExcel(step:integer); 

begin 
  if step=1 then 
 begin 
write(plik,chr(9)); 
for i:=1 to IleKul do 
  write(plik,i,chr(9)); 
writeln(plik,''); 
write(plik,'pred',chr(9)); 
for i:=1 to IleKul do 
  write(plik,kulki[i].pred,chr(9)); 
writeln(plik,''); 
write(plik,'reakt',chr(9)); 
for i:=1 to IleKul do 
  write(plik,kulki[i].reakt:1:3,chr(9)); 
writeln(plik,''); 
 end; 
  write(plik,chr(9)); 
  for i:=1 to IleKul do 
 write(plik,kulki[i].wygr,chr(9)); 
  writeln(plik,''); 
  if step=IleSym then 
 begin 
write(plik,'Rutyna:',chr(9)); 
for i:=1 to IleKul do 
  write(plik,kulki[i].rutyna,chr(9)); 
writeln(plik,''); 
 end; 
end; 

Begin
time(h1,m1,s1); 
Assign(plik,'Z:\wyscig.xls'); 
  Rewrite(plik); 
  LosujKulki; 
  for j:=1 to IleSym do 
 begin 
RysujPlansze; 
WybierzKulki; 
RysujKulki; 
WypiszDane; 
Scigaj; 
OcenWyniki; 
ZapiszExcel(j); 
 end; 
  Close(plik); 
  time(h2,m2,s2);
 t:=(m2*60+s2)-(m1*60+s1);
 moveto(0,Wyscig*40+60);
 writeln('Czas symulacji: ',t div 60,':',t mod 60);
End.