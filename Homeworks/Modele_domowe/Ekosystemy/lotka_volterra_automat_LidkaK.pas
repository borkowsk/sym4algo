Program voltera; 
{w MOIM PROGRAMIE- DLA WYGODY ODWR�CI�AM STANY KONSYMENT�W;
~3 JEST TO KONSUMENT G�ODNY, 2 KONSUMENT NAJEDZONY, 4 I POWY�EJ UMIERA.
 Aby lepiej odda� utrat� energii, kom�rki s� w formacie liczb rzeczywistych.
Po ka�dym "ruchu" konsument zmienia sw�j stan enegetyczny 
(np. o 0.1), coraz bardziej zbli�aj�c si� do 4 -stanu agonalnego. 
Po zjedzeniu producenta jego stan wraca do poziomu najedzenia 2. 
Kolorem czerwonym s� oznaczone osobniki w "pe�ni si�", kt�re ciemniej�
 wraz z utrat� energii.(zbli�aniem si� do stanu 3 i wi�cej)} 

const 
   Rozm=10; 
   {D�ugo�� boku agenta} 
   Brzeg=2; 
   {Obwodka} 
   NajmRoz=2; 
   {Jaki rozmiar maj� najslabsi agenci} 
   Bok=50; 
   {Dlugo�� boku �wiata} 
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
   �wiat=array[1..Bok,1..Bok] of real; 

procedure Inicjacja(var Ten�wiat:�wiat); 
{Wype�nianie �wiata.} 

var 
   i,j,k:integer; 
   pomoc:real; 
begin 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        Ten�wiat[i,j]:= 0; 
      end; 
  k:=1; 
  while k<=ileproducentow do 
    begin; 
      i:= trunc(1+random (bok)); 
      j:= trunc(1+random (bok)); 
      if Ten�wiat[i,j]= 0 then 
      {znaczy, komorka pusta} 
        begin 
          Ten�wiat[i,j]:= 1; 
          k:= k+1; 
        end; 
    end; 
  k:=1; 
  while k<=ileDrapieznikow do 
    begin; 
      i:= trunc(1+random (bok)); 
      j:= trunc(1+random (bok)); 
      if Ten�wiat[i,j]= 0 then 
      {znaczy, komorka pusta} 
        begin 
          if random<=0.5 then 
            Ten�wiat[i,j]:= 3 
          else 
            Ten�wiat[i,j]:= 2; 
          {to jest glodny drapieznik, mozna zrobic losowo najedzony/glodny} 
          k:= k+1; 
        end; 
    end; 
end; 

procedure Wizualizacja(var Ten�wiat:�wiat); 
{Kwadratami o wielkosci proporcjonalnej ladunku przenoszonego przez termity} 

var 
   i,j:integer; 
   {Przechodzenie po kom�rkach} 
begin 
  {Nie uwagl�dniamy szeroko�ci obw�dki (Bord), ale to specyfika ALGO} 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        pen(Brzeg,110,110,110); 
        {        brush(1,100,100,110); 
        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
        if Ten�wiat[i,j]>0 then 
          begin 
            {            q:=Przeskaluj(Ten�wiat[i,j],0,1)*255; 
            r:=Przelogarytmuj(Ten�wiat[i,j],20)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:= 
            [Brzeg div 2+](Rozm-ri) div 2;} 
        Pen(1,0,0,0); 
        case trunc( Ten�wiat[i,j]) of 
          0: 
            brush(1,100,100,110); 
          1: 
            Brush(1,10,200,10); 
          {zielony-producent} 
          2: 
            Brush(1,250,0,10); 
          {czerwony-najedzony konsument} 
          3: 
       Brush(1,trunc(255-60*Ten�wiat[i,j]),trunc(100-20*Ten�wiat[i,j]),trunc(20*Ten�wiat[i,j])); 
      {br�zowy-glodny konsument} 
         end; 
        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
      end; 
end; 

procedure WizualizacjaRuchu(var Ten�wiat:�wiat;i,j:integer); 

var 
   pom:integer; 
begin 
  {Nie uwagl�dniamy szeroko�ci obw�dki (Bord), ale to specyfika ALGO} 
  begin 
    pen(Brzeg,110,110,110); 
    {        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm);} 
    {            q:=Przeskaluj(Ten�wiat[i,j],0,1)*255; 
            r:=Przelogarytmuj(Ten�wiat[i,j],20)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:= 
            [Brzeg div 2+](Rozm-ri) div 2;} 
    Pen(1,0,0,0); 
    pom:= trunc(Ten�wiat[i,j]); 
    case trunc(Ten�wiat[i,j]) of 
      0: 
        brush(1,230,230,230); 
      1: 
        Brush(1,10,200,10); 
      {zielony-producent} 
      2: 
        Brush(1,250,0,10); 
      {czerwony-najedzony konsument} 
      3: 
        Brush(1,trunc(255-60*Ten�wiat[i,j]),trunc(100-20*Ten�wiat[i,j]),trunc(20*Ten�wiat[i,j])); 
      {br�zowy-glodny konsument} 
    end; 
    Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
  end; 
