Program Galeria; 

Const 
   Csize=12; 
   {rozmiar komorki w pikselach} 
   Gsize=20; 
   {rozmiar galerii w komorkach} 
   Numczlo=70; 
   {ilosc ludzi} 
   Numart=8; 
   {ilosc obrazow - NIE ZMIENIAC} 
   MaxExpo=20; 
   {poziom przyciagania uwagi, po ktory osoba uznaje obraz za obejrzany} 
   Display=true; 
   {czy wyswietlac symulacje - wyswietlanie nie spowalnia znaczaco dzialania} 
   ShowDebug=false; 
   {czy wyswietlac dane liczbowe (i tak beda zapisane w pliku)} 
   Speed=1; 
   {predkosc symulacji, im mniejsza tym szybciej} 
   Path='./'; 
   {sciezka do zapisywania wynikow} 
Type 
   kwa=record 
   {komorka galerii} 
        widok:real; 
        {jak mocny poziom przyciagania uwagi w tej komorce
                     (obrazowana intensywnoscia koloru niebieskiego} 
        obraz:integer; 
        {ktory obraz tutaj oddzialywuje} 
        typ:integer; 
        {typ komorki:  0 - pusta
                                    1 - sciana
                                    2 - obraz
                                    3 - /nieuzyte/
                                    4 - pole ekspozycji} 
   end; 
   
   art=record 
   {dzielo sztuki} 
        x:integer; 
        {wpolrzedne} 
        y:integer; 
   end; 
   
   czlo=record 
   {czlowiek odwiedzajacy galerie} 
        x:integer; 
        {wspolrzedne} 
        y:integer; 
        seen:Array[1..Numart] of boolean; 
        {czy dany obraz jest obejrzany} 
        seennum:integer; 
        {ile obrazow juz obejrzal} 
        expo:real; 
        {obecny poziom przyciagania uwagi przy patrzeniu na dany obraz} 
        seentime:Array[1..Numart] of integer; 
        {ile krokow symulacji spedzil przy danym obrazie} 
   end; 
Var 
   i,finnum,steps,h1,m1,s1,h2,m2,s2,day,month,year:integer; 
   filename,ys,ms,ds,h1s,m1s,s1s:string; 
   ludzie:Array[1..Numczlo] of czlo; 
   dziela:Array[1..Numart] of art; 
   plansza:Array[1..Gsize,1..Gsize] of kwa; 
   file:text; 

function iscell(x,y:integer):boolean; 
{funkcja sprawdza czy komorka o podanych wspolrzednych istnieje} 

begin 
  if (x>1) and (y>1) and (x<Gsize) and (y<Gsize) then 
    iscell:=true 
    {jesli miesci sie w rozmiarze galerii to istnieje} 
  else 
    iscell:=false; 
end; 

Procedure init; 
{procedura inicjujaca symulacje} 

var 
   zx,spc,i,j,k,l,i2,j2:integer; 
begin 
  finnum:=0; 
  {ile osob skonczylo zwiedzanie, na poczatku nikt} 
  spc:=Gsize div (Numart div 2)+1; 
  {rozmieszczenie obrazow wzgledem scian} 
  for j:=1 to Gsize do 
    for i:=1 to Gsize do 
      begin 
        if (i=1) or (j=1) or (i=Gsize) or (j=Gsize) then 
          plansza[i,j].typ:=1 
          {rysujemy sciany, tutaj mozna ew dodac jakies przeszkody} 
        else 
          plansza[i,j].typ:=0; 
        {jak nie sciana to pusta przestrzen} 
      end; 
  dziela[1].x:=2; 
  { ten blok kodu odpowiada za umieszczenie } 
  dziela[1].y:=spc+1; 
  { obrazow. przy wiekszej ilosci czasu moznaby } 
  dziela[2].x:=2; 
  { utworzyc wersje robiaca to w sposob automatyczny } 
  dziela[2].y:=Gsize-spc; 
  { co pozwoliloby manipulowac iloscia dziel } 
  dziela[3].x:=spc+1; 
  dziela[3].y:=2; 
  dziela[4].x:=Gsize-spc; 
  dziela[4].y:=2; 
  dziela[5].x:=Gsize-1; 
  dziela[5].y:=spc+1; 
  dziela[6].x:=Gsize-1; 
  dziela[6].y:=Gsize-spc; 
  dziela[7].x:=spc+1; 
  dziela[7].y:=Gsize-1; 
  dziela[8].x:=Gsize-spc; 
  dziela[8].y:=Gsize-1; 
  for i:=1 to Numart do 
    plansza[dziela[i].x,dziela[i].y].typ:=2; 
  {typ komorki zmieniamy} 
  k:=trunc(sqrt(Numczlo)); 
  { wyznaczamy pierwiastek liczby ludzi } 
  j2:=(Gsize-k)div 2+k; 
  { sluzy do rozmieszczenia ich na poczatkowych } 
  i2:=(Gsize-k)div 2+k; 
  { miejscach, mniej wiecej na srodku planszy } 
  l:=1; 
  { zaczynamy od pierwszego czlowieka } 
  for j:=(Gsize-k)div 2 to j2 do 
    for i:=(Gsize-k)div 2 to i2 do 
      begin 
        if l<=Numczlo then 
        {jesli mamy jeszcze ludzi do umieszczania} 
          begin 
            ludzie[l].x:=i; 
            { kazdy zwiedzajacy otrzymuje } 
            ludzie[l].y:=j; 
            { polozenie w przestrzeni oraz } 
            ludzie[l].expo:=0; 
            { zerowy czas ekspozycji i } 
            ludzie[l].seennum:=0; 
            { zerowa ilosc obejrzanych dziel } 
            for zx:= 1 to Numart do 
              begin 
                ludzie[l].seen[zx]:=false; 
                { zadnego dziela nie widzial } 
                ludzie[l].seentime[zx]:=0; 
                { nie spedzil czasu na ogladaniu } 
              end; 
            l:=l+1; 
            { nastepny! } 
          end; 
      end; 
  for k:=1 to Numart do 
    { pora na pola przyciagania uwagi } 
    for j:=-(spc div 2) to spc div 2 do 
      for i:=-(spc div 2) to spc div 2 do 
        begin 
          if iscell(dziela[k].x+j,dziela[k].y+i) and (plansza[dziela[k].x+j,dziela[k].y+i].typ=0) and((sqr(i)+sqr(j))<sqr(spc div 2)) then 
          {dziela dzialaja w promieniu spc div 2} 
            begin 
              plansza[dziela[k].x+j,dziela[k].y+i].obraz:=k; 
              { ktory obraz oddzialywuje } 
              plansza[dziela[k].x+j,dziela[k].y+i].typ:=4; 
              { ustawiony typ na pole oddzialywania } 
              plansza[dziela[k].x+j,dziela[k].y+i].widok:=1-(sqr(i)+sqr(j))/sqr(spc div 2); 
              {moc oddzialywania obliczona na podstawie odleglosci od obrazu. przedzial 0..1 (real) } 
            end; 
        end; 
end; 
{ALGO BREAK} 

Procedure drawczlo(k:integer); 
{procedura rysowania zwiedzajacego} 
{rysowani sa pojedynczo, zeby zwiekszyc wydajnosc symulacji} 

begin 
  if Display then 
    begin 
      brush(1,255,160,0); 
      {ludzie sa na pomaranczowo} 
      rectangle((ludzie[k].x-1)*Csize,(ludzie[k].y-1)*Csize,ludzie[k].x*Csize,ludzie[k].y*Csize); 
    end; 
end; 

Procedure drawtile(x,y:integer); 
{procedura rysowania komorki galerii} 

begin 
  if Display then 
    begin 
      pen(1,255,255,255); 
      begin 
        case plansza[x,y].typ of 
        {w zaleznosci od typu inny kolor} 
          0: 
          {puste na szaro} 
            brush(1,234,234,234); 
          1: 
          {sciany na niebiesko} 
            brush(1,0,0,196); 
          2: 
          {dziela na czerwono} 
            brush(1,255,0,0); 
          4: 
          {pole przyci¹gania na rozne odcienie morskiego w zaleznosci
          od sily oddzialywania} 
            brush(1,trunc(255-255*plansza[x,y].widok),234,234); 
        end; 
        rectangle((x-1)*Csize,(y-1)*Csize,x*Csize,y*Csize); 
      end; 
    end; 
end; 

procedure Remove(z:integer); 
{usuniecie osoby z symulacji} 

begin 
  drawtile(ludzie[z].x,ludzie[z].y); 
  {wymazanie pomaranczowego punktu} 
  ludzie[z].x:=-1; 
  {osoba przeteleportowana poza plansze} 
  ludzie[z].y:=-1; 
  finnum:=finnum+1; 
  {ilosc osob, ktore zwiedzily galerie sie zwieksza} 
end; 
{ALGO BREAK} 

Procedure drawall; 
{procedura rysujaca wszystko} 
{przywolywana raz na poczatek symulacji} 

var 
   i,j,k:integer; 
begin 
  for j:=1 to Gsize do 
    for i:=1 to Gsize do 
      drawtile(i,j); 
  {rysowanie komorek} 
  for k:= 1 to Numczlo do 
    drawczlo(k); 
  {rysowanie ludzi} 
end; 

Function isempty(x,y:integer):boolean; 
{funkcja sprawdzajaca
                   czy dana komorka jest pusta i mozna na nia wejsc} 

Var 
   l:integer; 
   result:boolean; 
Begin 
  result:=true; 
  for l:=1 to Numczlo do 
    if (x=ludzie[l].x) and (y=ludzie[l].y) then 
      result:=false; 
  {jesli jest tam juz ktos to nie} 
  if (plansza[x,y].typ=1) or (plansza[x,y].typ=2) then 
    result:=false; 
  {jesli jest to obraz badz sciana to tez nie} 
  isempty:=result; 
End; 

Procedure moveczlo(z:integer); 
{wyznaczenie kolejnego ruchu danej osoby} 

var 
   moved:boolean; 
   {czy sie ruszyl} 
   q,w,nx,ny,tries:integer; 
   high:real; 
   {najbardziej atrakcyjne miejsce w sasiedztwie} 
Begin 
  moved:=false; 
  {nie ruszyl sie jeszcze} 
  tries:=0; 
  {ile podjal prob} 
  if (plansza[ludzie[z].x,ludzie[z].y].typ=4) and not (ludzie[z].seen[plansza[ludzie[z].x,ludzie[z].y].obraz]) then 
  {jesli znajduje sie w strefie oddzialywania jakiego dziela,
     ktorego jeszcze nie widzial to:} 
    begin 
      high:=plansza[ludzie[z].x,ludzie[z].y].widok;
      {inicjujemy zmienne} 
      nx:=0; 
      ny:=0; 
      for w:=-1 to 1 do 
        for q:=-1 to 1 do 
          {sprawdzamy wszstkie sasiednie komorki} 
          if (plansza[ludzie[z].x+q,ludzie[z].y+w].typ=4) then 
          {jesli wciaz jest w zasiegu - sprawdzamy dalej} 
            if (plansza[ludzie[z].x+q,ludzie[z].y+w].widok>high) and isempty(ludzie[z].x+q,ludzie[z].y+w) then 
            {jesli sasiednia komorka jest bardziej
               atrakcyjna niz poprzednia testowana
               i nikt tam juz nie stoi to:} 
              begin 
                high:=plansza[ludzie[z].x+q,ludzie[z].y+w].widok; 
                { ustawiamy nowy szczyt atrakcyjnosci } 
                nx:=q; 
                {i planujemy sie tam przeniesc } 
                ny:=w; 
              end; 
      drawtile(ludzie[z].x,ludzie[z].y); 
      {kasujemy ogladajacego} 
      ludzie[z].x:=ludzie[z].x+nx; 
      {ruszamy go} 
      ludzie[z].y:=ludzie[z].y+ny; 
      drawczlo(z); 
      {i rysujemy ponownie} 
      ludzie[z].expo:=ludzie[z].expo+plansza[ludzie[z].x,ludzie[z].y].widok; 
      {rosnie jego poziom obejrzenia dziela} 
      ludzie[z].seentime[plansza[ludzie[z].x,ludzie[z].y].obraz]:=ludzie[z].seentime[plansza[ludzie[z].x,ludzie[z].y].obraz]+1; 
      {rosnie takze czas, ktory na tym spedzil} 
      if ludzie[z].expo>MaxExpo then 
      {jesli juz sie naogladal to:} 
        begin 
          ludzie[z].seen[plansza[ludzie[z].x,ludzie[z].y].obraz]:=true; 
          {ustalamy, ze obraz zostal obejrzany} 
          ludzie[z].expo:=0; 
          {resetujemy poziom obejrzenia} 
          ludzie[z].seennum:=ludzie[z].seennum+1; 
          {zwiekszamy licznik obejrzanych obrazow dla tej osoby} 
          if ludzie[z].seennum>=Numart then 
          {jesli juz widzial wszystkie obrazy to opuszcza galerie} 
            Remove(z); 
        end; 
    end 
  else 
    {jesli zas nie jest w zasiegu zadnego dziela, ktorego nie widzial} 
    repeat 
      begin 
        repeat 
          begin 
            {milosnicy sztuki, jak wiadomo, poruszaja sie ruchami Browna} 
            nx:=random(3)-1; 
            ny:=random(3)-1; 
          end; 
        until not((nx=0) and (ny=0)); 
        {losujemy dopoki nie wylosujemy czegos
        innego niz dwa zera, powinno dosc szybko sie udac} 
        if isempty(ludzie[z].x+nx,ludzie[z].y+ny) then 
        {jesli wylosowane miejsce jest puste to:} 
          begin 
            drawtile(ludzie[z].x,ludzie[z].y); 
            ludzie[z].x:=ludzie[z].x+nx; 
            ludzie[z].y:=ludzie[z].y+ny; 
            drawczlo(z); 
            {przenosimy tam naszego czlowieka} 
            moved:=true; 
            {i ustalamy ze ruch zostal wykonany} 
          end 
        else 
          tries:=tries+1; 
        { w przeciwnym wypadku probujemy ponownie} 
      end; 
    until (moved) or (tries>20); 
  {probujemy do skutku ale po 20
                                  niepowodzeniach sie poddajemy} 
end; 

procedure debug; 
{ procedura wypisujace dane wszystkich osob,
                   pelni funkcje czysto informacyjna.} 

var 
   lx,dx:integer; 
begin 
  moveto(0,Gsize*Csize+40); 
  for lx:= 1 to Numczlo do 
    begin 
      write(lx:2,': ',ludzie[lx].expo:2:3,' - ',ludzie[lx].seennum,':'); 
      for dx:= 1 to Numart do 
        write(ludzie[lx].seentime[dx]:3,'; '); 
      writeln; 
    end; 
end; 

Procedure writeexcel; 
{procedura odpowiadajaca za powstanie eleganckiego pliku w Excelu} 

var 
   xl,yl:integer; 
begin 
  filename:='galeria_'+ys+'-'+ms+'-'+ds+'_'+h1s+'-'+m1s+'-'+s1s+'.xls'; 
  assign(file,Path+filename); 
  rewrite(file); 
  writeln(file,'Symulacja "Galeria": ',ys,'-',ms,'-',ds); 
  writeln(file,'CZAS ROZPOCZECIA SYMULACJI: ',h1,':',m1,':',s1); 
  writeln(file,'PARAMETRY: ilosc ludzi: ',Numczlo,', rozmiar galerii: ',Gsize,', wymagany czas ekspozycji: ',MaxExpo); 
  writeln(file,'LEGENDA: kolumny = obrazy, rzedy = zwiedzajacy. Wartosci liczbowe przedstawiaja czas spedzony przed poszczegolnym obrazem.'); 
  writeln(file,''); 
  write(file,chr(9)); 
  for xl:=1 to Numart do 
    write(file,xl,chr(9)); 
  writeln(file,''); 
  for yl:=1 to Numczlo do 
    begin 
      write(file,yl,chr(9)); 
      for xl:=1 to Numart do 
        write(file,ludzie[yl].seentime[xl],chr(9)); 
      writeln(file,'');
    end; 
  writeln(file,''); 
  writeln(file,'CZAS ZAKONCZENIA SYMULACJI: ',h2,':',m2,':',s2); 
  close(file); 
end; 
{ GLOWNY PROGRAM! } 

Begin 
  init; 
  {inicjalizacja symulacji} 
  drawall; 
  {rysujemy pierwszy raz} 
  date(year,month,day); 
  time(h1,m1,s1); 
  str(year,ys); 
  str(month,ms); 
  str(day,ds); 
  str(h1,h1s); 
  str(m1,m1s); 
  str(s1,s1s); 
  while finnum<Numczlo do 
    {poki wszyscy nie obejrza wszystkiego:} 
    begin 
      delay(Speed); 
      for i:=1 to Numczlo do 
        {ruszamy kazdym, kto bierze udzial w symulacji} 
        if ludzie[i].seennum<Numart then 
          moveczlo(i); 
      if ShowDebug then 
        debug; 
      {wyswietlanie danych} 
    end; 
  time(h2,m2,s2); 
  writeexcel; 
end.
