program sym_roslin; 
{uproszczony model wzrostu, i rozsiania siê dwóch gatunków (tylko dla tylu bêdzie dzia³a³) roœlin ró¿ni¹cych sie zawartoœci¹ chlorofilu (¿yj¹cych do czasu rozsiewu) 
w zale¿nosci od nawodnienia nas³onecznienia terenu i zawartoœci chlorofilu (ró¿nej u obu gatunków)
Zespó³ w sk³adzie:
Katarzyna Chaciñska
Anna Ciecierska
Marcin Go³aszewski
Filip Latawiec
Agata Pasikowska} 

type 
   parametr=record 
        zajeta:boolean; 
        rasa: integer; 
        slonce:real; 
        woda:real; 
        chlorofil:real; 
        wzrost:real; 
   end; 

const 
   rozmiar=30; 
   {rozmiar pola} 
   ile_gat=3; 
   {ile gatunków kwiatów -1}
   czas_wzrost=10;
   {po jakim czasie roœlinka sie rozsieje}
   side=18; 

type 
   swiat=array[1..rozmiar,1..rozmiar]of parametr; 
var 
   gatunek1,gatunek2:integer; 

procedure rozsiew(var tab:swiat); 

var 
   i,j:integer; 
begin 
  for i:=1 to rozmiar do 
    for j:=1 to rozmiar do 
      begin 
        if i<=(rozmiar/2) then 
          begin 
            tab[i,j].woda:=((random(6)+5)/10); 
            tab[i,j].slonce:=random(6)/10 ; 
          end 
          {wyzsze nawodnienie 
          dla pierwszej po³owy pola,ni¿sze nas³onecznienie} 
        else 
          begin 
            tab[i,j].woda:=random(6)/10; 
            tab[i,j].slonce:=((random(6)+5)/10) 
            {ni¿sze nawodnienie 
                      dla drugiej po³owy pola, wiêksze nas³onecznienie} 
          end; 
        tab[i,j].rasa:=random(ile_gat); 
        if tab[i,j].rasa <> 0 then 
          begin 
            tab[i,j].zajeta:=true; 
            tab[i,j].wzrost:=0; 
            {ustawia w pierwszym kroku 0-owy 
                      wzrost} 
          end; 
        if tab[i,j].rasa=1 then 
          tab[i,j].chlorofil:=((random(6)+5)/10); 
        {duzo chlorofilu dla 1 rasy} 
        if tab[i,j].rasa=2 then 
          tab[i,j].chlorofil:=random(6)/10; 
        {ma³o chlorofilu dla 2 rasy} 
        if tab[i,j].rasa=0 then 
          begin 
            tab[i,j].zajeta:=false; 
            tab[i,j].chlorofil:=0; 
          end; 
      end; 
end; 

procedure wzrost(var tab:swiat); 
{na zasadzie uproszczonej fotosyntezy przy 
wykorzystaniu istniejacych warunków} 

var 
   i,j:integer; 
   suma:real; 
begin 
  gatunek1:=0; 
  gatunek2:=0; 
  for i:=1 to rozmiar do 
    for j:=1 to rozmiar do 
      begin 
        if tab[i,j].zajeta then 
          begin 
            suma:=(6*tab[i,j].woda+tab[i,j].slonce+tab[i,j].chlorofil)/10; 
            tab[i,j].wzrost:=tab[i,j].wzrost + suma; 
          end; 
      end; 
end; 
procedure przejscie(var tab:swiat); 

var 
   i,j:integer; 
