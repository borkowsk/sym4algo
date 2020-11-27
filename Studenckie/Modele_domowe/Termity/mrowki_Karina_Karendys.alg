program Termity;
{wersja zmodyfikowana przez Karinê Karendys - liczenie grup patyczków jednego typu}
const
 wizual=10;{BORKOWSKI}
 n_termity=10;
 Last=40;
 czas=0;
 szerokosc=10;
 n_przedmiotow=3;
 gestosc=0.1;
 skret=0.2;
 w=0.9; {prawdopodobienstwo zostawienia/wziecia przedmiotu}
 
type
 termit=record
  x:integer;
  y:integer;
  k:integer; {kierunek ruchu}
  c:integer; {co nosi termit}
 end;
 
 termity=array[1..n_termity] of termit;
 swiat=array[0..Last,0..Last] of integer;
 
 lok=record
  x:integer;
  y:integer;
 end;
  
var
 world:swiat;
 kopiec:termity;
 tablica_przejscia:array[0..3] of lok;
 
function koloruj_r(n:integer):integer;
 begin
  if n>0 then
   koloruj_r:=round(n*255/n_przedmiotow)
  else
   koloruj_r:=255;
 end;

function koloruj_g(n:integer):integer;
 begin
  if n>0 then
   koloruj_g:=255-round(n*255/n_przedmiotow)
  else
   koloruj_g:=255;
 end;

function koloruj_b(n:integer):integer;
 begin
  if n>0 then
   koloruj_b:=255
  else
   koloruj_b:=255;
 end;
 
procedure rysowanie(var world:swiat;var kopiec:termity);
var
 i,j,m,k:integer;
begin
 m:=0;
 k:=0;
 for i:=0 to last do
  for j:=0 to last do
   if world[i,j]<0 then
    k:=k+1
   else
    if world[i,j]>0 then
     begin
      m:=m+1;
      if kopiec[world[i,j]].c>0 then
       k:=k+1;
     end;
 
 for i:=0 to last do
  for j:=0 to last do
   begin
    if world[i,j]<=0 then
     begin
      pen(1,255,255,255);
      brush(1,koloruj_r(-world[i,j]),koloruj_g(-world[i,j]),koloruj_b(-world[i,j]));
     end
    else
     begin
      pen(1,0,0,0);
      brush(1,koloruj_r(kopiec[world[i,j]].c),koloruj_g(kopiec[world[i,j]].c),koloruj_b(kopiec[world[i,j]].c));
     end;
    rectangle(szerokosc*i,szerokosc*j,szerokosc*(i+1),szerokosc*(j+1)); 
   end;
 moveto(10,500);
 brush(1,255,255,255);
 writeln('Liczba termitów: ', m);
 writeln('Liczba patyczkow: ', k);  
end;

procedure init(var world:swiat;var kopiec:termity);
var
 i,j,x,y,k:integer;
begin
 tablica_przejscia[0].x:=0;
 tablica_przejscia[0].y:=-1;
 tablica_przejscia[1].x:=1;
 tablica_przejscia[1].y:=0;
 tablica_przejscia[2].x:=0;
 tablica_przejscia[2].y:=1;
 tablica_przejscia[3].x:=-1;
 tablica_przejscia[3].y:=0;
 
 for i:=0 to Last do
  for j:=0 to Last do
   if random<gestosc then
    world[i,j]:=(random(n_przedmiotow)+1)*(-1)
   else
    world[i,j]:=0;
    
 for i:=1 to n_termity do
  begin
   repeat
    x:=random(Last+1);
    y:=random(Last+1);
   until world[x,y]=0;
   world[x,y]:=i;
   kopiec[i].x:=x;
   kopiec[i].y:=y;
   kopiec[i].c:=0;
   kopiec[i].k:=random(4);    
  end;  

rysowanie(world,kopiec);
end;

procedure krok(var world:swiat;var kopiec:termity);
var
 k,i,g,h,l,t:integer;
