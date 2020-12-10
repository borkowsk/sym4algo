Program voltera; 
{w MOIM PROGRAMIE- DLA WYGODY ODWRÓCI£AM STANY KONSYMENTÓW;
~3 JEST TO KONSUMENT G£ODNY, 2 KONSUMENT NAJEDZONY, 4 I POWY¯EJ UMIERA.
 Aby lepiej oddaæ utratê energii, komórki s¹ w formacie liczb rzeczywistych.
Po ka¿dym "ruchu" konsument zmienia swój stan enegetyczny 
(np. o 0.1), coraz bardziej zbli¿aj¹c siê do 4 -stanu agonalnego. 
Po zjedzeniu producenta jego stan wraca do poziomu najedzenia 2. 
Kolorem czerwonym s¹ oznaczone osobniki w "pe³ni si³", które ciemniej¹
 wraz z utrat¹ energii.(zbli¿aniem siê do stanu 3 i wiêcej)} 

const 
   Rozm=10; 
   {D³ugoœæ boku agenta} 
   Brzeg=2; 
   {Obwodka} 
   NajmRoz=2; 
   {Jaki rozmiar maj¹ najslabsi agenci} 
   Bok=50; 
   {Dlugoœæ boku œwiata} 
   ileproducentow=1000 ; 
   ileDrapieznikow=500; 
   ileKierunkow=4; 
   P_zejsciaKonsumenta2 = 0.01; 
   P_zejsciaProducenta = 0.1; 
   P_zejsciaKons3 = 0.7; 
   P_rozmnozeniaKonsumenta = 0.8; 
   {} 
   P_rozmnozeniaProducenta = 0.5; 
   P_zjedzenia=0.8; 
   zuzyta_energia=0.25; 
type 
   Œwiat=array[1..Bok,1..Bok] of real; 

procedure Inicjacja(var TenŒwiat:Œwiat); 
{Wype³nianie œwiata.} 

var 
   i,j,k:integer; 
   pomoc:real; 
begin 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        TenŒwiat[i,j]:= 0; 
      end; 
  k:=1; 
  while k<=ileproducentow do 
    begin; 
      i:= trunc(1+random (bok)); 
      j:= trunc(1+random (bok)); 
      if TenŒwiat[i,j]= 0 then 
      {znaczy, komorka pusta} 
        begin 
          TenŒwiat[i,j]:= 1; 
          k:= k+1; 
        end; 
    end; 
  k:=1; 
  while k<=ileDrapieznikow do 
    begin; 
      i:= trunc(1+random (bok)); 
      j:= trunc(1+random (bok)); 
      if TenŒwiat[i,j]= 0 then 
      {znaczy, komorka pusta} 
        begin 
          if random<=0.5 then 
            TenŒwiat[i,j]:= 3 
          else 
            TenŒwiat[i,j]:= 2; 
          {to jest glodny drapieznik, mozna zrobic losowo najedzony/glodny} 
          k:= k+1; 
        end; 
    end; 
end; 

procedure Wizualizacja(var TenŒwiat:Œwiat); 
{Kwadratami o wielkosci proporcjonalnej ladunku przenoszonego przez termity} 

var 
   i,j:integer; 
   {Przechodzenie po komórkach} 