begin 
  for i:=2 to rozmiar-1 do 
    for j:=2 to rozmiar-1 do 
      begin 
        if tab[i,j].rasa <> 0 then 
          tab[i,j].zajeta:=true 
        else 
          tab[i,j].zajeta:=false; 
        if tab[i,j].zajeta=true then 
          begin 
            if tab[i,j].wzrost>czas_wzrost then {œredni czas wzrostu do rozsiania bedzie siê wacha³ w okolicach 10 tygodni}
              begin 
                {dla s¹siedztwa typu Moora} 
                if tab[i,j].rasa=1 then 
                {ma pierwszeñstwo w rozsianiu siê,
                 gdy¿ ta rasa ma wiêcej chlorofilu, wiêc szybciej wzejdzie} 
                  begin 
                    if tab[i+1,j].zajeta=false then 
                      begin 
                        tab[i+1,j].rasa:=1; 
                        tab[i+1,j].chlorofil:=((random(6)+5)/10); 
                        tab[i+1,j].zajeta:=true 
                      end; 
                    if tab[i-1,j].zajeta=false then 
                      begin 
                        tab[i-1,j].rasa:=1; 
                        tab[i-1,j].chlorofil:=((random(6)+5)/10); 
                        tab[i-1,j].zajeta:=true; 
                      end; 
                    if tab[i,j+1].zajeta=false then 
                      begin 
                        tab[i,j+1].rasa:=1; 
                        tab[i,j+1].chlorofil:=((random(6)+5)/10); 
                        tab[i,j+1].zajeta:=true; 
                      end; 
                    if tab[i,j-1].zajeta=false then 
                      begin 
                        tab[i,j-1].rasa:=1; 
                        tab[i,j-1].chlorofil:=((random(6)+5)/10); 
                        tab[i,j-1].zajeta:=true; 
                      end; 
                    if tab[i+1,j+1].zajeta=false then 
                      begin 
                        tab[i+1,j+1].rasa:=1; 
                        tab[i+1,j+1].chlorofil:=((random(6)+5)/10); 
                        tab[i+1,j+1].zajeta:=true; 
                      end; 
                    if tab[i-1,j-1].zajeta=false then 
                      begin 
                        tab[i-1,j-1].rasa:=1; 
                        tab[i-1,j-1].chlorofil:=((random(6)+5)/10); 
                        tab[i-1,j-1].zajeta:=true; 
                      end; 
                    if tab[i-1,j+1].zajeta=false then 
                      begin 
                        tab[i-1,j+1].rasa:=1; 
                        tab[i-1,j+1].chlorofil:=((random(6)+5)/10); 
                        tab[i-1,j+1].zajeta:=true; 
                      end; 
                    if tab[i+1,j-1].zajeta=false then 
                      begin 
                        tab[i+1,j-1].rasa:=1; 
                        tab[i+1,j-1].chlorofil:=((random(6)+5)/10); 
                        tab[i+1,j-1].zajeta:=true; 
                      end; 
                  end; 
if tab[i,j].rasa=2 then 
                  begin 
                    if tab[i+1,j].zajeta=false then 
                      begin 
                        tab[i+1,j].rasa:=2; 
                        tab[i+1,j].chlorofil:=random(6)/10; 
                        tab[i+1,j].zajeta:=true 
                      end; 
                    if tab[i-1,j].zajeta=false then 
                      begin 
                        tab[i-1,j].rasa:=2; 
                        tab[i-1,j].chlorofil:=random(6)/10; 
                        tab[i-1,j].zajeta:=true; 
                      end; 
                    if tab[i,j+1].zajeta=false then 
                      begin 
                        tab[i,j+1].rasa:=2; 
                        tab[i,j+1].chlorofil:=random(6)/10; 
                        tab[i,j+1].zajeta:=true; 
                      end; 
                    if tab[i,j-1].zajeta=false then 
                      begin 
                        tab[i,j-1].rasa:=2; 
                        tab[i,j-1].chlorofil:=random(6)/10; 
                        tab[i,j-1].zajeta:=true; 
                      end; 
                    if tab[i+1,j+1].zajeta=false then 
                      begin 
                        tab[i+1,j+1].rasa:=2; 
                        tab[i+1,j+1].chlorofil:=random(6)/10; 
                        tab[i+1,j+1].zajeta:=true; 
                      end; 
                    if tab[i-1,j-1].zajeta=false then 
                      begin 
                        tab[i-1,j-1].rasa:=2; 
                        tab[i-1,j-1].chlorofil:=random(6)/10; 
                        tab[i-1,j-1].zajeta:=true; 
                      end; 
                    if tab[i-1,j+1].zajeta=false then 
                      begin 
                        tab[i-1,j+1].rasa:=2; 
                        tab[i-1,j+1].chlorofil:=random(6)/10; 
                        tab[i-1,j+1].zajeta:=true; 
                      end; 
                    if tab[i+1,j-1].zajeta=false then 
                      begin 
                        tab[i+1,j-1].rasa:=2; 
                        tab[i+1,j-1].chlorofil:=random(6)/10; 
                        tab[i+1,j-1].zajeta:=true;
                      end; 
                  end; 
                tab[i,j].wzrost:=0; 
                tab[i,j].chlorofil:=0; 
                tab[i,j].rasa:=0; 
              end; 
          end; 
        if tab[i,j].rasa=1 then 
          gatunek1:=gatunek1+1; 
        if tab[i,j].rasa=2 then 
          gatunek2:=gatunek2+1; 
      end; 
