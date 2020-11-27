program Mrowa; 

const 
   bok=230;    {ile pól w poziomie i pionie ma plansza} 
   szer=3;    {ile pixeli ma jedno pole} 
   IleMrowek=4;  {liczba mrowek na planszy} 
   
type 
   pole=integer; 
   Swiat= Array[1..bok, 1..bok] of pole;  {0- bialy (czyli w lewo), 1- czarny (czyli w prawo) } 
   Insekt= record 
        X: integer; 
        Y: integer; 
   end; 
   
   Insekty=Array[1..IleMrowek] of Insekt; 
   Kierunki=Array[1..IleMrowek] of integer; 
   
var 
   NaszeKierunki:Kierunki; 
   i,j: integer; 
   NaszSwiat:Swiat; 
   Mrowki:Insekty; 
   iteracja:integer; 

Procedure Start(var TenSwiat:Swiat; var Ants:Insekty; var TeKierunki:Kierunki); 
var 
   i,j:integer; 
begin 
  for i:=1 to bok do 
    for j:=1 to bok do 
      TenSwiat[i,j]:=0; 
  for i:=1 to IleMrowek do 
    begin 
      Ants[i].X:=random(bok)+1; 
      Ants[i].Y:=random(bok)+1; 
      TeKierunki[i]:=random(4); 
    end; 
  brush(1,255,255,255); 
  rectangle(0,0, (bok)*szer, (bok)*szer); 
end; 

Procedure Krok(var TenSwiat:Swiat; var ants:insekty; var TeKierunki:Kierunki); 
var 
   x,y,x1,y1:integer; 
begin 
  for i:=1 to IleMrowek do 
    begin 
      TenSwiat[Ants[i].X,Ants[i].Y]:=1-TenSwiat[Ants[i].X,Ants[i].Y]; 
      if TeKierunki[i] mod 2=0 then 
      {czyli prawo, lewo} 
        Ants[i].X:=Ants[i].X-(TeKierunki[i]-1)
        {gdy bylo prawo, dodajemy 1, gdy bylo lewo - odejmujemy 1} 
      else 
        {czyli gora, dol} 
        Ants[i].Y:=Ants[i].Y+(TeKierunki[i]-2); 
      {gdy byla gora, odejmujemy 1, gdy bylo dol - dodajemy 1} 
      if Ants[i].X=0 then 
        Ants[i].X:=bok; 
      if Ants[i].X=bok+1 then 
        Ants[i].X:=1; 
      if Ants[i].Y=0 then 
        Ants[i].Y:=bok; 
      if Ants[i].Y=bok+1 then 
        Ants[i].Y:=1; 
      if TenSwiat[Ants[i].X, Ants[i].Y]=0 then 
        begin 
          pen(1,0,0,0); 
          brush(1,0,0,0); 
          rectangle((Ants[i].X-1)*szer, (Ants[i].Y-1)*szer, Ants[i].X*szer, Ants[i].Y*szer); 
          TeKierunki[i]:=(TeKierunki[i]+1) mod 4; 
        end 
      else 
        begin 
          pen(1,255,255,255); 
          brush(1,255,255,255); 
          rectangle((Ants[i].X-1)*szer, (Ants[i].Y-1)*szer, Ants[i].X*szer, Ants[i].Y*szer); 
          TeKierunki[i]:=((TeKierunki[i]-1)+4) mod 4; 
        end; 
    end; 
end; 

{program g³ówny} 
BEGIN 
  Start(NaszSwiat,mrowki,NaszeKierunki); 
  iteracja:=0; 
  Repeat 
    Krok(NaszSwiat, Mrowki, NaszeKierunki); 
    iteracja:=iteracja+1; 
    MoveTo(0,bok*szer+10); 
    Brush(0,0,0,0); 
    writeln('Krok numer ',iteracja); 
    {  delay(1);} 
  Until IsEvent 
END.
