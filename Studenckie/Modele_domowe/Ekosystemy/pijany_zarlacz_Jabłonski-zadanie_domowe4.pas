program pijany_zarlacz; 

var 
   x,y: integer; 
   staryX: integer; 
   staryY: integer; 
   plansza: integer; 
   bok: integer; 
   guzik: char; 
   zarcie: integer; 

procedure postaw_jedzenie(x,y: integer); 

begin 
  brush(1,0,255,0); 
  Ellipse(x*bok ,y*bok ,x*bok+bok-1 ,y*bok+bok-1 ); 
end; 

procedure losowanie_jedzenia(ile: integer); 

var 
   i: integer; 
begin 
  for i:=0 to ile do 
    postaw_jedzenie(random(plansza),random(plansza)); 
end; 

begin 
  randomize; 
  brush(1,0,0,0); 
  fill(0,0); 
  TextColor( 255,255,255 ); 
  writeln('podaj wielkosc planszy'); 
  read(plansza); 
  writeln('podaj wielkosc szufladki'); 
  read(bok); 
  if bok<=3 then 
    bok:=4; 
  writeln('podaj ilosc jedzenia'); 
  read(zarcie); 
  clear; 
  brush(1,0,0,0); 
  fill(0,0); 
  for y:=0 to plansza do 
    begin 
      for x:=0 to plansza do 
        begin 
          brush(1,255,0,0); 
          rectangle (x*bok,y*bok,x*bok+bok-1,y*bok+bok-1); 
          {rysowanie planszy} 
          {gwoli przypomnienia: x*bok dla 0 to punkt 0.0, potem dla
                                                 kolejnych wartosci iksa: 50,100,150, a bok-1 dlatego ze
                                                 kwadraty maja defakto bok-1 dlugosci i szer + 1pix spacji} 
        end; 
    end; 
  losowanie_jedzenia(zarcie); 
  y:=random(plansza); 
  x:=random(plansza); 
  {narazie losuje po prostu fikcyjna liczbe, ktora bedzie miala
                            odniesienie potem do tych kwadracikoof, tu ruszy zarlacz} 
  staryX:=x; 
  staryY:=y; 
  brush(1,255,255,255); 
  while not isevent 
  {tym sie przerywa zarlacza} do 
    begin 
      y:=staryy+random(3)-1; 
      {tutaj po prostu wylicza sie nowa wartosc z poprzedniego iksa w zakresie -1 do 1} 
      x:=staryX+random(3)-1; 
      if (x>plansza) then 
        x:=0; 
      {to warunki: jak zarlacz bedzie uciekal za plansze} 
      if (x<0) then 
        x:=plansza; 
      if (y<0) then 
        y:=plansza; 
      if (y>plansza) then 
        y:=0; 
      brush(1,255,255,255); 
      rectangle (x*bok,y*bok,x*bok+bok-1,y*bok+bok-1); 
      {rusza bialy zarlacz} 
      pen (1,0,0,0); 
      point(x*bok +bok div 4, y*bok +bok div 2 ); 
      point(x*bok +3*bok div 4, y*bok +bok div 2 ); 
      point(x*bok +bok div 4 + 1, y*bok +bok div 2 ); 
      point(x*bok +3*bok div 4 - 1, y*bok +bok div 2 ); 
      brush(1,0,0,0); 
      rectangle (staryx*bok,staryy*bok,staryx*bok+bok-1,staryy*bok+bok-1); 
      {zamalowanie sciezki zarlacza na czarno} 
      { koloruje wybrany kwadracik o wspolrzednych poczatkowego wierzcholka
               x*bok, a dodaje bok podzielony na 2  zeby bylo wewnatrz a nie na ramce} 
      delay(100); 
      {domysl sie... :]} 
      staryX:=x; 
      {nowy punkt startowy dla zarlacza} 
      staryY:=y; 
    end; 
end.
