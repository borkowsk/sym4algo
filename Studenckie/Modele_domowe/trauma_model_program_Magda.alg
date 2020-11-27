program magda;

type
  element=record
   ladunek:boolean;
   kolor:integer;
end;

type
  color=record
    r:integer;
    g:integer;
    b:integer;
end;

const
  SZEROKOSC=100;
  WYSOKOSC=100;

  ROZMIAR_KWADRATU=8;
  ROZM_KWADRAT_NEGAT=1;

  POZYTYWNY=true;
  NEGATYWNY=false;

  LICZBA_LOSOWAN=100;


var
Macierz:array[1..SZEROKOSC,1..WYSOKOSC] of element;
kolory:array[1..11]of color;


procedure Inicjalizacja;

var
  j,i:integer;


begin
  {rysowanie t^(3)a}
  brush(1,0,0,0);
  Rectangle(0,0,ROZMIAR_KWADRATU*(SZEROKOSC+2),ROZMIAR_KWADRATU*(WYSOKOSC+2));

  {przygotuj odcienie}
    for i:=1 to 5 do
      begin
      kolory[i].r:=255;
      kolory[i+6].r:=255-i*51;
      kolory[i].g:=0;
      kolory[i+6].g:=0;
      kolory[i].b:=255-(6-i)*51;
      kolory[i+6].b:=255;
    end;

{kolor srodkowy}
kolory[6].r:=255;
kolory[6].g:=0;
kolory[6].b:=255;

{inicjalizacja macierzy}

for i:=1 to SZEROKOSC do
  for j:=1 to WYSOKOSC do
    begin
      Macierz[i,j].kolor:=1+random(11);
      if random(10)>3 then {KUBA: TU EWENTUALNIE ZMIENIASZ POCZ¥TKOWE PROPORCJE DOŒWIADCZEÑ - POZYTYWNE/NEGATYWNE}
         Macierz[i,j].ladunek:=POZYTYWNY
       else
         Macierz[i,j].ladunek:=NEGATYWNY;
    end;
end;


Procedure RysujMacierz;

var
i,j:integer;

begin
  for i:=1 to SZEROKOSC do
    for j:=1 to WYSOKOSC do
     begin
       {czyscimy miejsce na nowy kwadracik}
       brush(1,255,255,255);
       pen(0,255,255,255);
       Rectangle(i*ROZMIAR_KWADRATU,j*ROZMIAR_KWADRATU,(i+1)*ROZMIAR_KWADRATU,(j+1) *ROZMIAR_KWADRATU);
       {zmiana koloru pedzla}
       brush(1,kolory[Macierz[i,j].kolor].r,kolory[Macierz[i,j].kolor].g,kolory[Macierz[i,j].kolor].b);
       {w zaleznosci od ladunku, rysujemy maly albo duzy kwadracik}
       if Macierz[i,j].ladunek=POZYTYWNY then
          Rectangle(i*ROZMIAR_KWADRATU,j*ROZMIAR_KWADRATU,(i+1)*ROZMIAR_KWADRATU,(j+1)*ROZMIAR_KWADRATU)
       else
          Rectangle(i*ROZMIAR_KWADRATU+ROZM_KWADRAT_NEGAT,j*ROZMIAR_KWADRATU+ROZM_KWADRAT_NEGAT,i*ROZMIAR_KWADRATU+ROZMIAR_KWADRATU-ROZM_KWADRAT_NEGAT,j*ROZMIAR_KWADRATU+ROZMIAR_KWADRATU-ROZM_KWADRAT_NEGAT)
     end;
end;

procedure PrzetworzMacierz;

var
i,j,iteracja:integer;
licznik:integer;
srednia:real;
roznica:real;

