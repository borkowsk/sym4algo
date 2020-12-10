program AttitudeMove; 
{Porzadna implementacja modelu Nowaka/Latane z si�ami} 
{ i bezpiecznym sprawdzaniem wyboru bez ukrytego biasu} 
{ uzupelniona o ruch zgodny z wyznawanym kierunkiem!} 
const 
   Cz�sto��Wiz=1;
   {CO ile krok�w symulacji robi� wizualizacje}
   Rozm=15; 
   {D�ugo�� boku agenta} 
   Brzeg=1; 
   {Obwodka} 
   NajmRoz=4; 
   {Jaki rozmiar maj� najslabsi agenci} 
   Bok=30; 
   {Dlugo�� boku �wiata} 
   IlePogl�d�w=4; 
   {Liczba konkuruj�cych poglad�w - nie wiecej ni� 8 bo tylko tyle jest kierunk�w!!!} 
   G�sto��=0.25; 
   {G�sto�� zaludnienia} 
   Labilno��=0.05; 
   {Z jakim pawdopodobienstwem zmieni kierunek gdy nie mo�e sie ruszy�} 
   MaxSi�a=1000; 
   {Najwieksza sila - musi byc odpowiednio du�a do rozk�adu} 
   Rozk�ad=8; 
   {Stopien rozk�adu "Pareto" >=0 - zero daje brak rozkladu, same MaxSi�a} 
type 
   Agent=record 
        pogl�d:integer; 
        {0..IlePogladow-1} 
        si�a:integer; 
        {Je�li 0 to martwy} 
   end; 
   �wiat=array[1..Bok,1..Bok] of Agent; 

procedure Inicjacja(var Ten�wiat:�wiat); 

var 
   i,j,k:integer; 
   pomoc:real; 
begin 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        if Random<G�sto�� then 
          begin 
            {�ywy} 
            Ten�wiat[i,j].pogl�d:=random(IlePogl�d�w); 
            pomoc:=1; 
            for k:=1 to Rozk�ad do 
              pomoc:=pomoc*random; 
            Ten�wiat[i,j].si�a:=1+trunc(pomoc*(MaxSi�a-1)); 
          end 
        else 
          begin 
            {Martwy} 
            Ten�wiat[i,j].pogl�d:=IlePogl�d�w; 
            Ten�wiat[i,j].si�a:=0; 
            {BO 0 znaczy MARTWY!!!} 
          end; 
      end; 
end; 

function Przeskaluj(v,min,max:real):real; 

begin 
  Przeskaluj:=(v-min)/(max-min); 
end; 

function Przelogarytmuj(v,max:real):real; 

begin 
  v:=ln(v+1); 
  Przelogarytmuj:=v/ln(max+1); 
end; 

procedure Wizualizacja(var Ten�wiat:�wiat); 
{Kwadratami o wielkosci proporcjonalnej do sily} 

var 
   i,j:integer; 
   {Przechodzenie po agentach} 
   q,r,rRoz:real; 
   {Przeliczone cechy agenta} 
   WRoz,ri,vi:integer; 
   {Rozmiar wewn�trzny i pozycjonowanie} 
begin 
  RRoz:=1-NajmRoz/Rozm; 
  WRoz:=Rozm-Brzeg; 
  {Szeroko�c obw�dki wynosi Bord, a jest z dwu stron} 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        pen(Brzeg,100,100,100); 
        brush(1,128,128,128); 
        Rectangle(i*Rozm,j*Rozm,(i+1)*Rozm,(j+1)*Rozm); 
        if Ten�wiat[i,j].si�a>0 then 
          begin 
            q:=Przeskaluj(Ten�wiat[i,j].pogl�d,0,IlePogl�d�w-1)*255; 
            r:=Przelogarytmuj(Ten�wiat[i,j].si�a,MaxSi�a)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:= 
            {Brzeg div 2+}(Rozm-ri) div 2; 
            Pen(1,0,0,0); 
            Brush(1,round(20+q*0.7),round(20+q*0.3),round(20+q*0.3)); 
            Rectangle(i*Rozm+vi,j*Rozm+vi,i*Rozm+vi+ri,j*Rozm+vi+ri); 
          end; 
      end; 
end; 

procedure KrokSymulacji(var Ten�wiat:�wiat); 
{Procedura zmiany stanu symulacji. Zawiera procedury pomocnicze.} 

type 
   zbi�rlicznik�w=array[0..IlePogl�d�w
   {-1}] of integer; 
   (*
   procedure ZliczWp�ywy(x,y:integer;var Liczniki:zbi�rlicznik�w); 
   {Wewnetrzna prcedura dla KrokSymulacji, nie dla torusa }    
   var 
   lewo,prawo,g�ra,d�,i,j:integer; 
   begin 
     lewo:=x-1; 
     if lewo<1 then 
    lewo:=1; 
     prawo:=x+1; 
     if prawo>Bok then 
    prawo:=Bok; 
     g�ra:=y-1; 
     if g�ra<1 then 
    g�ra:=1; 
     d�:=y+1; 
     if d�>Bok then 
    d�:=Bok; 
     for i:=lewo to prawo do 
    for j:=g�ra to d� do 
      if Ten�wiat[i,j].si�a>0 then 
        Liczniki[Ten�wiat[i,j].pogl�d]:=Liczniki[Ten�wiat[i,j].pogl�d]+Ten�wiat[i,j].si�a; 
   end; 
   *) 