begin 
  {Nie uwaglêdniamy szerokoœci obwódki (Bord), ale to specyfika ALGO} 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        pen(Brzeg,110,110,110); 
        {        brush(1,100,100,110); 
        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
        if TenŒwiat[i,j]>0 then 
          begin 
            {            q:=Przeskaluj(TenŒwiat[i,j],0,1)*255; 
            r:=Przelogarytmuj(TenŒwiat[i,j],20)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:= 
            [Brzeg div 2+](Rozm-ri) div 2;} 
        Pen(1,0,0,0); 
        case trunc( TenŒwiat[i,j]) of 
          0: 
            brush(1,100,100,110); 
          1: 
            Brush(1,10,200,10); 
          {zielony-producent} 
          2: 
            Brush(1,250,0,10); 
          {czerwony-najedzony konsument} 
          3: 
       Brush(1,trunc(255-60*TenŒwiat[i,j]),trunc(100-20*TenŒwiat[i,j]),trunc(20*TenŒwiat[i,j])); 
      {br¹zowy-glodny konsument} 
         end; 
        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
      end; 
end; 

procedure WizualizacjaRuchu(var TenŒwiat:Œwiat;i,j:integer); 

var 
   pom:integer; 
begin 
  {Nie uwaglêdniamy szerokoœci obwódki (Bord), ale to specyfika ALGO} 
  begin 
    pen(Brzeg,110,110,110); 
    {        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm);} 
    {            q:=Przeskaluj(TenŒwiat[i,j],0,1)*255; 
            r:=Przelogarytmuj(TenŒwiat[i,j],20)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:= 
            [Brzeg div 2+](Rozm-ri) div 2;} 
    Pen(1,0,0,0); 
    pom:= trunc(TenŒwiat[i,j]); 
    case trunc(TenŒwiat[i,j]) of 
      0: 
        brush(1,230,230,230); 
      1: 
        Brush(1,10,200,10); 
      {zielony-producent} 
      2: 
        Brush(1,250,0,10); 
      {czerwony-najedzony konsument} 
      3: 
        Brush(1,trunc(255-60*TenŒwiat[i,j]),trunc(100-20*TenŒwiat[i,j]),trunc(20*TenŒwiat[i,j])); 
      {br¹zowy-glodny konsument} 
    end; 
    Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
  end; 
end; 

function sasiad(kier:integer;var TenŒwiat:Œwiat; a,b:integer): integer; 
{zwraca wartoœæ komórki s¹siaduj¹cej z podanego kierunku} 

begin 
  case kier of 
    1: 
      b:=b-1; 
    2: 
      a:=a+1; 
    3: 
      b:=b+1; 
    4: 
      a:=a-1; 
  end; 
  if a>bok then 
    a:=a-bok; 
  if a<1 then 
    a:=a+bok; 
  if b>bok then 
    b:=b-bok; 
  if b<1 then 
    b:=b+bok; 
  sasiad:=trunc(TenŒwiat[a][b]) ; 
end; 

function sprawdz_otoczenie(var TenŒwiat:Œwiat; gatunek, x,y:integer):integer; 
{zlicza ile w otoczeniu jest osobników w³asnego gatunku} 

var 
   a,b,c:integer; 
begin; 
  b:=0; 
  for a:=1 to 4 do 
    begin; 
      c:= sasiad(a,TenŒwiat,x,y); 
      if c=3 then 
        c:=2; 
      {"3" i "2" to ten sam gatunek, ale jeden jest g³odny} 
      if c=gatunek then 
        b:=b+1; 
    end; 
  sprawdz_otoczenie:=b; 
end; 

function wylosuj_kierunek(var x,y:integer):integer; 
{losuje komórkê która bêdzie aktywna} 

begin 
  wylosuj_kierunek:=trunc(random(ileKierunkow)+1); 
end; 

function nowyX(kier:integer;a:integer): integer; 
{zwraca wartoœæ par. X komórki s¹siaduj¹cej z podanego kierunku} 

begin 
  case kier of 
    2: 
      a:=a+1; 
    4: 
      a:=a-1; 
  end; 
  if a>bok then 
    a:=a-bok; 
  if a<1 then 
    a:=a+bok; 
  nowyX:=a ; 
end; 

function nowyY(kier:integer;a:integer): integer; 
{zwraca wartoœæ par. y komórki s¹siaduj¹cej z podanego kierunku} 

begin 
  case kier of 
    1: 
      a:=a-1; 
    3: 
      a:=a+1; 
  end; 
  if a>bok then 
    a:=a-bok; 
  if a<1 then 
    a:=a+bok; 
  nowyY:=a ; 
