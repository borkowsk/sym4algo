program nazwiska_demo; 
{marta melcer, blanka naborowska, anna wrzosek, marcin czaban, pawe³ makuch}

var 
   r,g,b,x,y,i,j:integer; 
   osoba:array[1..5]of integer; 
   rozmiar,kierunek,grubosc:integer; 
   lewa,gora,prawy,dol:integer; 

   const 
   ile_razy=200; 
   d=1; 
   d2=300; 

procedure wstaw_na_plansze; 

begin 
  for i:=1 to 5 do 
    begin 
      delay(d); 
      x:=random(550); 
      y:=random(600); 
      r:=random(255); 
      g:=random(255); 
      b:=random(255); 
      moveto(x,y); 
      TextColor(r,g,b); 
      rozmiar:=random(12); 
      kierunek:=random(360); 
      grubosc:=random(600); 
      font(rozmiar,kierunek,grubosc); 
      if i=1 then 
        writeln('Marta Melcer') 
      else 
        if i=2 then 
          writeln('Blanka Naborowska') 
        else 
          if i=3 then 
            writeln('Ania Wrzosek') 
          else 
            if i=4 then 
              writeln('Pawe³ Makuch') 
            else 
              if i=5 then 
                writeln('Marcin Czaban') 
    end 
end; 

procedure wstaw_kwadrat_z_zawartoscia; 

begin 
  r:=random(255); 
  g:=random(255); 
  b:=random(255); 
  brush(1,r,g,b); 
  textcolor(255-r,255-g,255-b); 
  r:=random(255); 
  g:=random(255); 
  b:=random(255); 
  Pen( 5,r,g,b ); 
  Rectangle( 110, 160, 480, 490); 
  font(14,0,800); 
  x:=(208); 
  y:=(236); 
  Moveto(x,y); 
  writeln('Marta Melcer'); 
  Moveto(x-38,y+34); 
  writeln('Blanka Naborowska'); 
  Moveto(x,y+68); 
  writeln('Ania Wrzosek'); 
  Moveto(x,y+102); 
  writeln('Pawe³ Makuch'); 
  Moveto(x-6,y+136); 
  writeln('Marcin Czaban'); 
end; 

procedure wstaw_ramke; 

begin 
  r:=random(255); 
  g:=random(255); 
  b:=random(255); 
  Pen( 7,r,g,b ); 
  lewa:=80; 
  gora:=130; 
  prawy:=510; 
  dol:=520; 
  Line(lewa,gora,prawy,gora); 
  LineTo(prawy,dol); 
  Lineto(lewa,dol); 
  Lineto(lewa,gora); 
end; 

procedure zmieniaj_kolory; 

begin 
  delay(d2); 
  r:=random(255); 
  g:=random(255); 
  b:=random(255); 
  Pen( 7,r,g,b ); 
  Line(lewa,gora,prawy,gora); 
  LineTo(prawy,dol); 
  Lineto(lewa,dol); 
  Lineto(lewa,gora); 
end; 

begin 
  for j:=1 to ile_razy do 
    wstaw_na_plansze; 
  wstaw_kwadrat_z_zawartoscia; 
  wstaw_ramke; 
  repeat 
    zmieniaj_kolory 
  until isevent; 
end.