end; 

function sasiad(kier:integer;var Ten�wiat:�wiat; a,b:integer): integer; 
{zwraca warto�� kom�rki s�siaduj�cej z podanego kierunku} 

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
  sasiad:=trunc(Ten�wiat[a][b]) ; 
end; 

function sprawdz_otoczenie(var Ten�wiat:�wiat; gatunek, x,y:integer):integer; 
{zlicza ile w otoczeniu jest osobnik�w w�asnego gatunku} 

var 
   a,b,c:integer; 
begin; 
  b:=0; 
  for a:=1 to 4 do 
    begin; 
      c:= sasiad(a,Ten�wiat,x,y); 
      if c=3 then 
        c:=2; 
      {"3" i "2" to ten sam gatunek, ale jeden jest g�odny} 
      if c=gatunek then 
        b:=b+1; 
    end; 
  sprawdz_otoczenie:=b; 
end; 

function wylosuj_kierunek(var x,y:integer):integer; 
{losuje kom�rk� kt�ra b�dzie aktywna} 

begin 
  wylosuj_kierunek:=trunc(random(ileKierunkow)+1); 
end; 

function nowyX(kier:integer;a:integer): integer; 
{zwraca warto�� par. X kom�rki s�siaduj�cej z podanego kierunku} 

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
{zwraca warto�� par. y kom�rki s�siaduj�cej z podanego kierunku} 

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

procedure rozmnazanie(var Ten�wiat:�wiat; xr,yr:integer); 

var 
   komorka,Xk,Yk,pomocnik:integer; 
   P:real; 
begin 
  komorka:=wylosuj_kierunek(xr,yr); 
  if sasiad(komorka,Ten�wiat, xr,yr)=0 then 
    begin; 
      Xk:=nowyX(komorka,xr); 
      Yk:=nowyY(komorka,yr); 
      P:=random; 
      pomocnik:= trunc(Ten�wiat[xr][yr]); 
      case trunc(Ten�wiat[xr][yr]) 
      {sprawdz_otoczenie(1) to nie to  Ten�wiat[x][y]  } of 
        1: 
        {to roslinka} 
          if P<= P_rozmnozeniaProducenta then 
            begin 
              Ten�wiat[Xk][Yk]:=1; 
            end; 
        2: 
          if P<= P_rozmnozeniaKonsumenta then 
            begin 
              Ten�wiat[Xk][Yk]:=3; 
              {potomek-jeszcze s�aby} 
              Ten�wiat[Xr][Yr]:=3; 
              {osobnik os�abiony rozmna�aniem} 
              WizualizacjaRuchu(Ten�wiat,xr,yr); 
            end; 
      end; 
      WizualizacjaRuchu(Ten�wiat,xk,yk); 
    end; 
end; 

procedure zjadanie(var �wiatek:�wiat; var xr,yr:integer); 

var 
   komorka,pomoc,Xk,Yk:integer; 
