Program wladca_moch; 
{Sk�ad grupy: Malina Fidyk, Micha� Kowalczyk, Andrzej Salski} 

var 
   r:integer; 
   {promie� g�owy Czesia} 
   x:integer; 
   {Punkt x �rodka g�owy} 
   y:integer; 
   {Punkt y �rodka g�owy} 
   ruchy:integer; 
   {Ilo�� ruch�w} 

procedure kwiatuszek(ilosc:integer); 

var 
   k:integer; 
   {x dla kwiatka} 
   l:integer; 
   {y dla kwiatka} 
   m:integer; 
   {promie� dla kwiatka} 
   i:integer ; 
   {zmienna index do zmiany ilosci kwiatkow} 
Begin 
  for i:=1 to ilosc do 
    begin 
      pen(1,255, 0, 128); 
      k:=Random(500)+50; 
      l:=540; 
      m:=Random(10)+7; 
      {�rodek kwiatuszka} 
      Ellipse(k-m, l-m, k+m, l+m); 
      Brush(1,234, 143, random(155)); 
      Fill(k,l); 
      {p�atek lewy kwiatuszka} 
      Ellipse(k-3*m, l+m div 2, k-m, l-m div 2); 
      Brush(1,255, 0, 128); 
      Fill(k-2*m,l); 
      {p�atek prawy kwiatuszka} 
      Ellipse(k+3*m, l+m div 2, k+m, l-m div 2); 
      Brush(1,255, 0, 128); 
      {p�atek dolny kwiatuszka} 
      Ellipse(k-m div 2, l+3*m, k+m div 2, l+m); 
      Brush(1,255, 0, 128); 
      {p�atek g�rny kwiatuszka} 
      Ellipse(k-m div 2, l-3*m, k+m div 2, l-m); 
      Brush(1,255, 0, 128); 
    end; 
end; 

Procedure trawka; 

Var 
   z,l,p,k,q:integer; 
   {trawka} 
Begin 
  pen(1,0, 255, 128); 
  MoveTo (0, 480); 
  p:=-1; 
  Brush (1,155, 155, 155); 
  For k:=1 to 1000 do 
    Begin 
      l:=450+p*2+random(20); 
      LineTo (k,l+20); 
      k:=k+2; 
    end; 
  lineTo(1000,601); 
  lineTo(0,601); 
  LineTo(0,480); 
  {niebo} 
  Begin 
    pen(1,0, 0, 255); 
    MoveTo (0, 60); 
    p:=-1; 
    Brush (1,29, 226, 142); 
    For k:=1 to 1000 do 
      Begin 
        l:=60+p*2+random(5); 
        LineTo(k,l-2); 
        k:=k+5; 
      end; 
    lineTo(1000,0); 
    lineTo(0,0); 
    LineTo(0,60); 
    Fill(45, 600); 
    Brush (1,0, 0, 255); 
    Fill(140, 10); 
    Begin 
      pen(1,255, 255, 0); 
      Brush(1,255, 250, 55); 
      Ellipse(10, 10, 80, 80); 
    end; 
  end; 
  kwiatuszek(random(3)); 
end; 
{Procedura rysowanie Czesia z podniesionymi obiema r�kami} 

Procedure czesio_rg(x,y,r:integer); 

Begin 
  Ellipse(x-r, y-r, x+r, y+r) 
  {g�owa}; 
  Rectangle(x-r-5, y+r, x+r+5, y+5*r) 
  {t��w}; 
  Rectangle(x-r-5, y+5*r, x-10, y+9*r) 
  {prawa noga}; 
  Rectangle(x+10, y+5*r, x+r+5, y+7*r) 
  {g�rna cz�� lewej nogai}; 
  Rectangle(x+10, y+5*r, x+r+5, y+9*r) 
  {dolna cz�� lewej nogi}; 
  Rectangle(x-r-5, y+2*r, x-2*r , y-2*r 
  {prawa r�ka}); 
  Rectangle(x+r+5, y+2*r, x+2*r , y-2*r 
  {lewa r�ka}); 
end; 
{Procedura rysowanie Czesia z ustawionymi do do�u obiema r�kami} 

Procedure czesio_rd(x,y,r:integer); 

Begin 
  Ellipse(x-r, y-r, x+r, y+r) 
  {g�owa}; 
  Rectangle(x-r-5, y+r, x+r+5, y+5*r) 
  {t��w}; 
  Rectangle(x-r-5, y+5*r, x-10, y+9*r) 
  {prawa noga}; 
  Rectangle(x+10, y+5*r, x+r+5, y+7*r) 
  {g�rna cz�� lewej nogai}; 
  Rectangle(x+10, y+5*r, x+r+5, y+9*r) 
  {dolna cz�� lewej nogi}; 
  Rectangle(x-r-5, y+5*r, x-2*r , y+r 
  {prawa r�ka}); 
  Rectangle(x+r+5, y+5*r, x+2*r , y+r 
  {lewa r�ka}); 
