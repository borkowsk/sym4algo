(*From: "Zuzanna" <zoozana@op.pl>
To: "Wojciech Borkowski" <borkowsk@spik.swps.edu.pl>
Subject: 
Date: 11 czerwca 2005 23:02

Witam,
Mam problem, niby juz wszystko dzia³a dobrze, ale nie chce mi teraz zapisywac do pliku, nie wiem mo¿e jestem zmêczona i nie widze jakiegos glupiego b³êdu, ale bêdê wdziêczna za pomoc, bo jutro mamy sie spotkac i analizowac ten program, a tak to nic z teg



o nie bêdzie :(

Poza tym chcia³am sie spytaæ czy mo¿na oddaæ prace we wtorek lub œrode tak zebysmy ewentualnie mogli ja jeszcze po Pana uwagach poprawic? A jesli nie to w jakich godzinach i gdzie mozna Pana w ISSie zlapac w poniedzialek.

Pozdrawiam
Zuzanna*) 
program mróweczki; 

type 
   agent=record 
        alife:boolean; 
        feromon:integer; 
        food:boolean; 
        carrier:boolean; 
   end; 

   const 
   maxferomon=30; 
   probalife=0.02; 
   probfood=0.13; 
   probreproduct=0.5; 
   last=80; 
   width=100; 
   height=100; 
   side=8; 
   sidef=5;
   wizja=10;
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
          begin 
            tab[i,j].alife:=true; 
            tab[i,j].food:=false; 
          end 
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

procedure changecolor(v,min,max:real); 

begin 
  v:=(v-min)/(max-min); 
  v:=v*266; 
  brush(1,round(v*0.9),round(v*0.9),round(v*0.1)); 
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
            brush(1,255,0,0); 
            ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
          end 
        else 
          if tab[i,j].food then 
            begin 
              brush(1,99,200,200); 
              {ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); }
              rectangle(x+i*side-side, y+j*side-side, x+i*side, y+j*side);
            end 
          else 
            if tab[i,j].carrier then 
              begin 
                brush(1,255,0,255); 
                ellipse(x+i*side-side, y+j*side-side, x+i*side, y+j*side); 
              end 
            else 
              if tab[i,j].feromon>0 then 
                begin 
                  brush(1,255,255,255); 
                  pen(1,255,255,255);
                  rectangle(x+i*side-side, y+j*side-side, x+i*side, y+j*side);
                  changecolor(tab[i,j].feromon,maxferomon-1,0); 
                  ellipse(x+i*side-sidef, y+j*side-sidef, x+i*side, y+j*side); 
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

function randomneighbour(j,i:integer;var k,l:integer;var tab:world):boolean; 

var 
   ilelos,losowanie:integer; 
   wynik:boolean; 

   label 777; 
begin 
  wynik:=true; 
  ilelos:=0; 
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
    ilelos:=ilelos+1; 
    if ilelos>8 then 
      begin 
        wynik:=false; 
        goto 777; 
      end; 
  until inside(k,l) and not (tab[k,l].feromon=maxferomon-1) ; 
  777: randomneighbour:=wynik; 
end; 

function checkfood(var tab:world;m,n:integer):integer; 

begin 
  if(m>0)and(n>0)and(m<=last)and(n<=last)and(tab[m,n].food) then 
    checkfood:=1 
  else 
    checkfood:=0; 
end; 

function countfood(var tab:world; var k,l:integer):integer; 

begin 
  countfood:=checkfood(tab,k+1,l)+checkfood(tab,k-1,l)+checkfood(tab,k,l-1)+checkfood(tab,k,l+1); 
end; 

procedure montecarlostep(var tab:world;var stepout:text); 

var 
   a,i,j,k,l,steplenght,summ,step:integer; 
   theworld:world; 
   takeit,leaveit,emptystep:integer; 
