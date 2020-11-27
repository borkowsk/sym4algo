{Posiadamy wersjê demo Algo, w której nie da siê zapisywaæ programów do 
pliku. Dlatego program wysy³amy w takiej formie a nie innej.}

{Brak procedur. A tresc choæ ³adna, to prosta, i jakby znajoma?}

Program Maja_Gosia_Szymon_Micha³;

var
   i,j:integer;

begin
brush(1,255,255,0);
rectangle(10,10,390,320);

for j:=1 to 9 do  
  for i:=10 to 30 do
    begin
    delay(10);
      Pen(i, i*20,j*67, 89*j);
      line(40*j, i, 40*j, i*10)
    end;
pen(2,0,0,0);
rectangle(10,130,390,320);
brush(1,204,0,51);
rectangle(30,150,370,300);
brush(1,255,102,255);
Font(18,0,800);
moveto(60,210);
writeln('KOLOROWE KREDKI');

end.
