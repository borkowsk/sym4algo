program Termity;

const
 wizual = 100;{BORKOWSKI}
 n_termity = 10;
 Last = 40;
 czas = 0;
 szerokosc = 10;
 n_przedmiotow = 3;
 gestosc = 0.1;
 skret = 0.2;
 w = 0.9; {prawdopodobienstwo zostawienia / wziecia przedmiotu}
 
type
 termit = record
  x:integer;
  y:integer;
  k:integer; {kierunek ruchu}
  c:integer; {co nosi termit}
 end;
 
 termity = array[1..n_termity] of termit;
 swiat = array[0..Last,0..Last] of integer;
 
 lok = record
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
   koloruj_r := round(n * 255 / n_przedmiotow)
  else
   koloruj_r := 255;
 end;

function koloruj_g(n:integer):integer;
 begin
  if n>0 then
   koloruj_g := 255-round(n * 255 / n_przedmiotow)
  else
   koloruj_g := 255;
 end;

function koloruj_b(n:integer):integer;
 begin
  if n>0 then
   koloruj_b := 255
  else
   koloruj_b := 255;
 end;
 

procedure floodFill(x:integer; y:integer; col:integer; var world:swiat); {AE}
{zwyczajny rekurencyjny floodfill w czterospójnym otoczeniu,
operuj¹cy na kopii œwiata powsta³ej jako automatyczna zmienna w funkcji count}

begin 
  if (x <= Last) and (x >= 0) and (y <= Last) and (y >= 0) then 
    begin 
      if col = 0 then 
        col := world[x, y]; 
      if (world[x, y] <> 0) and (world[x, y] = col) then 
        begin 
          world[x, y] := 0; 
          floodFill(x,  y - 1,  col, world); 
          floodFill(x + 1,  y , col, world); 
          floodFill(x,  y + 1,  col, world); 
          floodFill(x - 1,  y , col, world); 
          {oœmiospójne}
          floodFill(x - 1,  y - 1,  col, world); 
          floodFill(x + 1,  y - 1, col, world); 
          floodFill(x - 1,  y + 1,  col, world); 
          floodFill(x + 1,  y + 1, col, world); 
        end; 
    end; 
end; 

procedure count(world:swiat); {AE}

var 
   i,j, one, two, three:integer; 
begin 
  one := 0; 
  two := 0; 
  three := 0; 
  for i := 0 to last do 
    for j := 0 to last do 
      if world[i,j] <0 then 
        begin 
          case world[i,j] of 
            -1 : 
              begin 
                one := one + 1; 
              end; 
            -2 : 
              begin 
                two := two + 1; 
              end; 
          else 
            three := three + 1; 
          end; 
          floodFill(i, j, 0, world); 
        end; 
  writeln('grupek 1 typu ', one,'   '); 
  writeln('grupek 2 typu ', two,'   '); 
  writeln('grupek 3 typu ', three,'   '); 
end; 

procedure rysowanie();
{AE: skoro bierze zmienn¹ przez referencje, to równie dobrze mo¿emy korzystaæ z globalnej}
var
 i,j,m,k:integer;
begin
 m := 0;
 k := 0;
 for i := 0 to last do
  for j := 0 to last do
   if world[i,j]<0 then
    k := k+1
   else
    if world[i,j]>0 then
     begin
      m := m+1;
      if kopiec[world[i,j]].c>0 then
       k := k+1;
     end;
 
 for i := 0 to last do
  for j := 0 to last do
   begin
    if world[i,j] <= 0 then
     begin
      pen(1,255,255,255);
      brush(1,koloruj_r(-world[i,j]),koloruj_g(-world[i,j]),koloruj_b(-world[i,j]));
     end
    else
     begin
      pen(1,0,0,0);
      brush(1,koloruj_r(kopiec[world[i,j]].c),koloruj_g(kopiec[world[i,j]].c),koloruj_b(kopiec[world[i,j]].c));
     end;
    rectangle(szerokosc * i,szerokosc * j,szerokosc * (i+1),szerokosc * (j+1)); 
   end;
 moveto(10,500);
 brush(1,255,255,255);
 writeln('Liczba termitów: ', m);
 writeln('Liczba drewienek: ', k);  
