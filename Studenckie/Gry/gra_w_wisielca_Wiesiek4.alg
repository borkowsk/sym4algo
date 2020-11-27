program Wisielec; 
{Klasyczna gra w wisielca}

const 
   pX=100; {pozycja rysunku}
   pY=100; 
   p1X=10; {pozycja tekstu pod rysunkiem}
   p1Y=300; 
var 
   slowo: array[1..20] of char; {wylosowane s³owo}
   odkryte: array[1..60] of char; {tablica odkrytych liter}
   dlugosc:integer; {d³ugoœæ wylosowanego s³owa}
   poprawne:integer; {iloœæ odkrytych liter}

procedure rysuj(krok:integer); 
{Krokowo tworzy rysunek}
begin 
  case krok of 
    0: rectangle(pX-20,pY-20,pX+140,pY+170); 
    1: line(pX+0,pY+0,pX+0,pY+150); 
    2: line(pX+0,pY+130,pX+20,pY+150); 
    3: line(pX+0,pY+0,pX+110,pY+0); 
    4: line(pX+0,pY+20,pX+20,pY+0); 
    5: line(pX+100,pY+0,pX+100,pY+20); 
    6: ellipse(pX+90,pY+20,pX+110,pY+40); 
    7: line(pX+100,pY+40,pX+100,pY+80); 
    8: line(pX+100,pY+50,pX+80,pY+70); 
    9: line(pX+100,pY+50,pX+120,pY+70); 
    10: line(pX+100,pY+80,pX+80,pY+100); 
    11: line(pX+100,pY+80,pX+120,pY+100); 
  end; 
end; 

function ileWyrazow(Var plik:text):integer; 
{zwraca liczbê wyrazów w podanym pliku}
var 
   poprz,biez:char; 
   ile:integer; 
begin 
  ile:=0; 
  poprz:=' '; 
  reset(plik); 
  while not eof(plik) do 
    begin 
      read(plik,biez); 
      if((poprz=' ')and(not(biez=' ')))then 
        ile:=ile+1; 
      poprz:=biez; 
    end; 
  ileWyrazow:=ile; 
end; 

procedure wczytajLitere(litera:char); 
{Wstawia do tablicy s³owa pojedyncz¹ literê, jednoczeœnie tworz¹c
dla niej miejsce w tablicy liter odkrytych}
begin 
  dlugosc:=dlugosc+1; 
  slowo[dlugosc]:=upperCase(litera); 
  odkryte[3*dlugosc-2]:='['; 
  odkryte[3*dlugosc-1]:='_'; 
  odkryte[3*dlugosc-0]:=']'; 
end; 

procedure wybierzWyraz(Var plik:text; ktory:integer); 
{kopiuje do tablicy s³owa s³owo o okreœlonym indeksie z podanego pliku}
var 
   poprz,biez:char; 
   i:integer; 
begin 
  poprz:=' '; 
  biez:=' '; 
  dlugosc:=0; 
  reset(plik); 
  for i:=0 to ktory do 
    begin 
      repeat 
        poprz:=biez; 
        read(plik, biez); 
      until (poprz=' ') and (not(biez=' ')); 
    end; 
  repeat 
    wczytajLitere(biez); 
    poprz:=biez; 
    read(plik, biez); 
  until (not(poprz=' ')) and (biez=' ') or eof(plik); 
  if not(biez=' ') then 
    wczytajLitere(biez); 
end; 

procedure losujWyraz(); 
{Otwiera plik s³ownika, liczy s³owa i kopiuje wybrane losowo do tablicy
s³owa}
var 
   nazwa:string; 
   plik:text; 
   poprz,biez:char; 
   i:integer; 
begin 
  writeLn('Podaj nazwê pliku wejœciowego:'); 
  readLn(nazwa); 
  assign(plik,nazwa); 
  wybierzWyraz(plik, random(ileWyrazow(plik))); 
  writeln;
  writeln(' Wylosowano ',dlugosc,'-literowe slowo');
end; 

procedure odkryj(i:integer);
{odkrywa literê o podanym indeksie}
begin
  If not(slowo[i]='-') then 
    begin 
      odkryte[3*i-1]:=slowo[i]; 
      slowo[i]:='-'; 
    end; 
end;

function literaOK(lit:char):boolean; 
{sprawdza, czy podana litera nale¿y do wylosowanego s³owa.
Jeœli tak, ods³ania j¹ w tablicy liter ods³oniêtych}
var 
   i:integer; 
begin 
  literaOK:=false; 
  for i:=1 to dlugosc do 
    begin 
      if (slowo[i]=lit)and(not(lit='-')) then 
        begin 
          odkryj(i);
          literaOK:=true; 
          poprawne:=poprawne+1;
        end; 
    end; 
end; 

procedure pokazOdkryte(); 
{wyœwietla tablicê odkrytych liter}
var 
   i:integer; 
begin 
  moveTo(p1X+0,p1Y+0); 
  for i:=1 to 3*dlugosc do 
    write(odkryte[i]); 
end; 

var 
   i,blad,k,x,y:integer; 
   lit:char; 
   str:string; 

begin 
  losujWyraz; 
  {odkomentuj poni¿sze linie, aby program wyœwietla³ wylosowane s³owo
  dla u³atwienia kontroli jeso dzia³ania}
  { For i:=1 to dlugosc do 
     Write(slowo[i]); }
  rysuj(0); 
  pokazOdkryte; 
  moveTo(p1X+0,p1Y+20);
  write('Podaj literê...');
  blad:=0; 
  poprawne:=0; 
  while (blad<11)and(poprawne<dlugosc) do 
    begin 
      repeat
        event(k,x,y)
      until (k=1)and(y=2);
      lit:=upperCase(chr(x));
      moveTo(p1X+0,p1Y+35);
      write('Wybrano: [',lit,']');
      if not(literaOK(lit)) then 
        begin 
          blad:=blad+1; 
          rysuj(blad);
        end; 
      pokazOdkryte;
    end;
  moveTo(p1X+0,p1Y+70);
  if poprawne=dlugosc then
    write('Uratowa³eœ Wieœka!')
  else
    begin
      write('Powiesi³eœ Wieœka...');
      for i:=1 to dlugosc do
        odkryj(i);
      pokazOdkryte;
    end;
end.

{Instrukcja u¿ytkownika:
Program jest klasyczn¹ gr¹ w wisielca, poniewa¿ gra standardowo odbywa siê 
na kartce papieru, tak¿e i tutaj grafika jest prosta i sk³ada siê z czarnych
linii. Po rozpoczêciu gry, u¿ytkownik jest proszony o podanie œcie¿ki do pliku
s³ownika. Ze s³ownika losowane jest jedno s³owo, które gracz ma odgadn¹æ.
Gracz podaje literê przez naicœniêcie jej na klawiaturê. U¿ycie klawisza 
shift jest ignorowane. Je¿eli wylosowane s³owo zawiera podan¹ literê, jest 
ona wyœwietlana na tablicy, w przeciwnym wypadku rysowany jest kolejny
element Wieœka. Gra koñczy siê odgadniêciem wszystkich liter lub powieszeniem
ca³ego Wieœka.

Zsady tworzenia s³ownika:
- plik s³ownika zawiera s³owa, z których losowane jest jedno do odgadniêcia
przez gracza.
- liczba s³ów jest dowolna.
- d³ugoœæ s³ów jest ograniczona jedynie mo¿liwoœci¹ ich wyœwietlenia
w oknie gry.
- s³owa s¹ oddzielone pojedynczymi spacjami.}