end; 
{Procedura rysowanie Czesia z ustawionymi w bok obiema r�kami} 

Procedure czesio_rb(x,y,r:integer); 

Begin 
  Ellipse(x-r, y-r, x+r, y+r) 
  {g�owa}; 
  Rectangle(x-r-5, y+r, x+r+5, y+5*r) 
  {t��w}; 
  Rectangle(x-r-5, y+5*r, x-10, y+9*r) 
  {prawa noga}; 
  Rectangle(x+10, y+5*r, x+r+5, y+7*r) 
  {g�rna cz�� lewej nogai}; 
  Rectangle(x+10, y+5*r, x+r+5, y+9*r) 
  {dolna cz�� lewej nogi}; 
  Rectangle(x-r-5, y+r, x-5*r , y+2*r 
  {prawa r�ka}); 
  Rectangle(x+r+5, y+r, x+5*r , y+2*r 
  {lewa r�ka}); 
end;


Procedure mucha(xm,ym:integer); 

Begin 
  {mucha o wsp��dnych xm (x muxhy) i ym (y muchy). Jest zastosowana
  funkcja lini poniewa� punkt jest zbyt ma�y i s�abo widoczny} 
  Line( xm, ym, xm,ym); 
end; 

Procedure czesio_wstep(x,y,r:integer); 

var 
   i:integer; 
   {zmienna index do p�tli} 
Begin 
  {rysowanie trawki} 
  trawka; 
  {ryswanie 2 kwiatuszk�w} 
  kwiatuszek(2); 
  {Ustawienie koloru sk�ry dla czesia} 
  Brush(1,238, 187, 111); 
  {Wykonanie ruchu do przodu tyle razy ile jest wartosc ruchy} 
  for i:=1 to ruchy do 
    begin 
      {ustawienie pisaka na czarny kolor} 
      pen(1,0, 0, 0); 
      {Narysowanie Czesia z r�koma do do�u o promieniu i} 
      czesio_rd(x,y,i); 
      {przeczekanie 150 milisekund} 
      delay(150); 
      {Ustawienie pisaka na bia�y kolor} 
      pen(1,255, 255, 255) ; 
      {wymazanie Cczesia poprzez narysowanie go bia�ym pisakiem} 
      czesio_rd(x,y,i); 
    end ; 
  {ustawienie pisaka na kolor czarny} 
  pen(1,0, 0, 0); 
  {Narysownanie Czesia aby po doj�ciu do celu by� widoczny} 
  czesio_rd(x,y,r); 
  {przesuni�cie "kursora" nad g�ow� Czesia} 
  MoveTo( x+4*r, y-2*r); 
  {Czesio doszed� wi�c si� wita przectawiaj�c si� :-) } 
  writeln('Nazywam si� Czesio...'); 
  {Odczekanie 2 i p� sekundy} 
  delay(2500); 
end; 
{Czesio lubi robi� pajaca, a to jest procedura kt�ra daje Czesiowui t� mo�liwo��} 

Procedure pajac(x,y,r:integer); 

var 
   i:integer; 