end; 

procedure rozmnazanie(var TenŒwiat:Œwiat; xr,yr:integer); 

var 
   komorka,Xk,Yk,pomocnik:integer; 
   P:real; 
begin 
  komorka:=wylosuj_kierunek(xr,yr); 
  if sasiad(komorka,TenŒwiat, xr,yr)=0 then 
    begin; 
      Xk:=nowyX(komorka,xr); 
      Yk:=nowyY(komorka,yr); 
      P:=random; 
      pomocnik:= trunc(TenŒwiat[xr][yr]); 
      case trunc(TenŒwiat[xr][yr]) 
      {sprawdz_otoczenie(1) to nie to  TenŒwiat[x][y]  } of 
        1: 
        {to roslinka} 
          if P<= P_rozmnozeniaProducenta then 
            begin 
              TenŒwiat[Xk][Yk]:=1; 
            end; 
        2: 
          if P<= P_rozmnozeniaKonsumenta then 
            begin 
              TenŒwiat[Xk][Yk]:=3; 
              {potomek-jeszcze s³aby} 
              TenŒwiat[Xr][Yr]:=3; 
              {osobnik os³abiony rozmna¿aniem} 
              WizualizacjaRuchu(TenŒwiat,xr,yr); 
            end; 
      end; 
      WizualizacjaRuchu(TenŒwiat,xk,yk); 
    end; 
end; 

procedure zjadanie(var Œwiatek:Œwiat; var xr,yr:integer); 

var 
   komorka,pomoc,Xk,Yk:integer; 
begin ; 
  komorka:=wylosuj_kierunek(xr,yr); 
  if trunc(Œwiatek[xr][yr])>1 then 
  {opcja dostêpna tylko dla zwierz¹t} 
    if sprawdz_otoczenie(Œwiatek,1,xr,yr)>0 then 
    {sprawdzamy czy jest dostêpny pokarm} 
      begin; 
        while sasiad(komorka,Œwiatek, xr,yr)<>1 do 
          {namierzamy go} 
          begin 
            komorka:=wylosuj_kierunek(xr,yr); 
          end; 
        case trunc(Œwiatek[xr][yr]) of 
          2: 
          {je tylko z pewnym prawdopodobieñstwem} 
            if random<= P_zjedzenia then 
              begin; 
                if sasiad(komorka,Œwiatek, xr,yr)=1 then 
                  begin ; 
                    XK:=nowyX(komorka,xr); 
                    Yk:=nowyY(komorka,yr); 
                    Œwiatek[xr][yr]:=0; 
                    {g³ód zosta³ zaspokojony } 
                    Œwiatek[Xk][Yk]:=2; 
                    {producent zosta³ zjedzony} 
                    WizualizacjaRuchu(Œwiatek,xr,yr); 
                    WizualizacjaRuchu(Œwiatek,xk,yk); 
                    Xr:=Xk; 
                    {uaktualnienie pozycji obiektu} 
                    Yr:=Yk; 
                    {uaktualnienie pozycji obiektu} 
                  end; 
              end; 
          3: 
            begin 
              {jest bardzo g³odny wiêc- je zawsze} 
              XK:=nowyX(komorka,xr); 
              Yk:=nowyY(komorka,yr); 
              Œwiatek[xr][yr]:=0; 
              {g³ód zosta³ zaspokojony } 
              Œwiatek[Xk][Yk]:=2; 
              {producent zosta³ zjedzony} 
              WizualizacjaRuchu(Œwiatek,xr,yr); 
              WizualizacjaRuchu(Œwiatek,xk,yk); 
              Xr:=Xk; 
              {uaktualnienie pozycji obiektu} 
              Yr:=Yk; 
              {uaktualnienie pozycji obiektu} 
            end; 
        end; 
      end; 
end; 

procedure wymieranie(var Œwiatek:Œwiat; xw,yw:integer); 