function nIndeks1(isurowy,last:integer):integer; 
{Zawijanie indeksu do tablicy o  indeksach od 1 do Last } 
{Dozwolony zakres surowych indeks�w w ALGO to -(Last-1)..2*Last } 

begin 
  if isurowy>Last then 
    nIndeks1:=isurowy-Last 
  else 
    if isurowy<1 then 
      nIndeks1:=Last+isurowy 
    else 
      nIndeks1:=isurowy; 
end; 

procedure ZliczWp�ywy(x,y:integer;var Liczniki:zbi�rlicznik�w); 
{Wewnetrzna prcedura dla KrokSymulacji} 

var 
   lewo,prawo,g�ra,d�,i,j,k,l:integer; 
begin 
  lewo:=x-1; 
  prawo:=x+1; 
  g�ra:=y-1; 
  d�:=y+1; 
  for i:=lewo to prawo do 
    for j:=g�ra to d� do 
      begin 
        k:=nIndeks1(i,Bok); 
        l:=nIndeks1(j,Bok); 
        if Ten�wiat[k,l].si�a>0 then 
          Liczniki[Ten�wiat[k,l].pogl�d]:=Liczniki[Ten�wiat[k,l].pogl�d]+Ten�wiat[k,l].si�a; 
      end; 
end; 

function UstalPogl�d(var Liczniki:zbi�rlicznik�w):integer; 
{Wewnetrzna funkcja dla KrokSymulacji, znajduj�ca nawi�kszy licznik} 

var 
   max,nowy,i,j:integer; 
begin 
  max:=0; 
  nowy:=-1; 
  j:=random(IlePogl�d�w); 
  {Zeby uniknac niejawnego bias-owania} 
  for i:=0 to IlePogl�d�w-1 do 
    {Petla tylko dba o przejrzenioe calej tablicy} 
    begin 
      if liczniki[j]>max then 
        begin 
          max:=liczniki[j]; 
          nowy:=j; 
        end; 
      j:=(j+1)mod IlePogl�d�w; 
      {Zeby obejsc cala tablice zaczynajac z losowego miesjca} 
    end; 
  UstalPogl�d:=nowy; 
end; 

function Spr�bujRuchu(x,y:integer;var nx,ny:integer):boolean; 
{Poczatek niesbyt efektywny, ale nie ma w ALGO litera��w tablicowych} 

begin 
  {Nie sprawdzam tu czy nie wieksze ni� 7 bo to by kosztowalo} 
  case Ten�wiat[x,y].pogl�d of 
    0: 
      begin 
        nx:=x; 
        ny:=y+1; 
      end; 
    1: 
      begin 
        nx:=x; 
        ny:=y-1; 
      end; 
    2: 
      begin 
        nx:=x+1; 
        ny:=y; 
      end; 
    3: 
      begin 
        nx:=x-1; 
        ny:=y; 
      end; 
    4: 
      begin 
        nx:=x-1; 
        ny:=y-1; 
      end; 
    5: 
      begin 
        nx:=x+1; 
        ny:=y+1; 
      end; 
    6: 
      begin 
        nx:=x-1; 
        ny:=y+1; 
      end; 
    7: 
      begin 
        nx:=x+1; 
        ny:=y-1; 
      end; 
  end; 
  {Zamkniecie w torus} 
  if nx=0 then 
    nx:=Bok; 
  if nx>Bok then 
    nx:=1; 
  if ny=0 then 
    ny:=Bok; 
  if ny>Bok then 
    ny:=1; 
  Spr�bujRuchu:=(Ten�wiat[nx,ny].si�a=0); 
end; 

procedure Przesu�(x,y,nx,ny:integer); 

begin 
  Ten�wiat[nx,ny]:=Ten�wiat[x,y]; 
  Ten�wiat[x,y].si�a:=0; 
  Ten�wiat[x,y].pogl�d:=IlePogl�d�w; 
end; 

var 
   i,j,k,l,m,n,NN:integer; 
   liczniki:zbi�rlicznik�w; 
begin 
  NN:=Bok*Bok; 
  for k:=1 to NN do 
    begin 
      for l:=0 to IlePogl�d�w do 
        liczniki[l]:=0; 
      i:=1+random(Bok); 
      j:=1+random(Bok); 
      if Ten�wiat[i,j].si�a>0 then 
        begin 
          ZliczWp�ywy(i,j,liczniki); 
          Ten�wiat[i,j].pogl�d:=UstalPogl�d(liczniki); 
          if Spr�bujRuchu(i,j,m,n) then 
            Przesu�(i,j,m,n) 
          else 
            if random<Labilno�� then 
              Ten�wiat[i,j].pogl�d:=random(IlePogl�d�w); 
        end; 
    end; 
end; 

var 
   �wiatSymulacji:�wiat; 
   numerkroku:integer; 

begin 
  Inicjacja(�wiatSymulacji); 
  numerkroku:=0; 
  repeat 
    if numerkroku mod Cz�sto��Wiz=0 then
      Wizualizacja(�wiatSymulacji); 
    KrokSymulacji(�wiatSymulacji); 
    numerkroku:=numerkroku+1; 
    brush(1,255,255,255); 
    moveto(0,(Bok+2)*Rozm);
    writeln; 
    writeln(numerkroku); 
  until IsEvent; 
end.