Begin 
  {Przesuni�cie "kursora" nad g�ow� czesia"} 
  MoveTo( x+4*r, y-2*r); 
  {napisanie na ekranie co Czesio b�dzie robi�} 
  writeln('Czesio lubi pajaca... hehehe'); 
  {dorysowanie do dwu kwiatuszk�w} 
  kwiatuszek(random(3)); 
  {Odczekanie 1,5 s} 
  delay(1500); 
  {Wykonanie takiej ilo�ci "pajacyk�w" tyle jaka jest warto�� zmiennej ruchy} 
  for i:=1 to ruchy do 
    begin 
      {ustawienie koloru sk�ry Czesia} 
      Brush(1,238, 187, 111); 
      {Ustawienie pisaka aby by� koloru bia�ego} 
      pen(1,0,0,0); 
      {Narysownaie Czesia z obiema r�kami do g�ry} 
      czesio_rd(x,y,r); 
      {odczekanie 1,5 sekundy} 
      delay(150); 
      {ustawienie koloru sk�ry (wype�nienia i pisaka) na bia�� - przezroczyst�} 
      pen(1,255, 255, 255) ; 
      Brush(1,255, 255, 255); 
      {Wymazanie Czesia, czyli "skasownie go z ekranu} 
      czesio_rd(x,y,r); 
      {ponowna zmiana koloru sk�ry Czesia} 
      pen(1,0,0,0) ; 
      Brush(1,238, 187, 111); 
      {Narysownaie Czesia ponownie, tylko �e ju� z obiema r�kami w bok} 
      czesio_rb(x,y,r); 
      {odczekanie 1,5 s. (dalej jest to samo tylko inne ustawienie r�k :-)} 
      delay(150); 
      pen(1,255, 255, 255) ; 
      Brush(1,255, 255, 255); 
      czesio_rb(x,y,r); 
      pen(1,0,0,0) ; 
      Brush(1,238, 187, 111); 
      czesio_rg(x,y,r); 
      delay(150); 
      pen(1,255, 255, 255) ; 
      Brush(1,255, 255, 255); 
      czesio_rg(x,y,r); 
      pen(1,0,0,0) ; 
      Brush(1,238, 187, 111); 
      czesio_rb(x,y,r); 
      delay(150); 
      pen(1,255, 255, 255) ; 
      czesio_rb(x,y,r); 
    end; 
end;

{Procedura �apania muchy} 

Procedure lapie_muche(x,y,r:integer); 

var 
   los:integer; 
   {zmienna losuj�ca ustawi�nie r�k w nast�pnym podej�ciu do losowania} 
   xm:integer; 
   {Pocz�tkowe miejsce pojawienia si� muchy punkt x} 
   ym:integer; 
   {Pocz�tkowe miejsce pojawienia si� muchy punkt y} 
   g:integer; 
   {grubo�� muchy, oraz informacja o tym czy mucha zosta�a z�apana} 
   i:integer; 
   {index do p�tli} 
   n:integer; 
   {losowa warto�� ile mucha si� poruszy w poziomie} 
   m:integer; 
   {losowa warto�� ile mucha si� poruszy w pionie} 
Begin 
  {ustalamy grubo�� muchy} 
  g:=5; 
  {ustalamy wsp�rz�dne startowe muchy} 
  xm:=340; 
  ym:=243; 
  {ustalamy kolor t�a dla napisu} 
  Brush(1,238, 187, 111); 
  {przesuwamy kursor} 
  MoveTo( x-r*2, y-2*r); 
  {piszemy} 
  writeln('A teraz Czesio b�dzie �apa� much�... hehehe'); 
  {czekamy} 
  delay(3500); 
  {czy�cimy ca�y ekran} 
  clear; 
  {rysujemy od pocz�tku trawk� oraz kwiatuszki} 
  trawka; 
  kwiatuszek(random(4)+1); 
  {Czesio teraz b�dzie �apa� muche do ruchy razy} 
  for i:=1 to ruchy do 
    begin 
      {ustalamy pisak na kolor czarny i kolor sk�ry Czesia} 
      Pen(1,0,0,0); 
      Brush(1,238, 187, 111); 
      {losujemy pozycje r�k Czesia} 
      los:=random(2); 
      {sprawdzamy, kt�ra pozycja zosta�a wylosowana i ja rysujemy} 
      if los>0 then 
        begin 
          {rysujemy wylosowanego Czesia} 
          czesio_rb(x,y,r); 
          pen(g,0,0,0); 
          {Losujemy ruch muchy} 
          n:=random(11)-5; 
          m:=random(11)-5; 
          {Nadajemy warto�ci zmiennym} 
          xm:=xm+n; 
          ym:=ym+m; 
          {rysujemy much�} 
          mucha(xm, ym); 
          {sprawdzamy czy mucha nie zosta�a z�apana przez Czesia} 
          if (xm<(x+5*r)) and (ym<(y+2*r))then 
          {Je�li tak si� sta�o to nadajemy warto�ci aby zako�czy� p�tle
          g jest dla informacji czy mucha zosta�a z�apana} 
            begin 
              i:=ruchy; 
              g:=1; 
            end 
          else 
            begin 
              delay(100); 
              Brush( 1,255, 255, 255 ); 
              pen(g,255,255,255); 
              czesio_rb(x,y,r); 
              mucha(xm, ym); 
            end; 
        end 
      else 
        begin 
          czesio_rg(x,y,r); 
          pen(g,0,0,0); 
          n:=random(11)-5; 
          m:=random(11)-5; 
          xm:=xm+n; 
          ym:=ym+m; 
          mucha(xm, ym); 
          if (xm<(x+5*r)) and (ym<(y+2*r))then 
            begin 
              i:=ruchy; 
              g:=1; 
            end 
          else 
            begin 
              delay(100); 
              Brush( 1,255, 255, 255 ); 
              pen(g,255,255,255); 
              czesio_rg(x,y,r); 
              mucha(xm, ym); 
            end; 
        end; 
    end; 
  Brush( 1,94, 235, 33); 
  if g>1 then 
    begin 
      MoveTo( x-6*r, y div 2); 
      font(8, 20, 600); 
      write('Czesio '); 
      font(8, 0, 600); 
      write('przeprasza, nie z�apa� '); 
      font(8, 340, 600); 
      write(' muchy :-('); 
    end 
  else 
    begin 
      MoveTo( x-6*r, y div 2); 
      font(8, 340, 600); 
      write('Czesio '); 
      font(8, 0, 600); 
      write('z�apa� much�'); 
      font(8,30,600); 
      write(' hehehe'); 
    end; 
  delay(2000); 
end; 

Begin 
  r:=20; 
  x:=230; 
  y:=260; 
  ruchy:=20; 
  czesio_wstep(x,y,r); 
  pajac(x,y,r); 
  ruchy:=125; 
  lapie_muche(x,y,r); 
end.

