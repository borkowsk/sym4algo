{Adam Królikowski,Adam Fidusiewicz,£ukasz Kijak}
Program Kibole; 

type 
   kibic=record 
        agresywny:boolean; 
        znacznik:boolean; 
        podatnosc:real; 
        {podatnosc na stanie sie agresywnym} 
   end; 

   const 
   Last=20; 
   Side=10; 
   ProbAgres=0.025; 
   OdpornoscNaAgres=2; 
   Przesuniecie=80; 
   Przesuniecie_napisow_w_dol=140; 
type 
   world=array[1..Last,1..Last] of kibic; 

procedure Init(var Tab:world); 
{Inicjuje œwiat wg. zadanych parametrów} 

var 
   i,j,k:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      begin 
        Tab[i,j].agresywny:=false; 
        Tab[i,j].znacznik:=false; 
        Tab[i,j].podatnosc:=0; 
        for k:=1 to OdpornoscNaAgres do 
          if Tab[i,j].podatnosc=0 then 
            Tab[i,j].podatnosc:=random 
          else 
            Tab[i,j].podatnosc:=(Tab[i,j].podatnosc)*random; 
      end; 
end; 

procedure ustalanieagresywnych(var Tab:world); 
{losuje kibicow z gory agresywnych} 

var 
   i,j:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      begin 
        if random < ProbAgres then 
          Tab[i,j].agresywny:=true; 
      end; 
end; 

function policzagresywnych(var Tab:world):integer; 
{oblicza aktualna liczbe agresywnych kibicow} 

var 
   ag,i,j:integer; 
begin 
  ag:=0; 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].agresywny then 
        ag:=ag+1; 
  policzagresywnych:=ag; 
end; 
{procedure policzzarazonych(za:integer; var Tab:world);} 
{oblicza aktualna liczbe zarazonych agresja kibicow} 
{
var
  i,j:integer;
begin
 for i:=1 to Last do
   for j:=1 to Last do
     if Tab[i,j].znacznik then
       za:=za+1;
 moveto(10,((Last*Side)+30));
 writeln('Zarazonych kibicow: ', za);
end;} 

procedure zmiennaagresywnych(var Tab:world); 
{zamienia kibicow ze znacznikami na agresywnych} 
var 
   i,j:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].znacznik then 
        Tab[i,j].agresywny:=true; 
end; 

procedure Draw(var Tab:World;x,y,side:integer); 
{rysowanie kibicow} 

var 
   i,j:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].agresywny=false then 
        begin 
          Brush(1,0, 128, 255); 
          Pen(1,255, 255, 255); 
          rectangle((x+i*side-side)+Przesuniecie, (y+j*side-side)+Przesuniecie, (x+i*side)+przesuniecie, (y+j*side)+Przesuniecie); 
        end 
      else 
        begin 
          Brush(1,255, 0, 0); 
          Pen(1,255,255,255); 
          rectangle((x+i*side-side)+Przesuniecie, (y+j*side-side)+Przesuniecie, (x+i*side)+Przesuniecie, (y+j*side)+Przesuniecie); 
        end; 
  Brush(1, 255, 255, 255); 
  Pen(1, 0, 0, 0); 
end; 

procedure sianieagresji(var Tab:world); 
{procedura rozprzestrzeniania agresji wsrod kibicow } 

var 
   i,j:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      begin 
        if (((i-1)>0) and ((j-1)>0)) then 
          begin 
            if ((Tab[i,j].znacznik=false) and (Tab[i-1,j-1].agresywny=true)) then 
              begin 
                if random < Tab[i,j].podatnosc then 
                  Tab[i,j].znacznik:=true; 
              end; 
          end; 
        if ((i-1)>0) then 
          if ((Tab[i,j].znacznik=false) and (Tab[i-1,j].agresywny=true)) then 
            begin 
              if random < Tab[i,j].podatnosc then 
                Tab[i,j].znacznik:=true; 
            end; 
        if (((i-1)>0) and ((j+1)<(Last+1))) then 
          if ((Tab[i,j].znacznik=false) and (Tab[i-1,j+1].agresywny=true)) then 
            begin 
              if random < Tab[i,j].podatnosc then 
                Tab[i,j].znacznik:=true; 
            end; 
        if ((j+1)>(Last+1)) then 
          if ((Tab[i,j].znacznik=false) and (Tab[i,j+1].agresywny=true)) then 
            begin 
              if random < Tab[i,j].podatnosc then 
                Tab[i,j].znacznik:=true; 
            end; 
        if (((i+1)<(Last+1)) and ((j+1)<(Last+1))) then 
          if ((Tab[i,j].znacznik=false) and (Tab[i+1,j+1].agresywny=true)) then 
            begin 
              if random < Tab[i,j].podatnosc then 
                Tab[i,j].znacznik:=true; 
            end; 
        if (((i+1)<(Last+1))) then 
          if ((Tab[i,j].znacznik=false) and (Tab[i+1,j].agresywny=true)) then 
            begin 
              if random < Tab[i,j].podatnosc then 
                Tab[i,j].znacznik:=true; 
            end; 
        if (((i+1)<>(Last+1)) and ((j-1)>0)) then 
          if ((Tab[i,j].znacznik=false) and (Tab[i+1,j-1].agresywny=true)) then 
            begin 
              if random < Tab[i,j].podatnosc then 
                Tab[i,j].znacznik:=true; 
            end; 
        if ((j-1)>0) then 
          if ((Tab[i,j].znacznik=false) and (Tab[i,j-1].agresywny=true)) then 
            begin 
              if random < Tab[i,j].podatnosc then 
                Tab[i,j].znacznik:=true; 
            end; 
      end; 
