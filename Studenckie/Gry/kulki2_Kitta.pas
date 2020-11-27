Program Kulki; 
{deklarowanie stalej okreslajacej rozmiar planszy} 

Const 
   {wielkosc boku tablicy}
   Last=9; 
   
Type 
   {jedno pole bedzie zawierac informacje jaki jest kolor kulki
   i czy to pole jest zaznaczone}
   Pole = record 
        Wartosc:integer; 
        Zaznaczenie:boolean; 
   end; 
   
   {deklarowanie tablicy jako typu} 
   Plansza=array[1..Last,1..Last] of Pole;
   
     
    
Var 
   {zmienna globalna w ktorej bedziemy trzymac nasza tablice kulek}
   Tablica:Plansza; 
   
   
{procedura nadajaca stan poczatkowy planszy
ustawia kolory na zero i zaznaczenie na wylaczone} 
Procedure Zerowanie(Var Siatka:Plansza); 

Var 
   i,j:integer; 
Begin 
  For i:=1 to Last do 
    For j:=1 to Last do 
      begin 
        Siatka[i,j].Wartosc:=0; 
        Siatka[i,j].Zaznaczenie:=false; 
      end; 
end; 

{rysuje plansze podana w parametrze "Siatka"}
Procedure Maluj(Var Siatka:Plansza); 

Var 
   i,j:integer; 
Begin 
  {czyszczenie calej planszy}
  Clear; 
  
  {petle for "przelatuje" po wszystkich kulkach i polach}
  For i:=1 to Last do 
    For j:=1 to Last do 
      begin 
        {wybieranie koloru srodka kulki w zaleznosci od jej wartosci} 
        case Siatka[i,j].Wartosc of 
          0: 
            Brush(1,255,255,255); 
          1: 
            Brush(1,255,0,0); 
          2: 
            Brush(1,0,255,0); 
          3: 
            Brush(1,0,0,255); 
        end; 
        {wybieranie koloru otoczki w zaleznosci od tego czy jest zaznaczone} 
        if Siatka[i,j].Zaznaczenie then 
          Pen(3,200,205,50) 
        else 
          Pen(1,0,0,0); 
        {Rysowanie juz wlasciwego pola} 
        Ellipse(20+i*20,20+j*20,30+i*20,30+j*20); 
      end; 
  {ustawianie koloru dla tla tekstu} 
  Brush(1,255,255,255); 
  {malowanie numerow cyfr kolumn} 
  for i:=1 to Last do 
    begin 
      Moveto(20+i*20,15); 
      writeln(i); 
    end; 
  {malowanie numerow cyfr rzedow} 
  for i:=1 to Last do 
    begin 
      Moveto(15,17+i*20); 
      writeln(i); 
    end; 
end; 


{procedura domalowujaca losowe kulki, 
parametr "IleKulek" mowi ile ma byc domalowanych kulek}
Procedure LosujKulki(Var Siatka:Plansza; IleKulek:integer); 

var 
   i,x,y:integer; 
begin 
  for i:=1 to IleKulek do 
    begin 
      {losowanie kulki do zmiany} 
      x:=random(Last)+1; 
      y:=random(Last)+1; 
      {sprawdza czy w tym miejscu nie ma juz jakies kulki, 
      jesli jest nic nie robi} 
      if Siatka[x,y].Wartosc=0 then 
        Siatka[x,y].Wartosc:=random(3)+1; 
    end; 
end; 

{procedure sluzy podawnia polecenia graczowi na ekranie} 
procedure PodajPolecenie(Tekst:string); 

var 
   Temp:integer; 
begin 
  {ustala kolor tla i ramki w ktorym pojawi sie polecenie,
  ramka jest potrzebna do zamazania poprzedniego polecenia} 
  Brush(1,255,255,255); 
  Pen(1,0,0,0); 
  Rectangle(0,60+20*Last,550,160+20*Last); 
  {ustala pozycje gdzie ma byc wypisane polecenie i je wypisuje} 
  Moveto(5,65+20*Last); 
  Writeln(Tekst);  
end; 


{zaznacza kolorem wybrana kulke na tablicy na tablicy "siatka",
kulke o pozycji "x,y"} 
procedure Zaznacz(Var Siatka:Plansza; x,y:integer); 

begin 
  {zaznacza wybrana kulke i odrazu maluje cala tablice} 
  Siatka[x,y].Zaznaczenie:=true; 
  {odrazu odswieza wyglad} 
  Maluj(Siatka); 
end;
 
{odznacza wszystkie kulki} 
procedure Odznacz(Var Siatka:Plansza); 

var 
   i,j:integer; 
begin 
  {odznacza wszystkie kulki na tablicy i maluje wszystko odznaczone} 
  For i:=1 to Last do 
    For j:=1 to Last do 
      Siatka[i,j].Zaznaczenie:=false; 
  {odrazu odswieza wyglad} 
  Maluj(Siatka); 
