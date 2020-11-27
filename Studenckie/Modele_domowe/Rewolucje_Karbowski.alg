program dwierewolucje; 
{Karbowski SPIK. Niby model wp³ywu z liderami rewolucji}
type 
   agent=record 
        alife:boolean; 
        race:integer; 
        stres:real; 
        cierpliwosc:integer; 
        dominujacy:boolean; 
        sas:array[0..2] of integer; 
        op_dom:integer; 
   end; 

   const 
   Last=50; 
   side=11; 
   howManyRaces=3; 
var 
   krok:integer; 
   zycie,p1,p2:real; 
   ge1:array[0..Last] of integer; 
   ge2:array[0..Last] of integer; 
   ge3:array[0..Last] of integer; 
   zge:array[0..Last,0..Last] of integer; 

   type 
   world=array[1..Last,1..Last] of agent; 

procedure init(var Tab:world); 

var 
   i,j:integer; 
   los:real; 
   a:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if random<zycie then 
        begin 
          tab[i,j].alife:=true; 
          tab[i,j].stres:=0; 
          tab[i,j].dominujacy:=false; 
          tab[i,j].cierpliwosc:=5; 
          los:=random; 
          if los<p1 then 
            tab[i,j].race:=0; 
          if (los>=p1) and (los<p2) then 
            tab[i,j].race:=1; 
          if los>=p2 then 
            tab[i,j].race:=2; 
        end 
      else 
        tab[i,j].alife:=false; 
  for a:=1 to 2 do 
    begin 
      repeat 
        i:=1+random(Last); 
        j:=1+random(Last); 
      until Tab[i,j].alife; 
      tab[i,j].race:=a; 
      tab[i,j].dominujacy:=true; 
    end 
end; 

procedure CalculateStres(var tab:world); 

var 
   i,j,x,y,k,l,t:integer; 
   cr:integer; 
   Summ,max,iloscmax,opinia:integer; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].alife then 
        begin 
          cr:=Tab[i,j].race; 
          for t:=0 to 2 do 
            tab[i,j].sas[t]:=0; 
          for x:=i-1 to i+1 do 
            for y:=j-1 to j+1 do 
              if not ((x=i) and (y=j)) then 
                if(x>0)and(y>0)and(x<=Last)and(y<=last) and(tab[x,y].alife) then 
                  tab[i,j].sas[tab[x,y].race]:=tab[i,j].sas[tab[x,y].race]+1; 
          summ:=0; 
          max:=0; 
          for t:=0 to 2 do 
            begin 
              summ:=summ+tab[i,j].sas[t]; 
              if tab[i,j].sas[t]>max then 
                max:=tab[i,j].sas[t]; 
            end; 
          Tab[i,j].stres:=Summ/8; 
          iloscmax:=0; 
          for t:=0 to 2 do 
            if tab[i,j].sas[t]=max then 
              begin 
                opinia:=t; 
                iloscmax:=iloscmax+1 
              end; 
          if iloscmax=1 then 
            tab[i,j].op_dom:=opinia 
          else 
            tab[i,j].op_dom:=-1; 
        end; 
end; 

procedure Draw(var Tab:World;x,y,side:integer); 

var 
   i,j:integer; 
   v:real; 