end; 
procedure ChangeBorder(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Pen(2,0,round(v),0); 
end; 

procedure ChangeFill(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  Brush(1,round(v*0.7),round(v*0.3),round(v*0.3)); 
end; 

var 
   œwiat:swiat; 
   icznik:integer; 

procedure rysuj(var Tab:swiat;x,y,side:integer); 
{Rysuje œwiat za pomoc¹ elips pokazuj¹cych gatunek i iloœæ chlorofilu(obwódka) 
dodatkowo pokazuje gdzie jest wieksze œrednie nawodnienie, a gdzie jest wiecej s³oñca} 

var 
   i,j:integer; 
begin 
  for i:=1 to rozmiar do 
    for j:=1 to rozmiar do 
      if Tab[i,j].zajeta then 
        begin 
          ChangeBorder(Tab[i,j].chlorofil,0,1); 
          ChangeFill(Tab[i,j].rasa,0,ile_gat-1); 
          ellipse(x+i*side-side,y+j*side-side, x+i*side,y+j*side); 
        end 
      else 
        begin 
          Brush(1,255,255,255); 
          Pen(1,255,255,255); 
          rectangle(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
        end; 
end; 

var 
   pole:swiat; 
   licznik:integer; 
   f:text; 

begin 
  brush(1,0,222,250); 
  Rectangle( 1,1,round((30+rozmiar*side-side)/2),30+rozmiar*side); 
  brush(1,253,250,104); 
  Rectangle(round((30+rozmiar*side-side)/2),1,30+rozmiar*side,30+rozmiar*side); 
  licznik:=0; 
  rozsiew(pole); 
  assign(f,'ekosystem.xls'); 
  rewrite(f); 
  writeln(f,'Prosty ekosystem dwóch roœlin na polu o rozmiarach',rozmiar*rozmiar); 
  writeln(f, 'rozmiar=',rozmiar*rozmiar,'chlorofil gatunku 1= <0.5,1> gatunku 2=<0,05>'); 
  writeln(f,'lepiej nawodniony teren H2O=<0,5,1> gorzej nawodniony H2O=<0,0,5>'); 
  writeln(f,'lepiej nas³oneczniny teren energia=<0,5,1> gorzej nas³oneczniony = <0,0,5>'); 
  writeln(f,'tydzieñ',chr(9),'gatunek 1',chr(9),'gatunek 2'); 
  repeat 
    rysuj(pole,10,10,side); 
    brush(1,1,1,1); 
    {Rectangle( 10,10,side+10 ,side*rozmiar+10 ); 
    Rectangle(10 ,26 ,side*rozmiar+10 ,10 ); 
    Rectangle(10,side*rozmiar-5, side*rozmiar+10, side*rozmiar+10); 
    Rectangle(side*rozmiar-7 ,side*rozmiar+10 ,side*rozmiar+10 ,10); }
    wzrost(pole); 
    przejscie(pole); 
    licznik:=licznik+1; 
    moveto(2,580); 
    brush(1,128,98,32); 
    Pen(15 ,13,255,55); 
    font(11,0,800); 
    Writeln('Prosty ekosystem dwóch roœlin'); 
    brush(1,255,255,255); 
    font(9,0,300); 
    write('tydzien '); 
    writeln(licznik,'                      LEGENDA'); 
    writeln('roœlin 1: ',gatunek1,'     kolor niebieski-lepsze nawodnienie'); 
    writeln('roœlin 2: ',gatunek2, '     kolor ¿ó³ty - lepsze nas³onecznienie'); 
    writeln('                  czarna roœlinka - rozsiewajaca sie'); 
    writeln(f,licznik,chr(9),gatunek1,chr(9),gatunek2); 
  until isEvent; 
  close (f); 
end.