end;

procedure init(var world:swiat;var kopiec:termity);
var
 i,j,x,y,k:integer;
begin
 tablica_przejscia[0].x := 0;
 tablica_przejscia[0].y := -1;
 tablica_przejscia[1].x := 1;
 tablica_przejscia[1].y := 0;
 tablica_przejscia[2].x := 0;
 tablica_przejscia[2].y := 1;
 tablica_przejscia[3].x := -1;
 tablica_przejscia[3].y := 0;
 
 for i := 0 to Last do
  for j := 0 to Last do
   if random<gestosc then
    world[i,j] := (random(n_przedmiotow)+1) * (-1)
   else
    world[i,j] := 0;
    
 for i := 1 to n_termity do
  begin
   repeat
    x := random(Last+1);
    y := random(Last+1);
   until world[x,y] = 0;
   world[x,y] := i;
   kopiec[i].x := x;
   kopiec[i].y := y;
   kopiec[i].c := 0;
   kopiec[i].k := random(4);    
  end;  
end;

procedure krok(); {AE}
var
 k,i,g,h,l,t:integer;
begin
 for k := 1 to n_termity do 
  begin
   i := random(n_termity)+1;
   g := -((world[(kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1)]));
   h := -(world[(kopiec[i].x+tablica_przejscia[((kopiec[i].k+1) mod 4)].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[((kopiec[i].k+1) mod 4)].y+last+1)mod(last+1)]);     
   l := -(world[(kopiec[i].x+tablica_przejscia[((kopiec[i].k+3) mod 4)].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[((kopiec[i].k+3) mod 4)].y+last+1)mod(last+1)]);
   t := -(world[(kopiec[i].x+tablica_przejscia[((kopiec[i].k+2) mod 4)].x+last+1)mod(last+1),(kopiec[i].y+tablica_przejscia[((kopiec[i].k+2) mod 4)].y+last+1)mod(last+1)]);
   if kopiec[i].c = 0 then
    begin
       if (g>0) and (h <= 0) and (l <= 0) then
        if random<w then
         begin
          world[kopiec[i].x,kopiec[i].y] := 0;
          kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
          kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
          kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
          world[kopiec[i].x,kopiec[i].y] := i;
         end
        else
         if random<0.5 then
          kopiec[i].k := (kopiec[i].k+1) mod 4
         else
          kopiec[i].k := (kopiec[i].k+3) mod 4 
       else
        if (g <= 0) and (h>0) and (l <= 0) then
         if random<w then
          begin
           world[kopiec[i].x,kopiec[i].y] := 0;
           kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
           kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
           kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k := (kopiec[i].k+1) mod 4;
           world[kopiec[i].x,kopiec[i].y] := i;
          end
         else
          if random<0.5 then
           kopiec[i].k := (kopiec[i].k+1) mod 4
          else
           kopiec[i].k := (kopiec[i].k+3) mod 4 
        else 
         if (g <= 0) and (h <= 0) and (l>0) then
          if random<w then
           begin
            world[kopiec[i].x,kopiec[i].y] := 0;
            kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
            kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
            kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
            kopiec[i].k := (kopiec[i].k+3) mod 4;
            world[kopiec[i].x,kopiec[i].y] := i;
           end
          else
           if random<0.5 then
            kopiec[i].k := (kopiec[i].k+1) mod 4
           else
            kopiec[i].k := (kopiec[i].k+3) mod 4 
         else
          if (g>0) and (h>0) and (l <= 0) then
           if random<w then
            if random<0.5 then
             begin
              world[kopiec[i].x,kopiec[i].y] := 0;
              kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
              kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
              kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
              world[kopiec[i].x,kopiec[i].y] := i;
             end
            else
             begin
              world[kopiec[i].x,kopiec[i].y] := 0;
              kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
              kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
              kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
              kopiec[i].k := (kopiec[i].k+1) mod 4;
              world[kopiec[i].x,kopiec[i].y] := i;
             end
           else
            if random<0.5 then
             kopiec[i].k := (kopiec[i].k+1) mod 4
            else
             kopiec[i].k := (kopiec[i].k+3) mod 4 
          else 
           if (g>0) and (h <= 0) and (l>0) then
            if random<w then
             if random<0.5 then
              begin
               world[kopiec[i].x,kopiec[i].y] := 0;
               kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
               kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
               kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
               world[kopiec[i].x,kopiec[i].y] := i;
              end
             else
              begin
               world[kopiec[i].x,kopiec[i].y] := 0;
               kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
               kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
               kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
               kopiec[i].k := (kopiec[i].k+3) mod 4;
               world[kopiec[i].x,kopiec[i].y] := i;
              end
            else
             if random<0.5 then
              kopiec[i].k := (kopiec[i].k+1) mod 4
             else
              kopiec[i].k := (kopiec[i].k+3) mod 4 
           else
            if (g <= 0) and (h>0) and (l>0) then
             if random<w then
              if random<0.5 then
               begin
                world[kopiec[i].x,kopiec[i].y] := 0;
                kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
                kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
                kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
                kopiec[i].k := (kopiec[i].k+1) mod 4;
                world[kopiec[i].x,kopiec[i].y] := i;
               end
              else
               begin
                world[kopiec[i].x,kopiec[i].y] := 0;
                kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
                kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
                kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
                kopiec[i].k := (kopiec[i].k+3) mod 4;
                world[kopiec[i].x,kopiec[i].y] := i;
               end
             else
              if random<0.5 then
               kopiec[i].k := (kopiec[i].k+1) mod 4
              else
               kopiec[i].k := (kopiec[i].k+3) mod 4 
            else
             if (g>0) and (h>0) and (l>0) then
              if random<w then
               begin
                if random<0.33 then
                 begin
                  world[kopiec[i].x,kopiec[i].y] := 0;
                  kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
                  kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
                  kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
                  world[kopiec[i].x,kopiec[i].y] := i;
                 end
                else
                 if random>0.66 then 
                  begin
                   world[kopiec[i].x,kopiec[i].y] := 0;
                   kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+3) mod 4].x+last+1)mod(last+1);
                   kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+3) mod 4].y+last+1)mod(last+1);
                   kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
                   kopiec[i].k := (kopiec[i].k+3) mod 4;
                   world[kopiec[i].x,kopiec[i].y] := i;
                  end
                 else
                  begin
                   world[kopiec[i].x,kopiec[i].y] := 0;
                   kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+1) mod 4].x+last+1)mod(last+1);
                   kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+1) mod 4].y+last+1)mod(last+1);
                   kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
                   kopiec[i].k := (kopiec[i].k+1) mod 4;
                   world[kopiec[i].x,kopiec[i].y] := i;
                  end;
               end   
              else
               if random<0.5 then
                kopiec[i].k := (kopiec[i].k+1) mod 4
               else
                kopiec[i].k := (kopiec[i].k+3) mod 4  
             else
              if (g = 0) and (h <= 0) and (l <= 0) then
               begin
                world[kopiec[i].x,kopiec[i].y] := 0;
                kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
                kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
                world[kopiec[i].x,kopiec[i].y] := i;
                if random<skret then
                 if random<0.5 then
                  kopiec[i].k := ((kopiec[i].k+1) mod 4)
                 else
                  kopiec[i].k := ((kopiec[i].k+3) mod 4);
               end 
              else
               if random<0.5 then
                kopiec[i].k := (kopiec[i].k+1) mod 4
               else
                kopiec[i].k := (kopiec[i].k+3) mod 4;
    end
   else
    begin
     if (g = kopiec[i].c) or (h = kopiec[i].c) or (l = kopiec[i].c) then
      if random<w then
       begin
         if t<0 then
          if random<0.5 then
           kopiec[i].k := (kopiec[i].k+1) mod 4
          else
           kopiec[i].k := (kopiec[i].k+3) mod 4
         else
          begin 
           world[kopiec[i].x,kopiec[i].y] := -kopiec[i].c;
           kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+2) mod 4].x+last+1)mod(last+1);
           kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+2) mod 4].y+last+1)mod(last+1);
           kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k := (kopiec[i].k+2) mod 4;
           world[kopiec[i].x,kopiec[i].y] := i; 
          end; 
       end
      else
       if random<0.5 then
        kopiec[i].k := (kopiec[i].k+1) mod 4
       else
        kopiec[i].k := (kopiec[i].k+3) mod 4 
     else
      if (g = 0) and (h<>kopiec[i].c) and (l<>kopiec[i].c)then
       if random>w then
        begin
        world[kopiec[i].x,kopiec[i].y] := -kopiec[i].c;
        kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
        kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
        kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
        world[kopiec[i].x,kopiec[i].y] := i;
        end
       else  
        begin
         world[kopiec[i].x,kopiec[i].y] := 0;
         kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
         kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
         world[kopiec[i].x,kopiec[i].y] := i;
        end
      else    
       if g<0 then
        if t<0 then
         if random<0.5 then
          kopiec[i].k := (kopiec[i].k+1) mod 4
         else
          kopiec[i].k := (kopiec[i].k+3) mod 4
        else
         if random>w then
          begin
           world[kopiec[i].x,kopiec[i].y] := -kopiec[i].c;
           kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+2) mod 4].x+last+1)mod(last+1);
           kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+2) mod 4].y+last+1)mod(last+1);
           kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k := (kopiec[i].k+2) mod 4;
           world[kopiec[i].x,kopiec[i].y] := i;
          end
         else
          if random<0.5 then
           kopiec[i].k := (kopiec[i].k+1) mod 4
          else
           kopiec[i].k := (kopiec[i].k+3) mod 4
       else
        if t>= 0 then
         if random>w then
          begin
           world[kopiec[i].x,kopiec[i].y] := -kopiec[i].c;
           kopiec[i].x := (kopiec[i].x+tablica_przejscia[(kopiec[i].k+2) mod 4].x+last+1)mod(last+1);
           kopiec[i].y := (kopiec[i].y+tablica_przejscia[(kopiec[i].k+2) mod 4].y+last+1)mod(last+1);
           kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
           kopiec[i].k := (kopiec[i].k+2) mod 4;
           world[kopiec[i].x,kopiec[i].y] := i;
          end
         else 
          if random<0.5 then
           kopiec[i].k := ((kopiec[i].k+1) mod 4)
          else
           kopiec[i].k := ((kopiec[i].k+3) mod 4)
        else
         if random<w then
          if random<0.5 then
           kopiec[i].k := (kopiec[i].k+1) mod 4
          else
           kopiec[i].k := (kopiec[i].k+3) mod 4
         else
          begin
           world[kopiec[i].x,kopiec[i].y] := -kopiec[i].c;
           kopiec[i].x := (kopiec[i].x+tablica_przejscia[kopiec[i].k].x+last+1)mod(last+1);
           kopiec[i].y := (kopiec[i].y+tablica_przejscia[kopiec[i].k].y+last+1)mod(last+1);
           kopiec[i].c := -world[kopiec[i].x,kopiec[i].y];
           world[kopiec[i].x,kopiec[i].y] := i;    
          end;  
     end;      
  end;
end;

var krokm:integer; 
begin 
  krokm := 0; 
  init(world,kopiec); 
  rysowanie; {AE}
  moveto(2,Last*szerokosc+10);
  writeln;
  writeln('STAN POCZATKOWY');
  count(world); {AE} 
  repeat 
    if krokm mod wizual = 0 then 
    {BORKOWSKI} 
      begin 
        rysowanie; {AE}
        writeln('** krok: ',krokm,'  '); 
        count(world); {AE}
      end 
    else 
      begin      
      moveto(2,Last*szerokosc+10);
      writeln('* krok: ', krokm ,'  '); {AE}
      end;
      
    krok; {AE}
    krokm := krokm+1;    
  until IsEvent;   

  rysowanie; {AE} 
  {moveto(2,Last*szerokosc+10);}
  writeln('*** krok: ',krokm);
  writeln('KONIEC                    ');   
  count(world); {AE}
  
end.