begin

  for iteracja:=1 to LICZBA_LOSOWAN do
   begin
     {losujemy kwadracik}
     i:=1+random(100);
     j:=1+random(100);

     licznik:=0;  {zerujemy licznik sasiadow}

    {sprawdzamy ladunki sasiadow
     nalezy rozpatrzyc kilka przypadkow, w zaleznosci od tego czy znajdujemy sie
     w srodku macierzy czy z brzegu}

     if ((i>1)) and (j>1) and (i<SZEROKOSC) and (j <WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi wschodni}
       if Macierz[i+1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end
     else if (i=1) and (j>1) and (j<WYSOKOSC) then
      begin
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi wschodni}
       if Macierz[i+1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end
     else if (j=1) and (i>1) and (i<WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi wschodni}
       if Macierz[i+1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end
     else if (i=SZEROKOSC) and (j>1) and (j<WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi wschodni}
      end
     else if (j=WYSOKOSC) and (i>1) and (i<SZEROKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi wschodni}

if Macierz[i+1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end
     else if (i=1) and (j=1) then
      begin
       {sasiedzi zachodni}
       {sasiedzi polnoc poludnie}
       if Macierz[i,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi wschodni}
       if Macierz[i+1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end
     else if (i=1) and (j=WYSOKOSC) then
      begin
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi wschodni}
       if Macierz[i+1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i+1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end
     else if (i=SZEROKOSC) and (j=1) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j+1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end
     else if (i=SZEROKOSC) and (j=WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       if Macierz[i-1,j].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].ladunek<>Macierz[i,j].ladunek then licznik:=licznik+1;
      end;

     if licznik>4 then
       if Macierz[i,j].ladunek=POZYTYWNY then
         Macierz[i,j].ladunek:=NEGATYWNY
       else
         Macierz[i,j].ladunek:=POZYTYWNY;


     {KONIEC PRZETWARZANIA LADUNKOW SASIADOW}

     {przetwarzamy kolory sasiadow}
     licznik:=0;
     srednia:=0;

     if ((i>1)) and (j>1) and (i<SZEROKOSC) and (j <WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i-1,j-1].kolor;
       srednia:=srednia+Macierz[i-1,j].kolor;
       srednia:=srednia+Macierz[i-1,j +1].kolor;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j-1].kolor;
       srednia:=srednia+Macierz[i,j+1].kolor;
       {sasiedzi wschodni}
       if Macierz[i+1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j].kolor<>Macierz [i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i+1,j-1].kolor;
       srednia:=srednia+Macierz[i+1,j].kolor;
       srednia:=srednia+Macierz[i+1,j+1].kolor;

       srednia:=srednia/8;
      end
     else if (i=1) and (j>1) and (j<WYSOKOSC) then
      begin
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].kolor<>Macierz [i,j].kolor then licznik:=licznik+1;
       if Macierz[i,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j-1].kolor;
       srednia:=srednia+Macierz[i,j+1].kolor;
       {sasiedzi wschodni}
       if Macierz[i+1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i+1,j-1].kolor;
       srednia:=srednia+Macierz[i+1,j].kolor;
       srednia:=srednia+Macierz[i+1,j+1].kolor;

       srednia:=srednia/5;
      end
     else if (j=1) and (i>1) and (i<WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i-1,j].kolor;
       srednia:=srednia+Macierz[i-1,j+1].kolor;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j+1].kolor<>Macierz [i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j+1].kolor;

{sasiedzi wschodni}
       if Macierz[i+1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i+1,j].kolor;
       srednia:=srednia+Macierz[i+1,j+1].kolor;

       srednia:=srednia/5;
      end
     else if (i=SZEROKOSC) and (j>1) and (j<WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i-1,j-1].kolor;
       srednia:=srednia+Macierz[i-1,j].kolor;
       srednia:=srednia+Macierz[i-1,j +1].kolor;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j-1].kolor;
       srednia:=srednia+Macierz[i,j+1].kolor;
       {sasiedzi wschodni}

        srednia:=srednia/5;
      end
     else if (j=WYSOKOSC) and (i>1) and (i<SZEROKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i-1,j-1].kolor;
       srednia:=srednia+Macierz[i-1,j].kolor;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j-1].kolor;
       {sasiedzi wschodni}
       if Macierz[i+1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i+1,j-1].kolor;
       srednia:=srednia+Macierz[i+1,j].kolor;

       srednia:=srednia/5;
      end
     else if (i=1) and (j=1) then
      begin
       {sasiedzi zachodni}
       {sasiedzi polnoc poludnie}
       if Macierz[i,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j+1].kolor;
       {sasiedzi wschodni}
       if Macierz[i+1,j].kolor<>Macierz [i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i+1,j].kolor;
       srednia:=srednia+Macierz[i+1,j+1].kolor;

       srednia:=srednia/3;
      end
     else if (i=1) and (j=WYSOKOSC) then
      begin
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j-1].kolor;
       {sasiedzi wschodni}
       if Macierz[i+1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i+1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i+1,j-1].kolor;
       srednia:=srednia+Macierz[i+1,j].kolor;

       srednia:=srednia/3;
      end
     else if (i=SZEROKOSC) and (j=1) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i-1,j].kolor;
       srednia:=srednia+Macierz[i-1,j+1].kolor;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j+1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j+1].kolor;

       srednia:=srednia/3;
      end
     else if (i=SZEROKOSC) and (j=WYSOKOSC) then
      begin
       {sasiedzi zachodni}
       if Macierz[i-1,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       if Macierz[i-1,j].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i-1,j-1].kolor;
       srednia:=srednia+Macierz[i-1,j].kolor;
       {sasiedzi polnoc poludnie}
       if Macierz[i,j-1].kolor<>Macierz[i,j].kolor then licznik:=licznik+1;
       srednia:=srednia+Macierz[i,j-1].kolor;

       srednia:=srednia/3;
      end;

      roznica:=Macierz[i,j].kolor -srednia;