end; 
procedure boisko; 

begin 
  brush(1,100,190,60); 
  Rectangle( 65,400 ,310 ,300 ); 
  moveto(65,330); 
  lineto(85,330); 
  lineto(85,360); 
  lineto(65,360); 
  moveto(180,300); 
  lineto(180,400); 
  moveto(310,330); 
  lineto(290,330); 
  lineto(290,360); 
  lineto(310,360); 
  ellipse(160,330,200,370); 
  {pilkarze} 
  moveto(72,335); 
  TextColor( 255,255,255 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(107,316); 
  TextColor( 255,255,255 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(112,339); 
  TextColor( 255,255,255 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(107,366); 
  TextColor( 255,255,255 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(115,377); 
  TextColor( 255,255,255 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(147,328); 
  TextColor( 255,255,255 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(154,370); 
  TextColor( 255,255,0 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(208,317); 
  TextColor( 255,255,0 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(130,316); 
  TextColor( 255,255,0 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(295,338); 
  TextColor( 255,255,0 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(240,373); 
  TextColor( 255,255,0 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  moveto(176,346); 
  TextColor( 255,255,0 ); 
  Font( 10,0 ,12 ); 
  writeln('*'); 
  {pilka} 
  moveto(218,358); 
  TextColor( 255,0,0 ); 
  Font( 10,0 ,12 ); 
  writeln('.'); 
  moveto(290,290); 
  lineto(290,91); 
  lineto(350,290); 
  lineto(290,290); 
  Brush(1,0, 128, 255); 
  fill(314,253); 
  lineto(89,290); 
  lineto(89,90); 
  lineto(30,290); 
  lineto(90,290); 
  fill(69,231); 
  moveto(30,225); 
  lineto(30,100); 
  moveto(18,110); 
  lineto(18,64); 
  lineto(53,40); 
  lineto(53,89); 
  lineto(18,110); 
  Brush(1,255, 255, 0); 
  moveto(340,225); 
  lineto(340,100); 
  moveto(328,110); 
  lineto(334,55); 
  lineto(362,54); 
  lineto(361,115); 
  lineto(328,110); 
  {delay(2000);} 
  fill(31,79); 
  {delay(1000);} 
  fill(351,74); 
end; 
var 
   TheWorld:World; 
   krok:integer; 
   agresywni:integer; 
   {zarazeni:integer;} 
   f:text; 
   x:integer; 

begin 
  krok:=0; 
  agresywni:=0; 
  {zarazeni:=0;} 
  Init(TheWorld); 
  ustalanieagresywnych(TheWorld); 
  assign(f,'C:\kibice.txt'); 
  rewrite(f); 
  WriteLn(f,'Szerzenie sie agresji wsrod ',(Last*Last),' kibicow przyparametrach:'); 
  WriteLn(f,'Last=',Last,chr(9),'ProbAgres=',ProbAgres:2:4,chr(9),'OdpornoscNaAgres=',OdpornoscNaAgres); 
  writeln(f,'Krok',chr(9),'Agresywni'); 
  boisko; 
  repeat 
    krok:=krok+1; 
    zmiennaagresywnych(TheWorld); 
    sianieagresji(TheWorld); 
    agresywni:=policzagresywnych(TheWorld); 
    {policzzarazonych(zarazeni,TheWorld);} 
    Draw(TheWorld,10,10,Side); 
    moveto(10+przesuniecie,((Last*Side)+50+przesuniecie+Przesuniecie_napisow_w_dol)); 
    writeln('Krok: ',krok,'  ','Agresywni kibice: ',agresywni); 
    writeln(f,krok,chr(9),agresywni); 
    delay(1000); 
  until isEvent; 
  close(f); 
end.