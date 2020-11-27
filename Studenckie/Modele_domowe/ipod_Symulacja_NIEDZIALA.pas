Program iPod; 

type 
   agent=record {zadeklarowanie �wiata posiadaczy iPod�w}
        alife:boolean; {kom�rka �yje}
        attid:integer; {posiadanie iPoda}
        ChecDoiPoda:real; {ch�� do zakupu iPoda}
        wiek:integer; {wiek kom�rki}
        zarobki:integer; {zarobki kom�rki}
        wyksztalcenie:integer; {wykszta�cenie kom�rki}
        CzasPosiadania:integer; {Ile czasu ju� posiada dana kom�rka iPoda}
        oszczednosci:integer; {ile pieni�dzy zdo�a�a sobie od�o�y� kom�rka}
   end; 

   const {deklaracja sta�ych}
   MAXCZASPOS=12; {maksymalnego czasu posiadania iPoda}
   Last=30; {wielko�� tablicy (ilo�� kom�rek w pionie i poziomie)}
   Side=16; {wielko�� kom�rki}
   HowManyAttid=2; {ilo�� pogl�d�w }
   Skok=1; {Co ile krok�w ma wizualizowa� obraz}
   IleiPodowStart=1; {zmienna 'przysz�o�ciowa" do dalszych wersji programu, aby prowadzi� nowe del iPoda} 
   losowa=21; {Pewna sta�a s�u��ca do rozlosowywania}
   CenaiPoda=600; {Cena iPoda dla ka�dej z kom�rek}
   madrosc=0.2; {Prawdopdobie�stwo wyedukowania kom�rki w jednym miesi�cu}
   maxwiek=100; {maksymalny wik dla ka�dej kom�rki}
   LogName='c:\iPod.xls'; {nazwa pliku oraz �cieszk w kt�rym b�d� zapisane dane}
   LastHist=100;  {zmienna definiuj�ca ilo�� danych w tablicy histogramu}
   LastData=900;  {Maksymalny pasek histogramu przy rysowaniu} 
   HistHeight=1500; 
   kolumny=1; 
   {Sta�e zwi�zane z zakresem liczb zmiennoprzecinkowych} 
   REALMAX=1.6999999999999999999999e308; 
   REALMIN=-1.699999999999999999999e308; 
   REALLAST=0.000000000000000000001; 
   REALEPS=1.0e-323; 
var 
   swi,swy,sza,ska,Ileposiadajacych:integer; {zmienne do liczenia �rednich}
   scheci,maxcheci,mincheci:real;   {zmienne do liczenia �rednich}

   type 
   world=array[1..Last,1..Last] of agent; {tablica z zadeklarowanymi agentami }
   histogram=array[1..LastHist] of integer; {Tablica histogramu}
   rawdata=array[1..LastData] of real; {tablica z danymi potrzebnymi do zbudowania histogramu}

Function ObliczCheci(x,y:integer;var Tab:world):real ; 
{Funkcja oblicza checi jakie �ywi dana kom�rka do posiadania iPoda}
var 
   maxcheci,maxwykszt:integer; 
   ObliczCheciPodstawa:real; 
Begin 
  maxwykszt:=(maxwiek*(losowa-1))div (losowa*4); {obliczanie maxymalnego wykszta�cenia}
  maxcheci:=((maxwykszt*maxwiek * (losowa-1)) div losowa)*maxwykszt; {obliczanie MAXymalnych ch�ci}
  ObliczCheciPodstawa:=(Tab[x,y].zarobki*Tab[x,y].wyksztalcenie)/maxcheci; {Obliczanie podstawy checi kom�rki}
  {FUNKCJA OBLICZAJ�CA CH�CI w zale�no�ci od wieku max 32 lata ju� ujemne powy�ej 62 roku �ycia}
  if (ObliczCheciPodstawa*((-0.1*sqr(Tab[x,y].wiek)+6*Tab[x,y].wiek+10)/100))<=0 then 
    ObliczCheci:=0 {Je�eli ch�ci s� ujemne to zmieniamy je na 0 aby checi by�y w przedziale [0;1]}
  else 
    ObliczCheci:=(ObliczCheciPodstawa*((-0.1*sqr(Tab[x,y].wiek)+6*Tab[x,y].wiek+10)/100)); 
end; 
{Procedura inicjuj�ca �wiat symulacji sprzeda�y iPod�w wed�ug zadanych parametr�w kontroli}
procedure Init(var Tab:world; var Tab1:rawdata; var Min,Max:real); 

var 
   i,j,k,l:integer; 
begin 
{Przypisanie warto�ci minimalnych i maksymalnych (obliczanie histogramu)}
  Max:=REALMIN; 
  Min:=REALMAX; 
  maxcheci:=REALMIN; 
  mincheci:=REALMAX; 
  {Wykonanie p�tli po kolei na ka�dej komurce i ustaleie dla niej odpowiednich parametr�w symulacji}
  for i:=1 to Last do 
    for j:=1 to Last do 
      begin 
        Tab[i,j].alife:=true; {Nasze za�o�enie jest takie, i� ka�da kom�rka jest �ywa}
        Tab[i,j].wiek:=random(maxwiek); {losuje wiek z przedzia�u od 0 do maksymalnego wieku -1}
        Tab[i,j].wyksztalcenie:=Tab[i,j].wiek*(random(losowa)) div (losowa * 4); {Obliczanie poziomu wykszta�cenia aby przypomina�o rozk�ad prawosko�ny}
        Tab[i,j].zarobki:=(Tab[i,j].wyksztalcenie*Tab[i,j].wiek*random(losowa)) div losowa; {Na zarobki wp�ywa wiek i wykszta�cenie + "szcz�cie"}
        Tab[i,j].oszczednosci:=Tab[i,j].zarobki*round(Tab[i,j].wiek/(random(Tab[i,j].wiek)+1)); {Oszcz�dno�ci jakie posiada kom�rka na pocz�tku inicjacji s� zdeterminowane od zarobk�w i wieku}
        Tab[i,j].ChecDoiPoda:=ObliczCheci(i,j,Tab); {Oblicza ch�� do posiadania iPoda wed�ug wcze�niej przypisanej funkcji}
        Tab[i,j].attid:=0; {Ustalenie, �e dana kom�rka nie posiada iPoda}
        Tab[i,j].Czasposiadania:=0; {Wyzerowanie dla takiej kom�rki czasu posiadania}
        Tab1[(i*Last+j)-last]:=Tab[i,j].checDoiPoda; {pzrypisanie do histogramu zmiennej ch�ci do iPoda}
      end ; 
  {Wyszukanie najmniejszej i najwi�kszej warto�ci z zmiennej zapisanej do utworzenia histogramu}
  for l:=1 to sqr(Last) do 
    begin 
      if Tab1[l]<Min then 
        begin 
          Min:=Tab1[l]; 
          Mincheci:=Tab1[l]; 
        end; 
      if Tab1[l]>Max then 
        begin 
          Max:=Tab1[l]; 
          maxcheci:=Tab1[l]; 
        end; 
    end; 
 {LOSOWANIE KOM�REK, KT�RE B�D� POSIADA� iPoda (czyli tyle os�b ile  ma zmienna ileiPod�wStrat
  for k:=1 to IleiPodowStart do 
    begin 
      i:=random(last)+1; 
      j:=random(last)+1; 
      Tab[i,j].attid:=1; 
      {czyli posiada iPoda} 
    end; 
end; 

procedure ObliczSrednieChecZakupu(var Tab:world; var Tab1:rawdata; var Min,Max:real); 
{Oblicza aktualne stresy dla wszystkich agent�w} 

var 
   i,j,n,l:integer; 
begin 
  swi:=0; 
  swy:=0; 
  sza:=0; 
  ska:=0; 
  Max:=REALMIN; 
  Min:=REALMAX; 
  maxcheci:=REALMIN; 
  mincheci:=REALMAX; 
  scheci:=0; 
  Ileposiadajacych:=0; 
  N:=sqr(Last); 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].alife then 
        begin 
          Tab[i,j].ChecDoiPoda:=ObliczCheci(i,j,Tab); 
          swi:=swi+Tab[i,j].wiek; 
          swy:=swy+Tab[i,j].wyksztalcenie; 
          sza:=sza+Tab[i,j].zarobki; 
          ska:=ska+Tab[i,j].oszczednosci; 
          scheci:=scheci+Tab[i,j].checdoiPoda; 
          if Tab[i,j].attid=1 then 
            begin 
              Ileposiadajacych:=Ileposiadajacych+1; 
              Tab[i,j].ChecDoiPoda:=0; 
            end; 
          Tab1[(i*Last+j)-last]:=Tab[i,j].checdoiPoda; 
        end ; 
  for l:=1 to sqr(last) do 
    begin 
      if Tab1[l]<Min then 
        begin 
          Min:=Tab1[l]; 
          Mincheci:=Tab1[l]; 
        end; 
      if Tab1[l]>Max then 
        begin 
          Max:=Tab1[l]; 
          maxcheci:=Tab1[l]; 
        end; 
    end; 
  swi:=swi div N; 
  swy:=swy div N; 
  sza:=sza div N; 
  ska:=ska div N; 
  scheci:=scheci/N; 
end; 
{ WERSJA DETERMINISTYCZNA BINARNA      } 
{-------------------------------------------------------} 

procedure DeterministicChange(var Tab:world;x,y:integer); 
{Zmiana stanu agenta w swiecie dwu postaw!} 
{Pe�ny konformizm - zmiana na liczniej reprezentowany pogl�d} 

var 
   licznik:integer; 
   lewo,prawo,g�ra,d�,i,j:integer; 
   max,nowy:integer; 
begin 
  licznik:=0; 
  lewo:=x-1; 
  if lewo<1 then 
    lewo:=last; 
  prawo:=x+1; 
  if prawo>Last then 
    prawo:=1; 
  g�ra:=y-1; 
  if g�ra<1 then 
    g�ra:=Last; 
  d�:=y+1; 
  if d�>Last then 
    d�:=1; 
  for i:=lewo to prawo do 
    for j:=g�ra to d� do 
      if Tab[i,j].alife then 
        begin 
          if Tab[i,j].attid=1 then 
            licznik:=licznik+1 
            {else 
              licznik:=licznik-1;} 
        end; 
  case licznik of 
    8,7,6,5 : 
      if Tab[x,y].oszczednosci>=cenaiPoda then 
        begin 
          Tab[x,y].attid:=1 ; 
          Tab[x,y].oszczednosci:=Tab[x,y].oszczednosci-cenaiPoda; 
          Tab[i,j].ChecDoiPoda:=0; 
        end 
      else 
        Tab[x,y].ChecdoiPoda:=(Tab[x,y].ChecdoiPoda+licznik) ; 
    4,3,2 : 
      if (Tab[x,y].oszczednosci>=cenaiPoda) and (Tab[x,y].ChecdoiPoda<licznik*random) then 
        begin 
          Tab[x,y].attid:=1 ; 
          Tab[x,y].oszczednosci:=Tab[x,y].oszczednosci-cenaiPoda; 
          Tab[i,j].ChecDoiPoda:=0; 
        end 
      else 
        Tab[x,y].ChecdoiPoda:=(Tab[x,y].ChecdoiPoda+licznik) ; 
  else 
    if licznik>0 then 
      Tab[x,y].ChecdoiPoda:=(Tab[x,y].ChecdoiPoda+licznik)/2 
    else 
      Tab[x,y].ChecdoiPoda:=Tab[x,y].ChecdoiPoda-random; 
  end; 
  {else 
    Tab[x,y].attid:=0 } 
end; 
{ NAIWNIE PODOBNA DO GETTA WERSJA PROBABILISTYCZNA      } 
{-------------------------------------------------------} 

procedure WykonajKrok(var Tab:world); 

var 
   a,steplenght,i,j,ni,nj,wydatki:integer; 
begin 
  steplenght:=sqr(Last); 
  for a:=1 to steplenght do 
    begin 
      i:=1+random(Last); 
      j:=1+random(Last); 
      wydatki:=round(Tab[i,j].zarobki*0.95); 
      Tab[i,j].oszczednosci:= Tab[i,j].oszczednosci-wydatki; 
      DeterministicChange(Tab,i,j); 
      if Tab[i,j].attid=1 then 
        begin 
          Tab[i,j].ChecDoiPoda:=0; 
          Tab[i,j].Czasposiadania:=Tab[i,j].Czasposiadania+1; 
          if Tab[i,j].Czasposiadania>MAXCZASPOS then 
            begin 
              Tab[i,j].attid:=0; 
              Tab[i,j].Czasposiadania:=0; 
            end; 
          Tab[i,j].ChecDoiPoda:=0; 
        end; 
      if (Tab[i,j].wiek>=maxwiek) or (Tab[i,j].oszczednosci<-cenaiPoda-100) then 
        begin 
          Tab[i,j].wiek:=0; 
          Tab[i,j].wyksztalcenie:=0; 
          Tab[i,j].attid:=0; 
          Tab[i,j].zarobki:=random(Tab[i,j].zarobki); 
          Tab[i,j].oszczednosci:=random(Tab[i,j].oszczednosci); 
          Tab[i,j].checdoiPoda:=0; 
        end; 
      if (random<0.001) and (Tab[i,j].oszczednosci>=cenaiPoda) and (Tab[i,j].ChecdoiPoda<random) then 
        begin 
          Tab[i,j].attid:=1 ; 
          Tab[i,j].oszczednosci:=Tab[i,j].oszczednosci-cenaiPoda; 
          Tab[i,j].ChecDoiPoda:=0; 
        end; 
      Tab[i,j].wiek:=Tab[i,j].wiek + 1; 
      if random<madrosc then 
        Tab[i,j].wyksztalcenie:=Tab[i,j].wyksztalcenie+1; 
      Tab[i,j].zarobki:=(Tab[i,j].wyksztalcenie*Tab[i,j].wiek*random(losowa)) div losowa; 
      Tab[i,j].oszczednosci:=Tab[i,j].oszczednosci+Tab[i,j].zarobki; 
    end ; 
end; 
{ RYSOWANIE               } 
{-------------------------} 

procedure ChangeBorder(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,round(v),0,0); 
end; 

procedure ChangeFill(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Brush(1,round(v*0.1),0,round(v)); 
  {Niebieskie} 
end; 

procedure Draw(var Tab:World;x,y,side:integer); 
{Rysuje swiat za pomoc� elips z pokazyjacych ras� i stres} 

var 
   i,j,N:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].alife then 
        begin 
          ChangeBorder(Tab[i,j].ChecDoiPoda,mincheci,maxcheci); 
          ChangeFill(Tab[i,j].attid,0,HowManyAttid); 
          rectangle(x+i*side-side,y+j*side-side,x+i*side,y+j*side); 
        end 
      else 
        begin 
          Brush(1,255,255,255); 
          Pen(1,255,255,255); 
          rectangle(x+i*side-side,y+j*side-side,x+i*side,y+j*side); 
        end; 
end; 

procedure MakeHistogram(var Tab:rawdata;N:integer;Min,Max:real;var Hist:histogram;NofR:integer); 

var 
   i,a:integer; 
   x:real; 
begin 
  {Zerowanie histogramu} 
  for i:=1 to LastHist do 
    hist[i]:=0; 
  {Zliczanie histogramu} 
  for i:=1 to N do 
    begin 
      {Do zakresu 0..1} 
      x:=(Tab[i]-Min)/(Max-Min); 
      {a z zakresu 1..NofR, Max na si�� do ostatniego} 
      if x>=1 then 
        a:=NofR 
      else 
        a:=trunc(x*NofR+1); 
      hist[a]:=hist[a]+1; 
    end; 
end; 

procedure DrawHistogram(var Hist:histogram;NofR,z:integer); 

var 
   i,n:integer; 
   x,y:integer; 
begin 
  for i:=1 to NofR do 
    begin 
      n:=Hist[i]; 
      {n:=trunc(n/LastData*HistHeight);} 
      n:=(n*HistHeight)div LastData; 
      Coordinates(x,y); 
      Rectangle(0,y,round(n/z),y+15); 
      MoveTo(round(n/z),y); 
      Writeln(Hist[i],'   '); 
    end; 
end; 

var 
   TheWorld:World; 
   TheData:rawdata; 
   TheHist:histogram; 
   step:integer; 
   log:text; 
   TheMin,TheMax:real; 

begin
 Assign(log,LogName); {oznaczenie pliku}
  Rewrite(log); {utworzenie pliku do wpisywania danych}
  Writeln(log,'Symulacja sprzedarzy iPod�w uwzgl�dniaj�� wiek wykszta�cenie i zarobki'); 
  Writeln(log,'Tablica=',Last,';Ilo�� pogl�d�w=',HowManyAttid,';Ilo�� iPod�w  na starcie=',IleiPodowStart,';Koszt iPoda=',CenaiPoda); 
  Writeln (log); {zapis odpowiednich danych do pliku i ewentualne rozdzielenie tab, aby kopiowanie do eksela stalo si� przyjemno�ci�}
  Writeln(log,'iteracja',chr(9),'�rednia wieku',chr(9),'�rednia wykszta�cenia',chr(9),'�rednia zarobk�w',chr(9),'�rednia posiadanyej kasy',chr(9),'�rednia chec do iPoda',chr(9),'ile os�b posiada iPoda'); 
  step:=0; {wyzerowanie krok�w}
  Init(TheWorld,TheData,TheMin,TheMax); {inicjacja �wiata symulacji}
  Draw(TheWorld,0,0,Side); {narysuj zainicjowany �wiat}
  Pen(1,0,0,0); 
  Brush(1,255,255,255); 
  Writeln; 
  Writeln; 
  Writeln('Histogram'); 
  TextColor(0,128,0); 
  writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
  TextColor(0,0,255); 
  MakeHistogram(TheData,LastData,TheMin,TheMax,TheHist,10); {utw�rz histogram}
  DrawHistogram(TheHist,10,1); {narysuj histogram}
  repeat 
    MoveTo(0,Last*side+10); 
    Pen(1,0,0,0); 
    Brush(1,255,255,255); 
    ObliczSrednieChecZakupu(TheWorld,TheData,TheMin,TheMax); {oblicza srednie dla kazej kom�rki}
    Writeln('kroki:',Step,' wiek:',swi,' nauka:',swy,' $$:=',sza,' oszczednosci:',ska,' ch��:',scheci,' Ile:',Ileposiadajacych,'  '); 
    if step mod skok = 0 then {rysuje swiat i histogram co tyle miesi�cy ile jest podane w sta�ej skok}
      begin 
        Draw(TheWorld,0,0,Side); {rysowanie �wiata iPod�w}
        Pen(1,0,0,0); 
        Brush(1,255,255,255); 
        Writeln; 
        Writeln; 
        Writeln('Histogram'); 
        TextColor(0,128,0); 
        writeln('Min=',TheMin:0:10,' Max=',TheMax:0:10); 
        TextColor(0,0,255); 
        MakeHistogram(TheData,LastData,TheMin,TheMax,TheHist,10); {Stworzenie histogramu}
        DrawHistogram(TheHist,10,1); {i narysowanie go}
      end;
    WykonajKrok(TheWorld); {wykonanie kroku}
    step:=step+1; {wykona� ca�� p�tle wi�c, dodaje do kroku 1}
  until isEvent;  {ko�czy je�li kto� klikno� mysz�}
    
close(log); {zamyka plik}
end.  {ko�czy program}