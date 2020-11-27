{
  ===================================================
  = Algo Graph                                      =
  ===================================================
    = Filename  : spik_grafika.alg                                                      =
    = Date      : 3 Nov 2005
    = Authors   : Pawel Choinski <shooler@fpp.pl>
                : Iza Olszewska
                : Natalia Jaszczuk
                : Ania Prokop
    =================================================
    =                                               =
    =================================================
    = Build time:  2 Days                           =
    =              Warsaw, Poland                   =
    =================================================

UWAGA! Animacje sa przystosowane do rozdzielczosci 700x700
        Prosimy wiec nieco rozciagnac okno podgladu ;) }

Program PracaZaliczeniowa; 

Procedure info(x:integer;y:string);
{Informacja o numerze klatki + nazwa efektu. Wyswietlane na gorze ekranu}
Begin
              Font(8,0,800);
              TextColor(255,0,0);
              Moveto(280,0);            
              Write(y); {nazwa efektu, description}      
              Moveto(0,0);
              Write('Frame: ');
              TextColor(0,255,0);
              Write(x); {numer klatki}     
End;

Procedure cross(a,b,c,del:integer;show_cross:boolean); 
{krzyrzujace sie linie}
var 
   i,j,s:integer; 
Begin 
  IF show_cross then {jesli true pokazuje efekt}
    Begin 
      s:=8; {grubosc pojedynczej "kreski"}
      for i:=1 to 200 do 
        Begin 
          Pen(1,255-i,0,i); 
          for j:=1 to 20 do 
            Begin 
              Line(a+i+(j*2*s)-s,c+i,a+i+(j*2*s),c+i); 
              Line(a+i+(j*2*s)-s,b-i,a+i+(j*2*s),b-i); 
            End; 
          j:=1; 
          Delay(del); {opoznienie animacji}
          info(i,'Cross');
        End;     
      i:=1; 
    End; 
End; 

Procedure kwadrat(x,y,c,del:integer;show_kwadrat:boolean); 
{kwadrat / gwiazda}
var 
   i:integer; 
Begin 
  IF show_kwadrat then {jesli true pokazuje efekt}
    Begin 
      For i:=1 to x-2 do {x-2 pozostawia cienkie czarne linie, animacja sie nie "domyka"}
        begin 
        IF c=1 then
          Pen(1,50+i,0,0) 
        Else IF c=2 then
          Pen(1,0,50+i,0)
        Else
          Pen(1,0,0,50+i);  
          {gora} 
          Line(y-i,y-x,y,y); 
          Line(y+i,y-x,y,y); 
          {dol} 
          Line(y-i,y+x,y,y); 
          Line(y+i,y+x,y,y); 
          {lewy} 
          Line(y-x,y-i,y,y); 
          Line(y-x,y+i,y,y); 
          {prawy} 
          Line(y+x,y-i,y,y); 
          Line(y+x,y+i,y,y); 
          Delay(del); {opoznienie animacji}
        End; 
    End; 
End; 

Procedure czysc(a,b,x,y,del_bet:integer); 
{czysci ekran rysujac Rectangle koloru czarnego o zadanym rozmiarze}
Begin 
  Delay(del_bet); 
  Pen(1,0,0,0); 
  Brush(1,0,0,0); 
  Rectangle (a,b,x,y); 
End; 

Procedure eye(start,stop, przeskok,del:integer;show_eye:boolean); 
{animacja elipsy}
var 
   i,z:integer; 
Begin 
  IF show_eye then {jesli true pokazuje efekt}
    Begin 
      For i:=start to stop do 
        Begin 
          z := i * przeskok; {przeskok = wielkosc zmiany w parametrach elipsy}
          Pen(1,0+i,0+i,50+i); 
          Ellipse(0+(z*2),0+z,600-(z*2),600-z); 
          info(i,'Eye');
          Delay(del); {opoznienie animacji}        
        End; 
    End; 
End; 

Procedure napisy_start(del:integer;show_napisy_start: boolean); 

var i,j:integer;
var z:array [1..4] of string;

Begin 
  IF show_napisy_start then      
    Begin 
      {definiuje tablice z danymi autorow}
      z[1]:='Pawel Choinski';
      z[2]:='Natalia Jaszczuk';
      z[3]:='Iza Olszewska';
      z[4]:='Ania Prokop';

      For i:=1 to 100 do
        Begin
              TextColor(0+(i*2),0,0);
              Moveto(150,150);
              Font(12,0,800);
              Writeln('Szkola Wyzsza Psychologii Spolecznej');          
              Moveto(150,170);              
              Font(9,0,800);              
              Writeln('Spoleczna Psychologia Informatyki i Komunikacji');
              Delay(del);
        End;
        i:=1;    
      For j:=1 to 4 do
      Begin
      {petla wyswietlajaca kolejne nazwika}
        For i:=1 to 60 do
          Begin
                TextColor(0,0,0+(i*3));
                Moveto(200,200+(j*20));              
                Writeln(z[j]);
                Delay(del);
          End;
       End;
    End; 
End; 

Procedure napisy_end(del:integer;show_napisy_end: boolean); 
var i:integer;
Begin 
  IF show_napisy_end then 
    Begin 
      {animacja koncowego 'END'}
       For i:=1 to 120 do
         Begin         
              Font(18,0,800);
              TextColor(0,0,50+i);
              Moveto(270,350-i);            
              Write('END');
              Delay(10);      
         End;
       { i napis 'Dziekujemy! :)'}
              Font(8,0,800);
              TextColor(138, 136, 174);
              Moveto(250,320);            
              Write('Dziekujemy! :)');
              Delay(1000);        
    End; 