end; 


{funkcja ta sprawdza czy gdzie nie ma pieciu kulek kolo siebie,
wykrywa je, usuwa i zwraca ile takich "piatek" zostalo usuniete, 
czyli podaje wynik gry}
function KasujPiatki(var Siatka:Plansza):integer; 
var 
   i,j,t,z,DST,dX,dY:integer; 
   Temp,Wynik:integer; 
   Ciag:array[1..Last] of integer; 
    
begin
  {nadaje wartosc wynikowi} 
  Wynik:=0; 
  {petla wykonuje sie dla "Last*6-2", gdyz musi sprawdzic "last'n¹" ilosc kolumn
  rzedow i przkeatnych}
  for i:=1 to Last*6-2 do 
    begin 
      {teraz wartosc z siatki jest kopiowana do tablicy "ciag",
      gdyz tak mozna sensownie podzielic macierz dwuwymiarow¹
      i poddac j¹ sprawdzeniu czy sa gdzies "piatki" kulek}
      
      {dla wartosci "i<=Last" bedzie sprawdzac wiersze}
      if i<=Last then begin
        for j:=1 to Last do 
          Ciag[j]:=Siatka[i,j].Wartosc;
        {w zmiennej DST jest zapamietywana dlugosc tablicy Ciag}
        DST:=Last;
      end 
      else 
        {a dla wartosci i>Last bedzie srpawdzac kolumny}
        if (i>Last) and (i<=2*Last) then begin
          for j:=1 to Last do 
            Ciag[j]:=Siatka[j,i-Last].Wartosc;
          {w zmiennej DST jest zapamietywana dlugosc tablicy Ciag}
          DST:=Last;
        end
        else 
          {linie ukosne prawo w dol}
          if (i>2*Last) and (i<=4*Last-1) then begin
            {liczy dlugosc ciagu ukosnego}
            j:=i-2*last;
            if j<=Last then begin
              {ustala wartosci o ile kazda wspolrzedna odbiega od przk¹tnej
              zanim do niej dojdzie}              
              dY:=Last-j;
              dX:=0;
            end
            else
            begin
              {po dojsciu do przekatnej ciag zaczyna sie znowu skracac}
              j:=-(j-2*Last);
              {ustala wartosci o ile kazda wspolrzedna odbiega od przk¹tnej
              jak juz przekatna zostanie szczytana}  
              dY:=0;  
              dX:=Last-j;                     
            end;
            {w zmiennej DST jest zapamietywana dlugosc tablicy Ciag}
            DST:=j;
            for t:=1 to j do 
              Ciag[t]:=Siatka[t+dX,t+dY].Wartosc;
          end
          else
            {linie ukosne prawo w gore}
            if (i>4*Last-1) and (i<=6*Last-2) then begin
              {liczy dlugosc ciagu ukosnego}
              j:=i-4*Last-1;
              if j<=Last then begin
                {ustala wartosci o ile kazda wspolrzedna odbiega od przk¹tnej
                zanim do niej dojdzie}                  
                dY:=j+1;
                dX:=0;
              end
              else
              begin
                {po dojsciu do przekatnej ciag zaczyna sie znowu skracac}
                j:=-(j-2*Last);
                {ustala wartosci o ile kazda wspolrzedna odbiega od przk¹tnej
                jak juz przekatna zostanie szczytana}  
                dY:=Last+1;  
                dX:=Last-j;                     
              end;
              DST:=j;
              for t:=1 to j do 
                Ciag[t]:=Siatka[t+dX,dY-t].Wartosc;      
            end;
      {procedura przystepuje do wlasciwego sprawdzania
      czy gdzies s¹ piatki}
      temp:=1; 
      for t:=1 to DST-1 do 
        begin 
          {porownuje parami element "t" z elementem "t+1"
          czy sa takie same i sprawdza czy nie jest puste,
          jesli tak to wydluza zmienna temp w ktorej pamieta
          jak dlugi jest ciag kulek.  Jesli nie skraca zmienna
          temp do 1}
          if (Ciag[t]=Ciag[t+1]) and (Ciag[t]<>0) then 
            temp:=temp+1 
          else 
            temp:=1; 
            
          {jesli ciag kulek osiaga wartosc 5 to usuwa je 
          i wynik zwieksza o jeden, a temp ustawia znowu
          na 1}
          if Temp=5 then 
            begin 
              Wynik:=Wynik+1; 
              for z:=t-3 to t+1 do 
                Ciag[z]:=0; 
              temp:=1; 
            end 
        end; 
        
      {tak jak na poczatku zwraca z tablicy "ciag" nowe wartosci
      siatki}
      if i<=Last then begin
        for j:=1 to Last do 
          Siatka[i,j].Wartosc:=Ciag[j];
      end 
      else 
        if (i>Last) and (i<=2*Last) then begin
          for j:=1 to Last do 
            Siatka[j,i-Last].Wartosc:=Ciag[j];
        end
        else 
          if (i>2*Last) and (i<=4*Last-1) then begin
            {wartosci dX,dY,j s¹ juz policzone}
            for t:=1 to j do 
              Siatka[t+dX,t+dY].Wartosc:=Ciag[t];
          end
          else
            if (i>4*Last-1) and (i<=6*Last-2) then begin
              {wartosci dX,dY,j s¹ juz policzone}
              for t:=1 to j do 
                Siatka[t+dX,dY-t].Wartosc:=Ciag[t];
            end;
    end; 
  
  {zwraca wartosc funkcji tj ile "piatek kulek" znalaz³}
  KasujPiatki:=Wynik; 
