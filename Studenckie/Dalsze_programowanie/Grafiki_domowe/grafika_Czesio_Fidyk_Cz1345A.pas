Program wladca_moch; 
{Sk³ad grupy: Malina Fidyk, Micha³ Kowalczyk, Andrzej Salski} 

var 
   r:integer; 
   {promieñ g³owy Czesia} 
   x:integer; 
   {Punkt x œrodka g³owy} 
   y:integer; 
   {Punkt y œrodka g³owy} 
   ruchy:integer; 
   {Iloœæ ruchów} 

procedure kwiatuszek(ilosc:integer); 

var 
   k:integer; 
   {x dla kwiatka} 
   l:integer; 
   {y dla kwiatka} 
   m:integer; 
   {promieñ dla kwiatka} 
   i:integer ; 
   {zmienna index do zmiany ilosci kwiatkow} 
Begin 
  for i:=1 to ilosc do 
    begin 
      pen(1,255, 0, 128); 
      k:=Random(500)+50; 
      l:=540; 
      m:=Random(10)+7; 
      {œrodek kwiatuszka} 
      Ellipse(k-m, l-m, k+m, l+m); 
      Brush(1,234, 143, random(155)); 
      Fill(k,l); 
      {p³atek lewy kwiatuszka} 
      Ellipse(k-3*m, l+m div 2, k-m, l-m div 2); 
      Brush(1,255, 0, 128); 
      Fill(k-2*m,l); 
      {p³atek prawy kwiatuszka} 
      Ellipse(k+3*m, l+m div 2, k+m, l-m div 2); 
      Brush(1,255, 0, 128); 
      {p³atek dolny kwiatuszka} 
      Ellipse(k-m div 2, l+3*m, k+m div 2, l+m); 
      Brush(1,255, 0, 128); 
      {p³atek górny kwiatuszka} 
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
{Procedura rysowanie Czesia z podniesionymi obiema rêkami} 

Procedure czesio_rg(x,y,r:integer); 

Begin 
  Ellipse(x-r, y-r, x+r, y+r) 
  {g³owa}; 
  Rectangle(x-r-5, y+r, x+r+5, y+5*r) 
  {t³ów}; 
  Rectangle(x-r-5, y+5*r, x-10, y+9*r) 
  {prawa noga}; 
  Rectangle(x+10, y+5*r, x+r+5, y+7*r) 
  {górna czêœæ lewej nogai}; 
  Rectangle(x+10, y+5*r, x+r+5, y+9*r) 
  {dolna czêœæ lewej nogi}; 
  Rectangle(x-r-5, y+2*r, x-2*r , y-2*r 
  {prawa rêka}); 
  Rectangle(x+r+5, y+2*r, x+2*r , y-2*r 
  {lewa rêka}); 
end; 
{Procedura rysowanie Czesia z ustawionymi do do³u obiema rêkami} 

Procedure czesio_rd(x,y,r:integer); 

Begin 
  Ellipse(x-r, y-r, x+r, y+r) 
  {g³owa}; 
  Rectangle(x-r-5, y+r, x+r+5, y+5*r) 
  {t³ów}; 
  Rectangle(x-r-5, y+5*r, x-10, y+9*r) 
  {prawa noga}; 
  Rectangle(x+10, y+5*r, x+r+5, y+7*r) 
  {górna czêœæ lewej nogai}; 
  Rectangle(x+10, y+5*r, x+r+5, y+9*r) 
  {dolna czêœæ lewej nogi}; 
  Rectangle(x-r-5, y+5*r, x-2*r , y+r 
  {prawa rêka}); 
  Rectangle(x+r+5, y+5*r, x+2*r , y+r 
  {lewa rêka}); 
end; 
{Procedura rysowanie Czesia z ustawionymi w bok obiema rêkami} 

Procedure czesio_rb(x,y,r:integer); 

Begin 
  Ellipse(x-r, y-r, x+r, y+r) 
  {g³owa}; 
  Rectangle(x-r-5, y+r, x+r+5, y+5*r) 
  {t³ów}; 
  Rectangle(x-r-5, y+5*r, x-10, y+9*r) 
  {prawa noga}; 
  Rectangle(x+10, y+5*r, x+r+5, y+7*r) 
  {górna czêœæ lewej nogai}; 
  Rectangle(x+10, y+5*r, x+r+5, y+9*r) 
  {dolna czêœæ lewej nogi}; 
  Rectangle(x-r-5, y+r, x-5*r , y+2*r 
  {prawa rêka}); 
  Rectangle(x+r+5, y+r, x+5*r , y+2*r 
  {lewa rêka}); 
end;


Procedure mucha(xm,ym:integer); 

Begin 
  {mucha o wspó³¿êdnych xm (x muxhy) i ym (y muchy). Jest zastosowana
  funkcja lini poniewa¿ punkt jest zbyt ma³y i s³abo widoczny} 
  Line( xm, ym, xm,ym); 
end; 

Procedure czesio_wstep(x,y,r:integer); 

var 
   i:integer; 
   {zmienna index do pêtli} 