End; 

Procedure shadow(x,y,del:integer;show_shadow:boolean);
var i,j,odst:integer;
Begin
   IF show_shadow then
   odst:=200; {odstep pomiedzy poszczegolnymi liniami "laserow"}
     Begin 
       For j:=1 to 600 do
       Begin
         {pierwsza petla rysuje cien w "dol" od zrodla (srodka)}
         For i:=1 to 40 do
         Begin
           Pen(1,0,0,180-(i*4)); 
           Line(y-x,60+i+j,y,y);
           Line(y+x,60+i+j,y,y);           

           Line(y-x,60-odst+i+j,y,y);
           Line(y+x,60-odst+i+j,y,y);           

           Line(y+x,60+odst+i+j,y,y);           
           Line(y-x,60+odst+i+j,y,y);           

           Line(y+x,60+(odst*2)+i+j,y,y);           
           Line(y-x,60+(odst*2)+i+j,y,y);           
         End;
         i:=1;
         {druga petla rysuje cien w "gore" od zrodla (srodka)}
         For i:=1 to 60 do
         Begin
           Pen(1,0,0,0+(i*3)); 
           Line(y-x,0+i+j,y,y);        
           Line(y+x,0+i+j,y,y);           

           Line(y-x,0-odst+i+j,y,y);       
           Line(y+x,0-odst+i+j,y,y);                              

           Line(y-x,0+odst+i+j,y,y);       
           Line(y+x,0+odst+i+j,y,y);       

           Line(y-x,0+(odst*2)+i+j,y,y);       
           Line(y+x,0+(odst*2)+i+j,y,y);       
         End;
         i:=1;
         info(j,'LightSabers');
         Delay(1);     
       End;     
     End;
End;

var 
   del,del_bet:integer; 
   show_kwadrat: boolean; 
   show_cross: boolean; 
   show_eye: boolean; 
   show_napisy_start: boolean; 
   show_napisy_end: boolean; 
   show_shadow: boolean;
Begin 

{kontrola} 
  {true jesli pokazywac efekt}
  show_kwadrat:=true; 
  show_cross:=true; 
  show_eye:=true; 
  show_napisy_start:=true; 
  show_napisy_end:=true; 
  show_shadow:=true;
    
  {opoznienie animacji}
  del:=1; 
  {opoznienie pomiedzy efektami}
  del_bet:=2000; 
  
  
{scenariusz} 
  czysc(0,0,750,750,0); 
  napisy_start(del,show_napisy_start);
  Delay(del_bet);
  czysc(0,0,750,750,0); 
  {kwadrat(400,300,3,del,show_kwadrat); }
  shadow(350,350,del,show_shadow);
  czysc(0,0,750,750,del_bet+2000); 
  {powierzchnia "czyszczenia" x1,y1,x2,y2}
  Delay(del_bet); 
  cross(50,240,40,del,show_cross); 
  {poczatkowy x,poczatkowy y1, poczatkowy y2}
  cross(50,440,240,del,show_cross); 
  cross(50,640,440,del,show_cross); 
  {x,y1,y2,delay} 
  czysc(0,0,750,750,del_bet); 
  kwadrat(1200,500,1,0,show_kwadrat); 
  {promien "wodzacy",srodek,delay} 
  czysc(0,0,750,750,del_bet+2000); 
  eye(0,205,1,del,show_eye);
  napisy_end(del,show_napisy_end);
  kwadrat(70,300,3,del,show_kwadrat);
    
  {

wykorzystano:
    Pen
    Line
    Brush
    Rectangle
    Ellipse  
    TextColor
    Moveto
    Font

kontrola:

    Linijki od 333 do 338 pozwalaja na zdefiniowanie, ktory
    z efektow ma sie pojawiac, a ktory nie. Wystarczy zmieniac
    wartosci true/false. Zmienna 'del' (line: 242) definiuje
    opoznienie pomiedzy poszczegolnymi klatkami animacji. Zmienna
    'del_bet' okresla czas pomiedzy poszczegolnymi efektami.

znane bledy:

    - licznik w animacji "cross" pokazuje 3x 200 klatek
      (3x wywolanie procedury cross, kazda 200 klatek)
      jednak miejsce wyswietlania nie jest "czyszczone"
      dla tego wartosci nakladaja sie, co sprawia wrazenie
      blednego dzialania licznika. Blad jedynie graficzny!
      Nie naprawiony z powodu braku czasu.

    - czesc danych liczbowych na "sztywno" wpisanych w kod
      jak w przypadku procedury shadow() mozna by zamienic
      na zmienne co dodatkowo zwiekszyloby modyfikowalnosc
      skryptu. Nie porawione z powodu braku czasu.

    - brak optymalizacji procedury shadow(); Skrypt byl pisany
      na ostatnia chwile i zawiera sporo bledow, choc dziala
      poprawnie (ale moglby dzialac szybciej i bardziej poprawnie ;)
    
    - mnogosc petli - zdajemy sobie sprawe z duzej ilosci petli
      wykonujacych ogromna ilosc "obrotow". Niestety nasza wiedza
      nie pozwala na zoptymalizowanie skryptu i ograniczenie ilosci
      powtorzen przy jednoczesnym zachowaniu "poziomu" efektow.
      Pracujemy nad tym ;)
  }
  
end.