begin
 for k:=1 to n_termity do 
  begin
   i:=random(n_termity)+1;
   g:=-((world[(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1)]));
   h:=-(world[(kopiec[i].x+tablica_przejscia[((kopiec[i].k+1) mod 4)].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[((kopiec[i].k+1) mod 4)].y+last+1)mod(last+1)]);     
   l:=-(world[(kopiec[i].x+tablica_przejscia[((kopiec[i].k+3) mod 4)].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[((kopiec[i].k+3) mod 4)].y+last+1)mod(last+1)]);
   t:=-(world[(kopiec[i].x+tablica_przejscia[((kopiec[i].k+2) mod 4)].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[((kopiec[i].k+2) mod 4)].y+last+1)mod(last+1)]);
   if kopiec[i].c=0 then
    begin
       if (g>0) and (h<=0) and (l<=0) then
        if random<w then
         begin
          world[kopiec[i].x,kopiec[i].y]:=0;
          kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
          kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
          kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
          world[kopiec[i].x,kopiec[i].y]:=i;
         end
        else
         if random<0.5 then
          kopiec[i].k:=(kopiec[i].k+1) mod 4
         else
          kopiec[i].k:=(kopiec[i].k+3) mod 4 
       else
        if (g<=0) and (h>0) and (l<=0) then
         if random<w then
          begin
           world[kopiec[i].x,kopiec[i].y]:=0;
           kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
           kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
           kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k:=(kopiec[i].k+1) mod 4;
           world[kopiec[i].x,kopiec[i].y]:=i;
          end
         else
          if random<0.5 then
           kopiec[i].k:=(kopiec[i].k+1) mod 4
          else
           kopiec[i].k:=(kopiec[i].k+3) mod 4 
        else 
         if (g<=0) and (h<=0) and (l>0) then
          if random<w then
           begin
            world[kopiec[i].x,kopiec[i].y]:=0;
            kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
            kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
            kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
            kopiec[i].k:=(kopiec[i].k+3) mod 4;
            world[kopiec[i].x,kopiec[i].y]:=i;
           end
          else
           if random<0.5 then
            kopiec[i].k:=(kopiec[i].k+1) mod 4
           else
            kopiec[i].k:=(kopiec[i].k+3) mod 4 
         else
          if (g>0) and (h>0) and (l<=0) then
           if random<w then
            if random<0.5 then
             begin
              world[kopiec[i].x,kopiec[i].y]:=0;
              kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
              kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
              kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
              world[kopiec[i].x,kopiec[i].y]:=i;
             end
            else
             begin
              world[kopiec[i].x,kopiec[i].y]:=0;
              kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
              kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
              kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
              kopiec[i].k:=(kopiec[i].k+1) mod 4;
              world[kopiec[i].x,kopiec[i].y]:=i;
             end
           else
            if random<0.5 then
             kopiec[i].k:=(kopiec[i].k+1) mod 4
            else
             kopiec[i].k:=(kopiec[i].k+3) mod 4 
          else 
           if (g>0) and (h<=0) and (l>0) then
            if random<w then
             if random<0.5 then
              begin
               world[kopiec[i].x,kopiec[i].y]:=0;
               kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
               kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
               kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
               world[kopiec[i].x,kopiec[i].y]:=i;
              end
             else
              begin
               world[kopiec[i].x,kopiec[i].y]:=0;
               kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
               kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
               kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
               kopiec[i].k:=(kopiec[i].k+3) mod 4;
               world[kopiec[i].x,kopiec[i].y]:=i;
              end
            else
             if random<0.5 then
              kopiec[i].k:=(kopiec[i].k+1) mod 4
             else
              kopiec[i].k:=(kopiec[i].k+3) mod 4 
           else
            if (g<=0) and (h>0) and (l>0) then
             if random<w then
              if random<0.5 then
               begin
                world[kopiec[i].x,kopiec[i].y]:=0;
                kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
                kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
                kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
                kopiec[i].k:=(kopiec[i].k+1) mod 4;
                world[kopiec[i].x,kopiec[i].y]:=i;
               end
              else
               begin
                world[kopiec[i].x,kopiec[i].y]:=0;
                kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
                kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
                kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
                kopiec[i].k:=(kopiec[i].k+3) mod 4;
                world[kopiec[i].x,kopiec[i].y]:=i;
               end
             else
              if random<0.5 then
               kopiec[i].k:=(kopiec[i].k+1) mod 4
              else
               kopiec[i].k:=(kopiec[i].k+3) mod 4 
            else
             if (g>0) and (h>0) and (l>0) then
              if random<w then
               begin
                if random<0.33 then
                 begin
                  world[kopiec[i].x,kopiec[i].y]:=0;
                  kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
                  kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
                  kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
                  world[kopiec[i].x,kopiec[i].y]:=i;
                 end
                else
                 if random>0.66 then 
                  begin
                   world[kopiec[i].x,kopiec[i].y]:=0;
                   kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
                   kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
                   kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
                   kopiec[i].k:=(kopiec[i].k+3) mod 4;
                   world[kopiec[i].x,kopiec[i].y]:=i;
                  end
                 else
                  begin
                   world[kopiec[i].x,kopiec[i].y]:=0;
                   kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
                   kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
                   kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
                   kopiec[i].k:=(kopiec[i].k+1) mod 4;
                   world[kopiec[i].x,kopiec[i].y]:=i;
                  end;
               end   
              else
               if random<0.5 then
                kopiec[i].k:=(kopiec[i].k+1) mod 4
               else
                kopiec[i].k:=(kopiec[i].k+3) mod 4  
             else
              if (g=0) and (h<=0) and (l<=0) then
               begin
                world[kopiec[i].x,kopiec[i].y]:=0;
                kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
                kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
                world[kopiec[i].x,kopiec[i].y]:=i;
                if random<skret then
                 if random<0.5 then
                  kopiec[i].k:=((kopiec[i].k+1) mod 4)
                 else
                  kopiec[i].k:=((kopiec[i].k+3) mod 4);
               end 
              else
               if random<0.5 then
                kopiec[i].k:=(kopiec[i].k+1) mod 4
               else
                kopiec[i].k:=(kopiec[i].k+3) mod 4;
    end
   else
    begin
     if (g=kopiec[i].c) or (h=kopiec[i].c) or (l=kopiec[i].c) then
      if random<w then
       begin
         if t<0 then
          if random<0.5 then
           kopiec[i].k:=(kopiec[i].k+1) mod 4
          else
           kopiec[i].k:=(kopiec[i].k+3) mod 4
         else
          begin 
           world[kopiec[i].x,kopiec[i].y]:=-kopiec[i].c;
           kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+2) mod 4].x+last+1)mod(last+1);
           kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+2) mod 4].y+last+1)mod(last+1);
           kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k:=(kopiec[i].k+2) mod 4;
           world[kopiec[i].x,kopiec[i].y]:=i; 
          end; 
       end
      else
       if random<0.5 then
        kopiec[i].k:=(kopiec[i].k+1) mod 4
       else
        kopiec[i].k:=(kopiec[i].k+3) mod 4 
     else
      if (g=0) and (h<>kopiec[i].c) and (l<>kopiec[i].c)then
       if random>w then
        begin
        world[kopiec[i].x,kopiec[i].y]:=-kopiec[i].c;
        kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
        kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
        kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
        world[kopiec[i].x,kopiec[i].y]:=i;
        end
       else  
        begin
         world[kopiec[i].x,kopiec[i].y]:=0;
         kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
         kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
         world[kopiec[i].x,kopiec[i].y]:=i;
        end
      else    
       if g<0 then
        if t<0 then
         if random<0.5 then
          kopiec[i].k:=(kopiec[i].k+1) mod 4
         else
          kopiec[i].k:=(kopiec[i].k+3) mod 4
        else
         if random>w then
          begin
           world[kopiec[i].x,kopiec[i].y]:=-kopiec[i].c;
           kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+2) mod 4].x+last+1)mod(last+1);
           kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+2) mod 4].y+last+1)mod(last+1);
           kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k:=(kopiec[i].k+2) mod 4;
           world[kopiec[i].x,kopiec[i].y]:=i;
          end
         else
          if random<0.5 then
           kopiec[i].k:=(kopiec[i].k+1) mod 4
          else
           kopiec[i].k:=(kopiec[i].k+3) mod 4
       else
        if t>=0 then
         if random>w then
          begin
           world[kopiec[i].x,kopiec[i].y]:=-kopiec[i].c;
           kopiec[i].x:=(kopiec[i].x+tablica_przejscia[(kopiec[i].k+2) mod 4].x+last+1)mod(last+1);
           kopiec[i].y:=(kopiec[i].y+tablica_przejscia[(kopiec[i].k+2) mod 4].y+last+1)mod(last+1);
           kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k:=(kopiec[i].k+2) mod 4;
           world[kopiec[i].x,kopiec[i].y]:=i;
          end
         else 
          if random<0.5 then
           kopiec[i].k:=((kopiec[i].k+1) mod 4)
          else
           kopiec[i].k:=((kopiec[i].k+3) mod 4)
        else
         if random<w then
          if random<0.5 then
           kopiec[i].k:=(kopiec[i].k+1) mod 4
          else
           kopiec[i].k:=(kopiec[i].k+3) mod 4
         else
          begin
           world[kopiec[i].x,kopiec[i].y]:=-kopiec[i].c;
           kopiec[i].x:=(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
           kopiec[i].y:=(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
           kopiec[i].c:=-world[kopiec[i].x,kopiec[i].y];
           world[kopiec[i].x,kopiec[i].y]:=i;    
          end;  
     end;      
  end;
end;


{http://pl.wikipedia.org/wiki/Rozrost_ziarna} 
procedure seedFill(x:integer; y:integer; kolorStartowy:integer; var kopia_swiata:swiat); 
begin 
  {bez tego algo zg³asza³ nieprawid³owy indeks} 
  if (x <= Last) and (y <= Last) and (x >= 0) and (y >= 0) then 
    begin 
      if kolorStartowy = 0 then 
        kolorStartowy := kopia_swiata[x, y];
        {testowo sprawdza³am ile jest pustych pól, algo zg³asza³ przepe³nienie pamiêci, 
        wiêc tutaj blokuje tak¹ mo¿liwoœæ}
      if kolorStartowy <> 0 then 
        if kopia_swiata[x, y] = kolorStartowy then 
          begin 
            kopia_swiata[x, y] := 0; 
            seedFill(x, y - 1, kolorStartowy, kopia_swiata); 
            seedFill(x + 1, y , kolorStartowy, kopia_swiata); 
            seedFill(x - 1, y - 1, kolorStartowy, kopia_swiata); 
            seedFill(x + 1, y - 1, kolorStartowy, kopia_swiata); 
            seedFill(x, y + 1, kolorStartowy, kopia_swiata); 
            seedFill(x - 1, y , kolorStartowy, kopia_swiata); 
            seedFill(x - 1, y + 1, kolorStartowy, kopia_swiata); 
            seedFill(x + 1, y + 1, kolorStartowy, kopia_swiata); 
          end; 
    end; 
end; 

function zlicz_patyczki(kopia_world:swiat; typ:integer) : integer; 
var 
   x, y, patyczkow:integer; 
begin 
  patyczkow := 0; 
  for y := 0 to last do 
    for x := 0 to last do 
      if kopia_world[x, y] = typ then 
        begin 
          patyczkow := patyczkow + 1; 
          seedFill(x, y, 0,kopia_world); 
        end; 
  zlicz_patyczki := patyczkow; 
end; 

var 
   krokm:integer; 

begin 
  krokm:=0; 
  init(world,kopiec); 
  repeat 
    if krokm mod wizual = 0 then
    {BORKOWSKI} 
      begin 
        rysowanie(world,kopiec); 
        writeln(' krok: ',krokm,'  '); 
        writeln(zlicz_patyczki(world, -2), ' grup patyczkow podanego typu');
      end; 
    krok(world,kopiec); 
    krokm:=krokm+1; 
  until IsEvent; 
end.