begin ; 
  komorka:=wylosuj_kierunek(xr,yr); 
  if trunc(�wiatek[xr][yr])>1 then 
  {opcja dost�pna tylko dla zwierz�t} 
    if sprawdz_otoczenie(�wiatek,1,xr,yr)>0 then 
    {sprawdzamy czy jest dost�pny pokarm} 
      begin; 
        while sasiad(komorka,�wiatek, xr,yr)<>1 do 
          {namierzamy go} 
          begin 
            komorka:=wylosuj_kierunek(xr,yr); 
          end; 
        case trunc(�wiatek[xr][yr]) of 
          2: 
          {je tylko z pewnym prawdopodobie�stwem} 
            if random<= P_zjedzenia then 
              begin; 
                if sasiad(komorka,�wiatek, xr,yr)=1 then 
                  begin ; 
                    XK:=nowyX(komorka,xr); 
                    Yk:=nowyY(komorka,yr); 
                    �wiatek[xr][yr]:=0; 
                    {g��d zosta� zaspokojony } 
                    �wiatek[Xk][Yk]:=2; 
                    {producent zosta� zjedzony} 
                    WizualizacjaRuchu(�wiatek,xr,yr); 
                    WizualizacjaRuchu(�wiatek,xk,yk); 
                    Xr:=Xk; 
                    {uaktualnienie pozycji obiektu} 
                    Yr:=Yk; 
                    {uaktualnienie pozycji obiektu} 
                  end; 
              end; 
          3: 
            begin 
              {jest bardzo g�odny wi�c- je zawsze} 
              XK:=nowyX(komorka,xr); 
              Yk:=nowyY(komorka,yr); 
              �wiatek[xr][yr]:=0; 
              {g��d zosta� zaspokojony } 
              �wiatek[Xk][Yk]:=2; 
              {producent zosta� zjedzony} 
              WizualizacjaRuchu(�wiatek,xr,yr); 
              WizualizacjaRuchu(�wiatek,xk,yk); 
              Xr:=Xk; 
              {uaktualnienie pozycji obiektu} 
              Yr:=Yk; 
              {uaktualnienie pozycji obiektu} 
            end; 
        end; 
      end; 
end; 

procedure wymieranie(var �wiatek:�wiat; xw,yw:integer); 

var 
   a:real; 
begin ; 
  a:= random; 
  case trunc(�wiatek[xw][yw]) of 
    1: 
      if a<= P_zejsciaProducenta then 
        �wiatek[xw][yw]:=0; 
    2: 
      if a<= P_zejsciaKonsumenta2 then 
        �wiatek[xw][yw]:=0; 
    3: 
      if a<= P_zejsciaKons3 then 
        �wiatek[xw][yw]:=0; 
    4: 
      �wiatek[xw][yw]:=0; 
    {to� to �ywy trup!} 
  end; 
  WizualizacjaRuchu(�wiatek,xw,yw); 
end; 

procedure ruch(var �wiatek:�wiat;var x,y:integer); 

var 
   k,a,x1,y1:integer; 
begin; 
  k:=wylosuj_kierunek(x,y); 
  if sprawdz_otoczenie(�wiatek,0,x,y)>0 then 
  {je�li s� jakie� pola puste} 
    begin 
      case trunc(�wiatek[x][y]) of 
        1: 
          if sasiad(k, �wiatek,x,y)=0 then 
            begin 
              x1:=nowyX(k,x); 
              y1:=nowyY(k,y); 
              �wiatek[x][y]:=0; 
              �wiatek[x1][y1]:=1; 
              WizualizacjaRuchu(�wiatek,x1,y1); 
              WizualizacjaRuchu(�wiatek,x,y); 
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
                a:=sasiad(k, �wiatek,x,y) 
              end; 
            x1:=nowyX(k,x); 
            y1:=nowyY(k,y); 
            �wiatek[x1][y1]:=�wiatek[x][y]+zuzyta_energia; 
            �wiatek[x][y]:=0; 
            WizualizacjaRuchu(�wiatek,x1,y1); 
            WizualizacjaRuchu(�wiatek,x,y); 
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
                a:=sasiad(k, �wiatek,x,y) 
              end; 
            x1:=nowyX(k,x); 
            y1:=nowyY(k,y); 
            �wiatek[x1][y1]:=�wiatek[x][y]+zuzyta_energia; 
            �wiatek[x][y]:=0; 
            if �wiatek[x1][y1]>3.99 then 
              �wiatek[x1][y1]:=0; 
            {wycie�czony - umiera} 
            WizualizacjaRuchu(�wiatek,x1,y1); 
            WizualizacjaRuchu(�wiatek,x,y); 
            X:=X1; 
            Y:=Y1; 
            {uaktualnienie pozycji obiektu} 
          end; 
      end; 
    end; 
end; 

var 
   �wiatSymulacji:�wiat; 
   x,y,zmienionyX,zmienionyY:integer; 

begin 
  Inicjacja(�wiatSymulacji); 
  Wizualizacja(�wiatSymulacji); 
  repeat 
    x:= trunc(1+random (bok)); 
    y:= trunc(1+random (bok)); 
    if �wiatSymulacji[x][y]>0 then 
      begin 
        if �wiatSymulacji[x][y]>=2 then 
          zjadanie(�wiatSymulacji,x,y); 
        rozmnazanie(�wiatSymulacji,x,y); 
        ruch(�wiatSymulacji,x,y); 
        wymieranie(�wiatSymulacji,x,y); 
      end; 
  until isevent; 
end.