{zmieniamy kolory kwadratow}
      if (roznica>=1) and (roznica <5) then
        Macierz[i,j].kolor:=Macierz[i,j].kolor+1
      else if (roznica>=5) and (roznica <8) then
        Macierz[i,j].kolor:=Macierz[i,j].kolor+2
      else if (roznica>=8) then
        Macierz[i,j].kolor:=Macierz[i,j].kolor+3
      else if (roznica >-5)and (roznica<=-1) then
        Macierz[i,j].kolor:=Macierz[i ,j].kolor-1
      else if (roznica >-8) and (roznica<=-5) then
        Macierz[i,j].kolor:=Macierz[i,j].kolor-2
      else if (roznica<=-8) then
        Macierz[i,j].kolor:=Macierz[i,j].kolor-3;

      {na koniec sprawdzamy, czy zmiana nie wyszla pozazakres 1..11}
      if Macierz[i,j].kolor<1 then
         Macierz[i,j].kolor:=1
      else if Macierz[i,j].kolor>11 then
         Macierz[i,j].kolor:=11;


  end;

end;

procedure DodajNegatywne; 

var 
   j,i,licznik,tra:integer; 
   x:text; 
begin 
  brush(1,0,0,0); 
  Rectangle(0,0,ROZMIAR_KWADRATU*(SZEROKOSC+2),ROZMIAR_KWADRATU*(WYSOKOSC+2)); 
  {przygotuj odcienie} 
  for i:=1 to 5 do 
    begin 
      kolory[i].r:=255; 
      kolory[i+6].r:=255-i*51; 
      kolory[i].g:=0; 
      kolory[i+6].g:=0; 
      kolory[i].b:=255-(6-i)*51; 
      kolory[i+6].b:=255; 
    end; 
  {kolor srodkowy} 
  kolory[6].r:=255; 
  kolory[6].g:=0; 
  kolory[6].b:=255; 
  {inicjalizacja macierzy} 
  licznik:=0; 
  i:=0; 
  j:=0; 
 tra:=0; 
  {przenosimy kursor na dol, zeby wypisac tekst w odpowiednim miejscu} 
  moveto(0,ROZMIAR_KWADRATU*(WYSOKOSC+3)); 
  {czyscimy miejsce na nowy napis} 
  brush(1,255,255,255); 
  pen(0,255,255,255); 
  Rectangle(0,ROZMIAR_KWADRATU*(WYSOKOSC+2),ROZMIAR_KWADRATU*(SZEROKOSC+2),ROZMIAR_KWADRATU*(SZEROKOSC+320)); 
  moveto(0,ROZMIAR_KWADRATU*(WYSOKOSC+3)); 
  {zmiana koloru pedzla} 
  pen(1,0,0,0); 
  brush(1,255,255,255); 
  writeln('Proszê wybraæ si³ê traumy, wpisuj¹c liczbê z zakresu 1000 - 9000'); 
  readln(tra);
  for licznik:=0 to tra do 
    begin 
      i:=random(100)+1; 
      j:=random(100)+1; 
      Macierz[i,j].kolor:=1+random(5); 
      Macierz[i,j].ladunek:=NEGATYWNY; 
    end; 
  {czyscimy miejsce na nowy napis} 
  brush(1,255,255,255); 
  pen(0,255,255,255); 
  Rectangle(0,ROZMIAR_KWADRATU*(WYSOKOSC+2),ROZMIAR_KWADRATU*(SZEROKOSC+2),ROZMIAR_KWADRATU*(SZEROKOSC+320)); 
  moveto(0,ROZMIAR_KWADRATU*(WYSOKOSC+3)); 
  {zmiana koloru pedzla} 
  pen(1,0,0,0); 
  brush(1,255,255,255); 
  writeln('Wprowadzono subiektywnie wa¿ne doœwiadczenie negatywne.'); 