var 
   a:real; 
begin ; 
  a:= random; 
  case trunc(Œwiatek[xw][yw]) of 
    1: 
      if a<= P_zejsciaProducenta then 
        Œwiatek[xw][yw]:=0; 
    2: 
      if a<= P_zejsciaKonsumenta2 then 
        Œwiatek[xw][yw]:=0; 
    3: 
      if a<= P_zejsciaKons3 then 
        Œwiatek[xw][yw]:=0; 
    4: 
      Œwiatek[xw][yw]:=0; 
    {to¿ to ¿ywy trup!} 
  end; 
  WizualizacjaRuchu(Œwiatek,xw,yw); 
end; 

procedure ruch(var Œwiatek:Œwiat;var x,y:integer); 

var 
   k,a,x1,y1:integer; 
begin; 
  k:=wylosuj_kierunek(x,y); 
  if sprawdz_otoczenie(Œwiatek,0,x,y)>0 then 
  {jeœli s¹ jakieœ pola puste} 
    begin 
      case trunc(Œwiatek[x][y]) of 
        1: 
          if sasiad(k, Œwiatek,x,y)=0 then 
            begin 
              x1:=nowyX(k,x); 
              y1:=nowyY(k,y); 
              Œwiatek[x][y]:=0; 
              Œwiatek[x1][y1]:=1; 
              WizualizacjaRuchu(Œwiatek,x1,y1); 
              WizualizacjaRuchu(Œwiatek,x,y); 
              X:=X1; 
              Y:=Y1; 
              {uaktualnienie pozycji obiektu} 
            end; 
        2: 
          begin 
            a:=1; 
            while a>0 do 
              begin 
                k:=wylosuj_kierunek(x,y); 
                a:=sasiad(k, Œwiatek,x,y) 
              end; 
            x1:=nowyX(k,x); 
            y1:=nowyY(k,y); 
            Œwiatek[x1][y1]:=Œwiatek[x][y]+zuzyta_energia; 
            Œwiatek[x][y]:=0; 
            WizualizacjaRuchu(Œwiatek,x1,y1); 
            WizualizacjaRuchu(Œwiatek,x,y); 
            X:=X1; 
            Y:=Y1; 
            {uaktualnienie pozycji obiektu} 
          end; 
        3: 
          begin; 
            a:=1; 
            while a>0 do 
              begin 
                k:=wylosuj_kierunek(x,y); 
                a:=sasiad(k, Œwiatek,x,y) 
              end; 
            x1:=nowyX(k,x); 
            y1:=nowyY(k,y); 
            Œwiatek[x1][y1]:=Œwiatek[x][y]+zuzyta_energia; 
            Œwiatek[x][y]:=0; 
            if Œwiatek[x1][y1]>3.99 then 
              Œwiatek[x1][y1]:=0; 
            {wycieñczony - umiera} 
            WizualizacjaRuchu(Œwiatek,x1,y1); 
            WizualizacjaRuchu(Œwiatek,x,y); 
            X:=X1; 
            Y:=Y1; 
            {uaktualnienie pozycji obiektu} 
          end; 
      end; 
    end; 
end; 

var 
   ŒwiatSymulacji:Œwiat; 
   x,y,zmienionyX,zmienionyY:integer; 

begin 
  Inicjacja(ŒwiatSymulacji); 
  Wizualizacja(ŒwiatSymulacji); 
  repeat 
    x:= trunc(1+random (bok)); 
    y:= trunc(1+random (bok)); 
    if ŒwiatSymulacji[x][y]>0 then 
      begin 
        if ŒwiatSymulacji[x][y]>=2 then 
          zjadanie(ŒwiatSymulacji,x,y); 
        rozmnazanie(ŒwiatSymulacji,x,y); 
        ruch(ŒwiatSymulacji,x,y); 
        wymieranie(ŒwiatSymulacji,x,y); 
      end; 
  until isevent; 
end.