Begin 
  {rysowanie trawki} 
  trawka; 
  {ryswanie 2 kwiatuszków} 
  kwiatuszek(2); 
  {Ustawienie koloru skóry dla czesia} 
  Brush(1,238, 187, 111); 
  {Wykonanie ruchu do przodu tyle razy ile jest wartosc ruchy} 
  for i:=1 to ruchy do 
    begin 
      {ustawienie pisaka na czarny kolor} 
      pen(1,0, 0, 0); 
      {Narysowanie Czesia z rêkoma do do³u o promieniu i} 
      czesio_rd(x,y,i); 
      {przeczekanie 150 milisekund} 
      delay(150); 
      {Ustawienie pisaka na bia³y kolor} 
      pen(1,255, 255, 255) ; 
      {wymazanie Cczesia poprzez narysowanie go bia³ym pisakiem} 
      czesio_rd(x,y,i); 
    end ; 
  {ustawienie pisaka na kolor czarny} 
  pen(1,0, 0, 0); 
  {Narysownanie Czesia aby po dojœciu do celu by³ widoczny} 
  czesio_rd(x,y,r); 
  {przesuniêcie "kursora" nad g³owê Czesia} 
  MoveTo( x+4*r, y-2*r); 
  {Czesio doszed³ wiêc siê wita przectawiaj¹c siê :-) } 
  writeln('Nazywam siê Czesio...'); 
  {Odczekanie 2 i pó³ sekundy} 
  delay(2500); 
end; 
{Czesio lubi robiæ pajaca, a to jest procedura która daje Czesiowui tê mo¿liwoœæ} 

Procedure pajac(x,y,r:integer); 

var 
   i:integer; 
Begin 
  {Przesuniêcie "kursora" nad g³owê czesia"} 
  MoveTo( x+4*r, y-2*r); 
  {napisanie na ekranie co Czesio bêdzie robiæ} 
  writeln('Czesio lubi pajaca... hehehe'); 
  {dorysowanie do dwu kwiatuszków} 
  kwiatuszek(random(3)); 
  {Odczekanie 1,5 s} 
  delay(1500); 
  {Wykonanie takiej iloœci "pajacyków" tyle jaka jest wartoœæ zmiennej ruchy} 
  for i:=1 to ruchy do 
    begin 
      {ustawienie koloru skóry Czesia} 
      Brush(1,238, 187, 111); 
      {Ustawienie pisaka aby by³ koloru bia³ego} 
      pen(1,0,0,0); 
      {Narysownaie Czesia z obiema rêkami do góry} 
      czesio_rd(x,y,r); 
      {odczekanie 1,5 sekundy} 
      delay(150); 
      {ustawienie koloru skóry (wype³nienia i pisaka) na bia³¹ - przezroczyst¹} 
      pen(1,255, 255, 255) ; 
      Brush(1,255, 255, 255); 
      {Wymazanie Czesia, czyli "skasownie go z ekranu} 
      czesio_rd(x,y,r); 
      {ponowna zmiana koloru skóry Czesia} 
      pen(1,0,0,0) ; 
      Brush(1,238, 187, 111); 
      {Narysownaie Czesia ponownie, tylko ¿e ju¿ z obiema rêkami w bok} 
      czesio_rb(x,y,r); 
      {odczekanie 1,5 s. (dalej jest to samo tylko inne ustawienie r¹k :-)} 
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

{Procedura ³apania muchy} 

Procedure lapie_muche(x,y,r:integer); 

var 
   los:integer; 
   {zmienna losuj¹ca ustawiênie r¹k w nastêpnym podejœciu do losowania} 
   xm:integer; 
   {Pocz¹tkowe miejsce pojawienia siê muchy punkt x} 
   ym:integer; 
   {Pocz¹tkowe miejsce pojawienia siê muchy punkt y} 
   g:integer; 
   {gruboœæ muchy, oraz informacja o tym czy mucha zosta³a z³apana} 
   i:integer; 
   {index do pêtli} 
   n:integer; 
   {losowa wartoœæ ile mucha siê poruszy w poziomie} 
   m:integer; 
   {losowa wartoœæ ile mucha siê poruszy w pionie} 
Begin 
  {ustalamy gruboœæ muchy} 
  g:=5; 
  {ustalamy wspó³rzêdne startowe muchy} 
  xm:=340; 
  ym:=243; 
  {ustalamy kolor t³a dla napisu} 
  Brush(1,238, 187, 111); 
  {przesuwamy kursor} 
  MoveTo( x-r*2, y-2*r); 
  {piszemy} 
  writeln('A teraz Czesio bêdzie ³apaæ muchê... hehehe'); 
  {czekamy} 
  delay(3500); 
  {czyœcimy ca³y ekran} 
  clear; 
  {rysujemy od pocz¹tku trawkê oraz kwiatuszki} 
  trawka; 
  kwiatuszek(random(4)+1); 
  {Czesio teraz bêdzie ³apaæ muche do ruchy razy} 
  for i:=1 to ruchy do 
    begin 
      {ustalamy pisak na kolor czarny i kolor skóry Czesia} 
      Pen(1,0,0,0); 
      Brush(1,238, 187, 111); 
      {losujemy pozycje r¹k Czesia} 
      los:=random(2); 
      {sprawdzamy, która pozycja zosta³a wylosowana i ja rysujemy} 
      if los>0 then 
        begin 
          {rysujemy wylosowanego Czesia} 
          czesio_rb(x,y,r); 
          pen(g,0,0,0); 
          {Losujemy ruch muchy} 
          n:=random(11)-5; 
          m:=random(11)-5; 
          {Nadajemy wartoœci zmiennym} 
          xm:=xm+n; 
          ym:=ym+m; 
          {rysujemy muchê} 
          mucha(xm, ym); 
          {sprawdzamy czy mucha nie zosta³a z³apana przez Czesia} 
          if (xm<(x+5*r)) and (ym<(y+2*r))then 
          {Jeœli tak siê sta³o to nadajemy wartoœci aby zakoñczyæ pêtle
          g jest dla informacji czy mucha zosta³a z³apana} 
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
      write('przeprasza, nie z³apa³ '); 
      font(8, 340, 600); 
      write(' muchy :-('); 
    end 
  else 
    begin 
      MoveTo( x-6*r, y div 2); 
      font(8, 340, 600); 
      write('Czesio '); 
      font(8, 0, 600); 
      write('z³apa³ muchê'); 
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