end; 



procedure ZapiszDoPliku(plik:text;przejscie:integer);

var
fioletowych:integer;
czerwonych:integer;
niebieskich:integer;
pozytywnych:integer;
i,j:integer;

begin
{zerujemy liczniki}
fioletowych:=0;
czerwonych:=0;
niebieskich:=0;
pozytywnych:=0;

{przechodzimy cala macierz}
  for i:=1 to SZEROKOSC do
   for j:=1 to WYSOKOSC do
    begin
     if Macierz[i,j].kolor<6 then
        czerwonych:=czerwonych+1
     else if Macierz[i,j].kolor=6 then
        fioletowych:=fioletowych+1
     else if Macierz[i,j].kolor>6 then
        niebieskich:=niebieskich+1;

     if Macierz[i,j].ladunek=POZYTYWNY then
        pozytywnych:=pozytywnych+1;
    end;
  {zapisywanie danych do pliku}

  writeln(plik,przejscie,';',czerwonych,';',niebieskich,'; ',fioletowych,';',pozytywnych);

end;


var
iteracja:integer;
f:text;
k,x,y:integer;
koniec:boolean;
koniec2:boolean;
tra:integer; 



begin 
  iteracja:=0; 
  koniec:=false; 
  koniec2:=false; 
  {otwieramy plik} 
  assign(f , 'c:\dane.csv'); 
  rewrite(f); 
  {zapisujemy w nim naglowki} 
  writeln(f,'iteracja;czerwonych;niebieskich;fioletowych;pozytywnych'); 
  Inicjalizacja; 
  ZapiszDoPliku(f,iteracja); 
  RysujMacierz; 
  repeat 
    iteracja:=iteracja+1; 
    PrzetworzMacierz; 
    ZapiszDoPliku(f,iteracja); 
    {przenosimy kursor na dol, zeby wypisac tekst w odpowiednim miejscu} 
    moveto(0,ROZMIAR_KWADRATU*(WYSOKOSC+3)); 
    pen(1,0,0,0); 
    brush(1,255,255,255); 
    writeln('Iteracja: ',iteracja); 
    writeln('Kliknij myszk¹, ¿eby odswie¿yæ'); 
    write('Nacisnij dowolny klawisz, aby wprowadziæ doœwiadczenie traumatyczne.'); 
    {sprawdzamy, czy mamy odswiezyc ekran, albo zakonczyc dzialanie} 
    if isevent then 
      begin 
        event(k,x,y); 
        if (k=2) or (k=3) then 
          RysujMacierz 
        else 
          koniec:=true; 
      end; 
  until koniec; 
   DodajNegatywne; 
  RysujMacierz; 
  repeat 
    iteracja:=iteracja+1; 
    PrzetworzMacierz; 
    ZapiszDoPliku(f,iteracja); 
    {przenosimy kursor na dol, zeby wypisac tekst w odpowiednim miejscu} 
    moveto(0,ROZMIAR_KWADRATU*(WYSOKOSC+6)); 
    pen(1,0,0,0); 
    brush(1,255,255,255); 
    writeln('Iteracja: ',iteracja); 
    writeln('Kliknij myszk¹, ¿eby odswie¿yæ'); 
    write('Nacisnij dowolny klawisz, aby zakoñczyæ dzia³anie programu.'); 
    {sprawdzamy, czy mamy odswiezyc ekran, albo zakonczyc dzialanie} 
    if isevent then 
      begin 
        event(k,x,y); 
        if (k=2) or (k=3) then 
          RysujMacierz 
        else 
          koniec2:=true; 
      end; 
  until koniec2; 
  close(f); 
end.