begin 
  takeit:=0; 
  leaveit:=0; 
  emptystep:=0; 
  steplenght:=sqr(last); 
  writeln(stepout,'emptystep',chr(9),'leaveit',chr(9),'takeit'); 
  for a:=1 to steplenght do 
    begin 
      i:=1+random(last); 
      j:=1+random(last); 
      if tab[i,j].alife then 
        begin 
          if randomneighbour(i,j,k,l,tab) then 
            begin 
              {To ze zmienne i parametry nazywaja sie tak samo tu i we wnetrzu procedury nie oznacza, ze to to samo} 
              if tab[k,l].food then 
                begin 
                  tab[i,j].alife:=false; 
                  tab[i,j].feromon:=maxferomon; 
                  tab[k,l].food:=false; 
                  tab[k,l].carrier:=true; 
                  takeit:=takeit+1; 
                end 
              else 
                if ((tab[k,l].feromon=1) or (tab[k,l].feromon=2) or (tab[k,l].feromon=3) or (tab[k,l].feromon=4))then 
                  begin 
                    tab[i,j].alife:=false; 
                    tab[k,l].alife:=true; 
                    tab[k,l].feromon:=0; 
                    emptystep:=emptystep+1; 
                  end 
                else 
                  if ((tab[k,l].carrier) or (tab[k,l].alife)) then 
                    tab[i,j].alife:=true 
                  else 
                    begin 
                      tab[i,j].alife:=false; 
                      tab[k,l].alife:=true; 
                      tab[i,j].feromon:=maxferomon; 
                      emptystep:=emptystep+1; 
                    end; 
            end; 
        end 
      else 
        if tab[i,j].carrier then 
          begin 
            if randomneighbour(i,j,k,l,tab)then 
              begin 
                if tab[k,l].feromon>0 then 
                  begin 
                    tab[i,j].carrier:=false; 
                    tab[k,l].carrier:=true; 
                    tab[k,l].feromon:=0; 
                    emptystep:=emptystep+1; 
                  end 
                else 
                  if ((tab[k,l].alife) or (tab[k,l].carrier)) then 
                    tab[i,j].carrier:=true 
                  else 
                    if tab[k,l].food then 
                      begin 
                        if countfood(theworld,k,l)>2 then; 
                        begin 
                          tab[k,l].food:=true; 
                          tab[i,j].alife:=true; 
                          tab[i,j].food:=true; 
                          tab[i,j].carrier:=false; 
                          leaveit:=leaveit+1; 
                        end; 
                      end 
                    else 
                      begin 
                        tab[i,j].carrier:=false; 
                        tab[k,l].carrier:=true; 
                        tab[i,j].feromon:=maxferomon; 
                        emptystep:=emptystep+1;; 
                      end; 
              end; 
          end; 
    end; 
  for i:=1 to last do 
    for j:=1 to last do 
      begin 
        if tab[i,j].feromon>0 then 
          tab[i,j].feromon:=tab[i,j].feromon-1; 
      end; 
  moveto(0,last*side+50); 
  pen(1,0,0,0); 
  brush(1,255,255,255); 
  writeln(emptystep); 
  writeln(leaveit); 
  writeln(takeit); 
  writeln(stepout,emptystep,chr(9),leaveit,chr(9),takeit); 
end; 

function clustering(tab:world):real;
var 
   k,l,i,j:integer; 
   cluster,summ:real; 
   step:integer; 
begin 
  step:=0; 
  summ:=0; 
  cluster:=0; 
  for i:=1 to last do 
    for j:=1 to last do 
      begin 
        if tab[i,j].food then 
          begin 
            summ:=(checkfood(tab,i,j+1)+checkfood(tab,i,j-1)+checkfood(tab,i+1,j)+checkfood(tab,i-1,j)); 
            cluster:=cluster+summ; 
            step:=step+1; 
          end; 
      end; 
  clustering:=cluster/step/4; 
end; 

var 
   theworld:world; 
   step2:integer; 
   mst:real; 
   out:text; 
   stepout:text; 

begin 
  {assign(out,'D:\program files\Algo Demo\kroki.out'); } 
  assign(stepout,'.\kroki.out'); 
  rewrite(stepout); 
  { assign(out,'D:\program files\Algo Demo\mrowkos.log'); } 
  assign(out,'.\mrowkos.log'); 
  rewrite(out); 
  writeln(out,'step2',chr(9),'clustering'); 
  step2:=0; 
  init(theworld); 
  draw(theworld,10,10,side); 
  repeat 
    moveto(0,last*side+10); 
    pen(1,0,0,0); 
    brush(1,255,255,255); 
    writeln(step2,' ',clustering(theworld)); 
    writeln(out,step2,chr(9),clustering(theworld)); 
    if step2 mod Wizja=0 then 
      draw(theworld,10,10,side); 
    montecarlostep(theworld,stepout); 
    step2:=step2+1; 
  until isevent; 
  close(out); 
  close(stepout); 
end.
