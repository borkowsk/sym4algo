Program mrowkaLangtona; 
{
Program napisany przez £ukasza Jochemczyka na zajêciach 
Praktyczne Aspekty Modelowania prowadzonych w ISS w 2006 r.
}
const 
   Rozmiar=150; 
   Prostokat=4; 
Type 
   Pole=integer; 
var 
   Licznik:integer; 
   Swiat: array [1..Rozmiar,1..Rozmiar] of Pole; 
   Intensywnosc: array [1..Rozmiar,1..Rozmiar] of Pole; 
   
   Mrowka: record 
        x:integer; 
        y:integer; 
        ruch:integer; 
        {1-prawo, 2-dó³, 3-lewo, 4-gora} 
   end; 
   {-------------------------------------------------} 

Procedure Start; 

var 
   i,j:integer; 
begin 
  Licznik:=0; 
  Mrowka.x:=Rozmiar div 2; 
  Mrowka.y:=Rozmiar div 2; 
  Mrowka.Ruch:=1; 
  for i:=1 to Rozmiar do 
    begin 
      for j:=1 to Rozmiar do 
        begin 
          Swiat[i,j]:=0; 
        end; 
    end; 
  for i:=1 to Rozmiar do 
    begin 
      for j:=1 to Rozmiar do 
        begin 
          Intensywnosc[i,j]:=0; 
        end; 
    end; 
end; 
{-------------------------------------------------} 
{} 

Procedure Rysuj; 

var 
   i,j:integer; 
begin 
  for i:=1 to Rozmiar do 
    for j:=1 to Rozmiar do 
      begin 
        if Swiat[i,j]=0 then 
          begin 
            Brush(1,255,255- Intensywnosc[i,j], 255); 
            Rectangle(Prostokat*i,Prostokat*j,Prostokat*i+Prostokat,Prostokat*j+Prostokat); 
          end 
        else 
          begin 
            Brush(1,0, 0, Intensywnosc[i,j]); 
            Rectangle(Prostokat*i,Prostokat*j,Prostokat*i+Prostokat,Prostokat*j+Prostokat); 
          end; 
      end; 
end; 
{-------------------------------------------------} 

Procedure Odswiez(x,y:integer); 

var 
   kolor:integer; 
begin 
  kolor:=0; 
  if Intensywnosc[x,y]<255 then 
    kolor:=Intensywnosc[x,y] 
  else 
    kolor:=255; 
  if Swiat[x,y]=0 then 
    begin 
      Brush(1,255,255-kolor, 255); 
      Rectangle(Prostokat*x,Prostokat*y,Prostokat*x+Prostokat,Prostokat*y+Prostokat); 
    end 
  else 
    begin 
      Brush(1,0, 0, kolor); 
      Rectangle(Prostokat*x,Prostokat*y,Prostokat*x+Prostokat,Prostokat*y+Prostokat); 
    end; 
end; 
{-------------------------------------------------} 

Procedure RuszSie; 
{jesli pole jest '0', to skreca w lewo; jesli pole jest '1', to skreca w prawo} 

begin 
  if Swiat[Mrowka.x,Mrowka.y]=0 then 
    Swiat[Mrowka.x,Mrowka.y]:=1 
  else 
    Swiat[Mrowka.x,Mrowka.y]:=0; 
  Odswiez(Mrowka.x,Mrowka.y); 
  case Mrowka.Ruch of 
    1: 
      Mrowka.x:=Mrowka.x+1; 
    2: 
      Mrowka.y:=Mrowka.y-1; 
    3: 
      Mrowka.x:=Mrowka.x-1; 
    4: 
      Mrowka.y:=Mrowka.y+1; 
  end; 
  if Mrowka.x>Rozmiar then 
    Mrowka.x:=1; 
  if Mrowka.x<1 then 
    Mrowka.x:=Rozmiar; 
  if Mrowka.y>Rozmiar then 
    Mrowka.y:=1; 
  if Mrowka.y<1 then 
    Mrowka.y:=Rozmiar; 
  if Swiat[Mrowka.x,Mrowka.y]=0 then 
    Mrowka.Ruch:=Mrowka.Ruch-1 
  else 
    Mrowka.Ruch:=Mrowka.Ruch+1; 
  If Mrowka.Ruch>4 then 
    Mrowka.Ruch:=Mrowka.Ruch-4; 
  If Mrowka.Ruch<1 then 
    Mrowka.Ruch:=4; 
  Intensywnosc[Mrowka.x,Mrowka.y]:=Intensywnosc[Mrowka.x,Mrowka.y]+1; 
end; 
{-------------------------------------------------} 

Procedure ZapiszTablice; 

var 
   i,j,margines:integer; 
begin 
  margines:=Rozmiar*Prostokat; 
  for i:=1 to Rozmiar do 
    for j:=1 to Rozmiar do 
      begin 
        MoveTo(i*20,margines+j*20); 
        Write(Intensywnosc[i,j]); 
      end; 
end; 
{-------------------------------------------------} 
begin 
  Start; 
  Rysuj; 
  Repeat 
    RuszSie; 
    Licznik:=Licznik+1; 
  until IsEvent; 
 { ZapiszTablice; }
end.