begin 
  for i:=1 to Last do 
    for j:=1 to Last do 
      if Tab[i,j].alife then 
        begin 
          if not Tab[i,j].dominujacy then 
            begin 
              if Tab[i,j].race=0 then 
                begin 
                  Pen(2,50,150,0); 
                  brush(2,50,150,0); 
                end ; 
              if Tab[i,j].race=1 then 
                begin 
                  Pen(2,250,190,11); 
                  brush(2,250,190,11); 
                end ; 
              if Tab[i,j].race=2 then 
                begin 
                  Pen(2,0,255,255); 
                  brush(2,0,255,255); 
                end; 
            end 
          else 
            case tab[i,j].race of 
              1: 
                begin 
                  pen(1,255,0,0); 
                  brush(1,255,0,0); 
                end; 
              2: 
                begin 
                  pen(1,0,0,255); 
                  brush(1,0,0,255); 
                end; 
            end; 
          ellipse(x+i*side-side,y+j*side-side, x+i*side,y+j*side); 
        end 
      else 
        begin 
          Brush(1,255,255,255); 
          Pen(1,255,255,255); 
          rectangle(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
        end; 
end; 
function meanstres(var tab:world):real; 

var 
   summ:real; 
   n:integer; 
   i,j:integer; 
begin 
  summ:=0; 
  n:=0; 
  for i:=1 to last do 
    for j:=1 to last do 
      if tab[i,j].alife then 
        begin 
          n:=n+1; 
          summ:=summ+tab[i,j].stres; 
        end; 
  if n>0 then 
    meanstres:=summ/n 
  else 
    meanstres:=-9999; 
end; 

procedure swap( var cell,cell2:agent); 

var 
   pom:agent; 
begin 
  pom:=cell; 
  cell:=cell2; 
  cell2:=pom; 
end; 

function liczgrupe1( var tab:world):real; 

var 
   WU,g1,g2,g3:integer; 
   i,j:integer; 
begin 
  begin 
    krok:=0; 
    g1:=0; 
    g2:=0; 
    g3:=0; 
    for i:=1 to last do 
      for j:=1 to last do 
        if tab[i,j].alife then 
          begin 
            if tab[i,j].race=0 then 
              g1:=g1+1; 
            if tab[i,j].race=1 then 
              g2:=g2+1; 
            if tab[i,j].race=2 then 
              g3:=g3+1; 
            krok:=krok+1; 
          end; 
    ge1[i]:=g1; 
    ge2[i]:=g2; 
    ge3[i]:=g3; 
  end; 
  liczgrupe1:=ge1[i]; 
end; 

function liczgrupe2( var tab:world):real; 

var 
   WU,g1,g2,g3:integer; 
   i,j:integer; 
begin 
  begin 
    krok:=0; 
    g1:=0; 
    g2:=0; 
    g3:=0; 
    for i:=1 to last do 
      for j:=1 to last do 
        if tab[i,j].alife then 
          begin 
            if tab[i,j].race=0 then 
              g1:=g1+1; 
            if tab[i,j].race=1 then 
              g2:=g2+1; 
            if tab[i,j].race=2 then 
              g3:=g3+1; 
            krok:=krok+1; 
          end; 
    ge1[i]:=g1; 
    ge2[i]:=g2; 
    ge3[i]:=g3; 
  end; 
  liczgrupe2:=ge2[i]; 
end; 

function liczgrupe3( var tab:world):real; 

var 
   WU,g1,g2,g3:integer; 
   i,j:integer; 
begin 
  begin 
    krok:=0; 
    g1:=0; 
    g2:=0; 
    g3:=0; 
    for i:=1 to last do 
      for j:=1 to last do 
        if tab[i,j].alife then 
          begin 
            if tab[i,j].race=0 then 
              g1:=g1+1; 
            if tab[i,j].race=1 then 
              g2:=g2+1; 
            if tab[i,j].race=2 then 
              g3:=g3+1; 
            krok:=krok+1; 
          end; 
    ge1[i]:=g1; 
    ge2[i]:=g2; 
    ge3[i]:=g3; 
  end; 
  liczgrupe3:=ge3[i]; 
end; 

procedure MonteCarloStep(var Tab:world); 

var 
   a,steplenght,i,j,x,y,ni,nj:integer; 
begin 
  steplenght:=sqr(Last); 
  for a:=1 to steplenght do 
    begin 
      i:=1+random(Last); 
      j:=1+random(Last); 
      if Tab[i,j].alife then 
        if Tab[i,j].dominujacy then 
          begin 
            for x:=i-1 to i+1 do 
              for y:=j-1 to j+1 do 
                if not ((x=i) and (y=j)) then 
                  if(x>0)and(y>0)and(x<=Last)and(y<=last) and(tab[x,y].alife) then 
                    tab[x,y].race:=tab[i,j].race; 
            repeat 
              ni:=1+random(Last); 
              nj:=1+random(Last); 
            until not Tab[ni,nj].alife; 
            swap(Tab[i,j],Tab[ni,nj]); 
          end 
        else 
          begin 
            if tab[i,j].op_dom<>-1 then 
              if tab[i,j].cierpliwosc>0 then 
                tab[i,j].cierpliwosc:=tab[i,j].cierpliwosc-1 
              else 
                begin 
                  tab[i,j].cierpliwosc:=5; 
                  tab[i,j].race:=tab[i,j].op_dom; 
                end; 
          end; 
    end 
end; 

var 
   theworld:world; 
   step:integer; 
   gru1,gru2,gru3,MSt:real; 
   log:text; 

begin 
  clear; 
  writeln('Podaj praw. zycia'); 
  readln(zycie); 
  writeln('Podaj praw. opcji 0 dominuj¹cej (zielonej) , zakres 0 - 1'); 
  readln(p1); 
  writeln('Podaj praw. opcji 1 pomarañczowej rewolucji z czerwonym przywódc¹, zakres',p1:3:3,' - 1'); 
  readln(p2); 
  clear; 
  assign(log,'c:/gettto45.log'); 
  rewrite(log); 
  writeln(log,last,'x',last,'p=',zycie,'r=',howmanyraces); 
  writeln(log,'step',chr(9),'meanstres',chr(9),'grupa1',chr(9),'grupa2',chr(9),'grupa3'); 
  step:=0; 
  init(theworld); 
  repeat 
    MoveTo(0,Last*side+10); 
    Pen(1,0,0,0); 
    brush(1,255,255,255); 
    calculatestres(theworld);
    MSt:=meanstres(theworld); 
    gru1:=liczgrupe1(theworld); 
    gru2:=liczgrupe2(theworld); 
    gru3:=liczgrupe3(theworld); 
    writeln(step,'',gru1:10:8); 
    writeln(log,step,chr(9),MSt,chr(9),gru1,chr(9),gru2,chr(9),gru3);  
    if step mod 10=0 then 
      draw(theworld,10,10,side); 
    montecarlostep(theworld); 
    step:=step+1; 
  until isEvent; 
  close(log); 
end.
