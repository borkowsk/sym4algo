Program DylematWieznia; 
{Projekt studencki Luty 2006 - Piotr Kitta?}
type 
   agent=record 
        alife:boolean; 
        race:integer; 
        wyrok:integer; 
   end; 
   punkt=record 
        x,y:integer; 
   end; 

   const 
   last=50; 
   side=10; 
   probalife=0.66; 
   zakres1=0.33; 
   zakres2=0.66; 
   WyrokOstateczny=50; 
   {Jesli suma wyrokow przekroczy te wartosc agent ginie} 
   Stala=10; 
   {Stala wartosc odejmowana od wyroku} 
   LogName='DylWiez.log';
type 
   world=array[1..last,1..last] of agent; 

procedure init(var Tab:world); 

var 
   i,j:integer; 
   los:real; 
begin 
  for i:=1 to last do 
    for j:=1 to last do 
      if random<probalife then 
        begin 
          tab[i,j].alife:=true; 
          tab[i,j].wyrok:=0; 
          los:=random; 
          if los<=zakres1 then 
            tab[i,j].race:=0 
          else 
            if (los>zakres1) and (los<=zakres2) then 
              tab[i,j].race:=1 
            else 
              tab[i,j].race:=2; 
        end 
      else 
        tab[i,j].alife:=false; 
end; 

function selem(var Tab:world;k,l:integer):integer; 

begin 
  if(k>0)and(l>0)and(k<=last)and(l<=last) and(tab[k,l].alife) then 
    selem:=1 
  else 
    selem:=0; 
end; 

procedure changefill(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*255; 
  brush(1,round(v*0.7),round(v*0.3),round(v*0.3)); 
end; 

procedure draw(var tab:world;x,y,side:integer); 

var 
   i,j:integer; 
begin 
  for i:=1 to last do 
    for j:=1 to last do 
      if tab[i,j].alife then 
        begin 
          changefill(tab[i,j].race,0,2); 
          ellipse(x+i*side-side,y+j*side-side, x+i*side,y+j*side); 
        end 
      else 
        begin 
          brush(1,255,255,255); 
          pen(1,255,255,255); 
          rectangle(x+i*side-side,y+j*side-side, x+i*side,y+j*side); 
        end; 
end; 

procedure swap(var cell1,cell2:agent); 

var 
   pom:agent; 
begin 
  pom:=cell1; 
  cell1:=cell2; 
  cell2:=pom; 
end; 

function WyborStra(Race:integer):integer; 

begin 
  case Race of 
    0: 
      WyborStra:=0; 
    1: 
      WyborStra:=1; 
    2: 
      WyborStra:=round(random); 
  end; 
end; 


procedure montecarlostep(var tab:world); 

var 
   a,steplenght,i,j,ni,nj,x,y,sas,strat1,strat2:integer; 
   sasiedzi:array[1..8] of punkt; 
begin 
  steplenght:=sqr(last); 
  for a:=1 to steplenght do 
    begin 
      i:=1+random(last); 
      j:=1+random(last); 
      if (tab[i,j].alife) then 
        begin 
          {sprawdza czy ma sasiadow i ich namiary zapisuje do tablicy "sasiedzi"} 
          sas:=0; 
          for x:=i-1 to i+1 do 
            for y:=j-1 to j+1 do 
              if not ((x=i) and (y=j)) then 
                if selem(tab,x,y)=1 then 
                  begin 
                    sas:=sas+1; 
                    sasiedzi[sas].x:=x; 
                    sasiedzi[sas].y:=y; 
                  end; 
          {losuje z ktorym sasiadem ma zagrac} 
          if sas>0 then 
            begin 
              sas:=random(sas)+1; 
              strat1:=WyborStra(tab[i,j].race); 
              x:=sasiedzi[sas].x; 
              y:=sasiedzi[sas].y; 
              strat2:=WyborStra(tab[x,y].race); 
              if (strat1=0) and (strat2=0) then 
                begin 
                  tab[i,j].wyrok:=tab[i,j].wyrok+1-Stala; 
                  tab[x,y].wyrok:=tab[x,y].wyrok+1-Stala; 
                end; 
              if (strat1=1) and (strat2=0) then 
                begin 
                  tab[i,j].wyrok:=tab[i,j].wyrok-20-Stala; 
                  tab[x,y].wyrok:=tab[x,y].wyrok+20-Stala; 
                end; 
              if (strat1=0) and (strat2=1) then 
                begin 
                  tab[i,j].wyrok:=tab[i,j].wyrok+20-Stala; 
                  tab[x,y].wyrok:=tab[x,y].wyrok-20-Stala; 
                end; 
              if (strat1=1) and (strat2=1) then 
                begin 
                  tab[i,j].wyrok:=tab[i,j].wyrok+10-Stala; 
                  tab[x,y].wyrok:=tab[x,y].wyrok+10-Stala; 
                end; 
            end; 
          if tab[i,j].wyrok<WyrokOstateczny then 
            begin 
              repeat 
                ni:=1+random(last); 
                nj:=1+random(last); 
              until not tab[ni,nj].alife; 
              swap(tab[i,j],tab[ni,nj]); 
            end 
          else 
            tab[i,j].alife:=false; 
        end; 
    end; 
end; 

procedure ZliczajStan(var Tab:world;var log:text); 

var 
   Stan:array[0..2] of integer; 
   i,j,t,race:integer; 
begin 
  for t:=0 to 2 do 
    Stan[t]:=0; 
  for i:=1 to Last do 
    for j:=1 to Last do 
      begin 
        if tab[i,j].alife then 
          begin 
            race:=tab[i,j].race; 
            Stan[Race]:=Stan[Race]+1; 
          end; 
      end; 
  writeln(log); 
  for t:=0 to 2 do 
    write(log,chr(9),Stan[t],';'); 
end; 

var 
   theworld:world; 
   step:integer; 
   MSt:real; 
   log:text; 

begin 
  assign(log,LogName); 
  rewrite(log); 
  writeln(log,last,'x',last,', P=',probalife,', Zakres1=',zakres1:4:4,', Zakres2=',zakres2:4:4,', Wyrok Ostateczny=',WyrokOstateczny,', Stala=',stala); 
  writeln(log,chr(9),'Il.Zap',chr(9),'Il.Prz',chr(9),'Il.Miesz'); 
  step:=0; 
  init(theworld); 
  repeat 
    moveto(0,last*side+10); 
    pen(1,0,0,0); 
    brush(1,255,255,255); 
    writeln(step); 
    ZliczajStan(theworld,log); 
    if step mod 10 = 0 then 
      draw(theworld,10,10,side); 
    montecarlostep(theworld); 
    step:=step+1; 
  until isevent; 
  close(log); 
end.
