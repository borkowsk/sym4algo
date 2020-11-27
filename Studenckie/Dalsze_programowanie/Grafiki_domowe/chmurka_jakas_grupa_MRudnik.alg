{Magdalena Rudnik, Bartek Kuczyñski, Aleksandra Fi³onowicz
czwartek, godz. 13.45}


program chmura;
var
  chmuraX,chmuraY:integer;

procedure rysuj_tlo;
var 
  i:integer;
begin
{ramka i niebo}
  pen(1,128,128,128);
  brush(1,128,128,255);
  rectangle(0,0,479,269);
{horyzont}
  moveto(0,250);
  lineto(100,250);
  lineto(120,220);
  lineto(130,230);
  lineto(140,210);
{zamek}
  lineto(140,180);
  lineto(200,180);
  lineto(200,210);
  line(140,210,200,210);
  brush(1,128,128,128);
  fill(150,200);
  for i:=0 to 5 do
    rectangle(137+i*8,170,142+i*8,180);
  rectangle(185,150,201,210);
  moveto(185,150);
  lineto(182,150);
  lineto(193,135);
  lineto(204,150);
  lineto(200,150);
  fill(193,140);
{horyzont cd.}
  moveto(200,210);
  lineto(210,235);
  lineto(230,240);
  lineto(235,250);
  lineto(479,250);
  brush(1,128,255,128);
  fill(477,267);
end;

procedure rysuj_slonce;
begin
  pen(3,255,255,128);
  brush(2,255,255,128);
  ellipse(400,30,450,80);
  line(425,5,425,105);
  line(375,55,475,55);
  line(390,20,460,90);
  line(460,20,390,90);
end;

procedure rysuj_chmure(x:integer;y:integer);
begin
  pen(1,255,255,255);
  brush(1,255,255,255);
  ellipse(x-40,y-10,x+20,y+10);
  ellipse(x-10,y-20,x+40,y+10);
  ellipse(x,y,x+40,y+20);
  ellipse(x-20,y,x+20,y+20);
  ellipse(x-30,y-20,x,y);
end;

procedure zamaluj_chmure;
begin
  brush(1,128,128,255);
  fill(chmuraX,chmuraY);
end;

procedure zamaluj_chmure_na_ramce;
begin
  brush(1,128,128,255);
  fill(475,chmuraY);
end;

procedure odnow_ramke;
begin
  pen(1,128,128,128);
  brush(0,0,0,0);
  rectangle(0,0,479,269);
end;

procedure punkt_startu;
begin
  rysuj_tlo;
  rysuj_slonce;
  chmuraX:=50;
  chmuraY:=100;
  rysuj_chmure(chmuraX,chmuraY);
end;

begin
  randomize;
  punkt_startu;
  while not isevent do
    begin
      rysuj_chmure(chmuraX,chmuraY);
      delay(50);
{chmura narysowana na lewej ramce}
      if chmuraX<41 then
        begin
          odnow_ramke;
          zamaluj_chmure;
        end;
{chmura narysowana na prawej ramce}
      if chmuraX>439 then
        begin
          odnow_ramke;
          zamaluj_chmure_na_ramce;
        end;
{chmura nie dotyka ramki}
      if (chmuraX>=41) and (chmuraX<=439) then
        zamaluj_chmure;
{zamalowalismy slonce}
      if chmuraX>=350 then
        rysuj_slonce;
      chmuraX:=chmuraX+5;
      if chmuraX>520 then
        begin
        chmuraX:=-40;
        chmuraY:=random(70)+30;
        end;
    end;
    moveto(300,180);
    brush(1,128,128,255);
    textcolor(0,0,0);
    font(24,0,1000);
    write('KONIEC');
end.