end; 

procedure WypiszWynik(Wynik,Krok:integer); 

begin 
  {rysuje ramke dla wyniku i liczby krokow}
  Brush(1,255,255,255); 
  Pen(1,0,0,0); 
  Rectangle(0,110+60+20*Last,550,110+160+20*Last); 
  {ustala pozycje gdzie ma byc wypisany aktualny krok i wynik, 
  poczym wypisuej} 
  Moveto(5,110+65+20*Last); 
  Writeln('Krok numer: ',Krok); 
  Moveto(5,125+65+20*Last); 
  Writeln('Wynik: ',Wynik); 
end; 

{funkcja ta zamienia wsporzedna pixelow¹ z ekranu na rzad lub kolumne,
jedna funkcja moze obslugiwac kolumny i rzedy bo plansza jest kwadratowa}
function PixelPozycja(Pixel:integer):integer;
var
Wynik:integer;
begin
  {sprawdza czy gracz klikna³ w obrebie kulek}
  if (Pixel>=35) and (Pixel<=(35+Last*20)) then
    Wynik:=((Pixel-35) div 20) + 1
  else
    {jesli nie, funkcja zwraca zero co jest informacj¹ o bledzie}
    Wynik:=0;
  PixelPozycja:=Wynik;  
end;

var 
   x,y,x1,y1,x2,y2,Wynik,Krok,k:integer; 
 
{wlasciwa czesc programu}
Begin 
  {ustawianie wyniku na poczatku gry na 0}
  Wynik:=0; 
  {ustawianie ilosci krokow na poczatku gry na 1}
  Krok:=1;
  {inicjalizowanie tablicy kulek} 
  Zerowanie(Tablica); 
  {dodawanie losowych kulek na tablice}
  LosujKulki(Tablica,3); 
  {rysowanie stanu poczatkowego}
  Maluj(Tablica);   
  {petla ktora "napedza" cala gre, mozna przerwac tylko przez reset programu}
  while 0=0 do 
    begin
      PodajPolecenie('Zaznacz kulkê któr¹ chcesz przenieœæ:');
      {wypisanie ilosci krokow i wyniku}
      WypiszWynik(Wynik,Krok);
      
      {repeat/until zadaje pytanie o pozycje kulki az gracz wybierze pole na ktorym 
      rzeczywiscie znajduje sie kulka, tak by nie mogl zaznaczyc pustego pola}                     
      repeat 
        Event(k,x,y); 
        x1:=PixelPozycja(x);
        y1:=PixelPozycja(y);              
      until (x1>0) and (y1>0) and (Tablica[x1,y1].Wartosc<>0); 
      
      {zaznacza na tablicy aktualnie wybrana kulke} 
      Zaznacz(Tablica,x1,y1);
      

      PodajPolecenie('Zaznacz puste pole do którego chcesz przenieœæ kulke:'); 
      WypiszWynik(Wynik,Krok); 
      
      {repeat/until zadaje pytanie o pozycje kulki az gracz wybierze puste pole,
      tak by nie mogl przeniesc kulki na juz zajete pole}       
      repeat        
        Event(k,x,y); 
        x2:=PixelPozycja(x);
        y2:=PixelPozycja(y);       
      until (x2>0) and (y2>0) and (Tablica[x2,y2].Wartosc=0); 
      
      {przenosi kulke na nowa pozycje}
      Tablica[x2,y2]:=Tablica[x1,y1]; 
      {usuwa w starej pozycji informacje o kulce}
      Tablica[x1,y1].Wartosc:=0; 
      {odznacza zaznaczon¹ kulke i odswieza plansze gry}
      Odznacz(Tablica); 
      {usuwa "piatki kulek" i aktualizuje wynik gry}
      Wynik:=Wynik+KasujPiatki(Tablica); 
      {dorzuca kolejne kulki do planszy}
      LosujKulki(Tablica,3); 
      {maluje nowo dorzucone kulki}
      Maluj(Tablica);
      {zwieksza ilosc wykonannych krokow i wypisuje akutalny wynik i krok na ekran}
      Krok:=Krok+1; 
      WypiszWynik(Wynik,Krok); 
    end; 
end.
