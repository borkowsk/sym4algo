{From: "Zuzanna" <zoozana@op.pl>
To: "Wojciech Borkowski" <borkowsk@spik.swps.edu.pl>
Subject: Re: 
Date: 5 czerwca 2005 14:03

Dziêkuje i pozdrawiam
} 
program mróweczki; 

type 
   agent=record 
        alife:boolean; 
        feromon:integer; 
        food:boolean; 
        carrier:boolean; 
   end; 

   const 
   probalife=0.5; 
   probfood=0.4; 
   probreproduct=0.5; 
   last=50; 
   width=50; 
   height=50; 
   side=10; 
type 
   world=array[1..last,1..last] of agent; 

procedure init(var tab:world); 

var 
   i,j:integer; 
begin 
  for i:=1 to last do 
    for j:=1 to last do 
      begin 
        tab[i,j].carrier:=false; 
        tab[i,j].feromon:=0; 
        if random<probalife then 
          tab[i,j].alife:=true 
        else 
          begin 
            tab[i,j].alife:=false; 
            if random<probfood then 
              tab[i,j].food:=true 
            else 
              tab[i,j].food:=false; 
          end; 
      end; 
end; 

procedure draw(var tab:world; x,y,side:integer); 

var 
   i,j:integer; 
begin 
  for i:=1 to last do 
    for j:=1 to last do 
      begin 
        if tab[i,j].alife then 
          begin 
            brush(1,123,123,123); 
            ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
          end 
        else 
          if tab[i,j].food then 
            begin 
              brush(1,99,200,200); 
              ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
            end 
          else 
            if tab[i,j].carrier then 
              begin 
                brush(1,3,20,20); 
                ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
              end 
            else 
              if tab[i,j].feromon=1 then 
                begin 
                  brush(1,143,3,116); 
                  ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
                end 
              else 
                if tab[i,j].feromon=2 then 
                  begin 
                    brush(1,250,56,211); 
                    ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
                  end 
                else 
                  if tab[i,j].feromon=3 then 
                    begin 
                      brush(1,252,150,232); 
                      ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
                    end 
                  else 
                    if tab[i,j].feromon=4 then 
                      begin 
                        brush(1,254,211,245); 
                        ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
                      end 
                    else 
                      begin 
                        brush(1,255,255,255); 
                        pen(1,255,255,255); 
                        rectangle(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
                      end; 
      end; 
end; 

function inside(k,l:integer):boolean; 
{Ta procedura operuje tylko na indeksach, 
tab jest jej niepotrzebne} 

begin 
  if (k>0) and(l>0)and(k<=last)and(l<=last)then 
    inside:=true 
  else 
    inside:=false; 
end; 

procedure randomneighbour(j,i:integer;var k,l:integer); 
{Ta procedura operuje tylko na indeksach, tab jest jej
niepotrzebne, za to musi jakoœ zwracac wybrane indeksy
a tego nie miala.} 

var 
   losowanie:integer; 
begin 
  repeat 
    losowanie:=random(4); 
    if losowanie=0 then 
      begin 
        k:=j+1; 
        l:=i; 
      end; 
    if losowanie=1 then 
      begin 
        k:=j-1; 
        l:=i; 
      end; 
    if losowanie=2 then 
      begin 
        k:=j; 
        l:=i+1; 
      end; 
    if losowanie=3 then 
      begin 
        k:=j; 
        l:=i-1; 
      end; 
  until inside(k,l); 
end; 

procedure step(var tab:world); 

var 
   i,j,k,l:integer; 
   theworld:world; 
begin 
  for i:=1 to last do 
    for j:=1 to last do 
      begin 
        if tab[i,j].alife then 
          begin 
            randomneighbour(i,j,k,l); 
            {To ze zmienne i parametry nazywaja sie tak samo tu i we wnetrzu procedury nie oznacza, ze to to samo} 
            if tab[k,l].food then 
              begin 
                tab[i,j].alife:=false; 
                tab[k,l].food:=false; 
                tab[i,j].carrier:=true; 
              end; 
            if (tab[k,l].feromon=1) or (tab[k,l].feromon=2) or (tab[k,l].feromon=3) or (tab[k,l].feromon=4)then 
              begin 
                tab[i,j].alife:=false; 
                tab[k,l].alife:=true; 
              end; 
            if (tab[k,l].carrier) or (tab[k,l].alife) then 
              tab[i,j].alife:=true 
            else 
              tab[i,j].alife:=false; 
            tab[k,l].alife:=true; 
          end; 
        if tab[i,j].carrier then 
          begin 
            randomneighbour(i,j,k,l); 
            if (tab[k,l].feromon=1) or (tab[k,l].feromon=2) or (tab[k,l].feromon=3) or (tab[k,l].feromon=4)then 
              begin 
                tab[i,j].carrier:=false; 
                tab[k,l].carrier:=true; 
              end; 
            if (tab[k,l].carrier) or (tab[k,l].alife) or (tab[k,l].food) then 
              tab[i,j].carrier:=true 
            else 
              tab[k,l].carrier:=false; 
          end; 
      end; 
end; 

var 
   theworld:world; 

begin 
  init(theworld); 
  draw(theworld,10,10,side); 
  step(theworld); 
  draw(theworld,10,10,side); 
end.
