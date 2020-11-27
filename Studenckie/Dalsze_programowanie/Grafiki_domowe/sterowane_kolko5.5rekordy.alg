Program sterowane_kolko; 

Const 
   maxwr=66; 
   zasiêgb=35; 
   r=6; 
   rekordy='rekordy.txt';
   {'C:/users/public/rekordy.txt'; } 
type 
   { tuzin=1..12; } 
   rekin=record 
        rek:integer; 
        im:string; 
   end; 
Var 
   records:array[1..3] of rekin; 
   plik:text; 
   i,ilewr,k,l,z,x,y,x2,y2,lvl,tl,lives,coins,r2,cenabom,cenatl,cenalv,st,trudnosc:integer; 
   xbom,ybom,zegbom:integer; 
   xwr,ywr:array [ 1..maxwr ] of integer; 

Procedure zapisz_rekordy; 

Begin 
  assign(plik,rekordy); 
  rewrite(plik); 
  writeln(plik,records[1].rek,' ',records[1].im); 
  writeln(plik,records[2].rek,' ',records[2].im); 
  writeln(plik,records[3].rek,' ',records[3].im); 
  close(plik) 
end; 

Procedure wczytaj_rekordy; 

Begin 
  assign(plik,rekordy); 
  reset(plik); 
  readln(plik,records[1].rek,records[1].im); 
  readln(plik,records[2].rek,records[2].im); 
  readln(plik,records[3].rek,records[3].im); 
  close(plik) 
end; 

Procedure Bomba(x,y,zeg:integer;kasuj:boolean); 

Begin 
  if kasuj then 
    pen(1,255,255,255) 
  else 
    pen(1,0,0,0); 
  if zeg mod 2=0 then 
    Ellipse( x-4, y-3, x+4, y+3) 
  else 
    Ellipse( x-3, y-4, x+3, y+4); 
end; 

Procedure naprowadzanie(var xb,yb:integer); 

var 
   xs,ys,i,poduw:integer; 
Begin 
  xs:=0; 
  ys:=0; 
  poduw:=0; 
  for i:=1 to ilewr do 
    if (xwr[i]<365)and(xwr[i]>0)and(ywr[i]<365)and(ywr[i]>0) then 
      begin 
        poduw:=poduw+1; 
        xs:=xs+xwr[i]; 
        ys:=ys+ywr[i]; 
      end; 
  if poduw>0 then 
    begin 
      xs:=xs div poduw; 
      ys:=ys div poduw; 
      if xb<xs then 
        xb:=xb+7 
      else 
        xb:=xb-7; 
      if yb<ys then 
        yb:=yb+7 
      else 
        yb:=yb-7; 
    end; 
end; 

Function dystans(x1,y1,x2,y2:integer):real; 

Var 
   a,b,c:real; 
Begin 
  a:=(x1-x2); 
  a:=a*a; 
  b:=(y1-y2); 
  b:=b*b; 
  c:=a+b; 
  if c=0 then 
    dystans:=0 
  else 
    dystans:=sqrt(c) 
end; 

procedure odrzut(x,y:integer;var xd,yd:integer); 

const 
   silaodrz=10000; 
var 
   dyst,od,a,b,ao,bo,delta,xo,yo,skala:real; 
begin 
  {xd:=365+random(300); 
  yd:=365+random(300);} 
  dyst:=dystans(x,y,xd,yd); 
  if dyst>0 then 
    begin 
      od:=silaodrz/dyst; 
      skala:=od/dyst; 
      a:=xd-x; 
      b:=yd-y; 
      ao:=a*skala; 
      bo:=b*skala; 
      xd:=round(ao+x); 
      yd:=round(bo+y); 
    end 
  else 
    begin 
      od:=silaodrz; 
      xd:=round(od); 
      yd:=round(od); 
    end; 
end; 

Procedure wybuch(x,y:integer); 

var 
   i:integer; 
Begin 
  pen(1,0,0,0); 
  for i:=1 to zasiêgb do 
    begin 
      Ellipse( x-i, y-i, x+i, y+i); 
      delay(5); 
    end; 
  pen(1,255,255,255); 
  for i:=1 to zasiêgb do 
    Ellipse( x-i, y-i, x+i, y+i); 
  pen(1,0,0,0); 
  for i:=1 to ilewr do 
    if dystans(x,y,xwr[i],ywr[i])<zasiêgb then 
      begin 
        coins:=coins+4; 
        odrzut(x,y,xwr[i],ywr[i]); 
      end; 
end; 

Procedure circle(x,y,r:integer); 

Begin 
  Ellipse( x-r, y-r, x+r, y+r); 
end; 

Procedure diabe³ek(ix:integer;kasuj:boolean); 

Begin 
  if kasuj then 
    pen(1,255,255,255) 
  else 
    pen(1,0,0,0); 
  line(xwr[ix],ywr[ix],xwr[ix]-6,ywr[ix]-4); 
  line(xwr[ix],ywr[ix],xwr[ix]+6,ywr[ix]-4); 
  if kasuj then 
    Brush(1,255,255,255) 
  else 
    Brush(1,0,0,0); 
  Ellipse(xwr[ix]-4,ywr[ix]-3,xwr[ix]+4,ywr[ix]+3); 
  brush(0,255,255,255); 
  pen(1,255,255,255); 
  point(xwr[ix]-2,ywr[ix]); 
  point(xwr[ix]+2,ywr[ix]); 
  pen(1,0,0,0); 
end; 

Function z³apa³(inx:integer):boolean; 

Var 
   a,b,c:real; 
Begin 
  a:=(xwr[inx]-x); 
  a:=a*a; 
  b:=(ywr[inx]-y); 
  b:=b*b; 
  c:=a+b; 
  z³apa³:=((c=0)or(sqrt(c)<r+4.5)) 
end; 

Procedure status; 

Begin 
  MoveTo(20,375); 
  WriteLn('coins: ',coins,'   '); 
  MoveTo(20,395); 
  Writeln('level ',lvl,'   '); 
  MoveTo(150,395); 
  writeln('lives ',lives,'   ');
  moveto(150,375); 
  writeln('teleports: ',tl,'   '); 
end; 

Label 1; 

Label 2; 

Begin 
  records[1].rek:=0; 
  records[2].rek:=0; 
  records[3].rek:=0; 
  records[1].im:='nikt'; 
  records[2].im:='nikt'; 
  records[3].im:='nikt'; 
  wczytaj_rekordy; 
  {Panel} 
  st:=0; 
  cenabom:=0; 
  cenatl:=0; 
  cenalv:=0; 
  repeat 
    Rectangle( 0, 0, 365,365); 
    moveto(157,10); 
    writeln('*MAGGUS*'); 
    moveto(130,40); 
    writeln('Dificult level'); 
    moveto(30,70); 
    writeln('easy'); 
    moveto(150,70); 
    writeln('medium'); 
    moveto(270,70); 
    writeln('hard'); 
    moveto(50,100); 
    writeln('cena bomby:'); 
    moveto(50,130); 
    writeln('cena teleportacji:'); 
    moveto(50,160); 
    writeln('cena ¿ycia:'); 
    if st=1 then 
      begin 
        moveto(157,250); 
        writeln('start'); 
      end; 
    moveto(50,270); 
    writeln('easy: ',records[1].im,' level: ',records[1].rek); 
    moveto(50,295); 
    writeln('medium: ',records[2].im,' level: ',records[2].rek); 
    moveto(50,320); 
    writeln('hard: ',records[3].im,' level: ',records[3].rek); 
    Event(k,l,z); 
    if (k=2)and(l>30)and(l<70)and(z>70)and(z<80) then 
      begin 
        pen(1,0,0,0); 
        Rectangle( 25, 65, 75,90); 
        pen(1,255,255,255); 
        Rectangle( 145, 65, 215,90); 
        Rectangle( 265, 65, 315,90); 
        pen(1,0,0,0); 
        st:=1; 
        trudnosc:=1; 
        cenabom:=2; 
        cenatl:=10; 
        cenalv:=100; 
      end; 
    if (k=2)and(l>150)and(l<210)and(z>70)and(z<80) then 
      begin 
        pen(1,0,0,0); 
        Rectangle( 145, 65, 215,90); 
        pen(1,255,255,255); 
        Rectangle( 25, 65, 75,90); 
        Rectangle( 265, 65, 315,90); 
        pen(1,0,0,0); 
        st:=1; 
        trudnosc:=2; 
        cenabom:=4; 
        cenatl:=20; 
        cenalv:=200; 
      end; 
    if (k=2)and(l>270)and(l<310)and(z>70)and(z<80) then 
      begin 
        pen(1,0,0,0); 
        Rectangle( 265, 65, 315,90); 
        pen(1,255,255,255); 
        Rectangle( 145, 65, 215,90); 
        Rectangle( 25, 65, 75,90); 
        pen(1,0,0,0); 
        st:=1; 
        trudnosc:=3; 
        cenabom:=6; 
        cenatl:=40; 
        cenalv:=400; 
      end; 
    if st=1 then 
      begin 
        moveto(157,250); 
        writeln('start'); 
      end; 
    moveto(270,100); 
    writeln(cenabom); 
    moveto(270,130); 
    writeln(cenatl); 
    moveto(270,160); 
    writeln(cenalv); 
  until (st=1)and(k=2)and(l>157)and(l<207)and(z>240)and(z<260); 
  clear; 
  {pocz¹tek gry} 
  ilewr:=1; 
  lvl:=1; 
  tl:=8; 
  lives:=5; 
  r2:=7; 
  coins:=12; 
  zegbom:=-1; 
  x2:=random(350); 
  y2:=random(350); 
  1: 
  {pocz¹tek poziomu} x:=x2; 
  y:=y2; 
  x2:=random(350); 
  y2:=random(350); 
  For i:=1 to ilewr do 
    repeat 
      xwr[i]:=random(350); 
      ywr[i]:=random(350); 
    until dystans(x,y,xwr[i],ywr[i])>zasiêgb; 
  Repeat 
    circle(x,y,r); 
    Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
    Rectangle( 0, 0, 365,365);  
    For i:=1 to ilewr do 
      Begin 
        diabe³ek(i,true); 
        If xwr[i]<x then 
          xwr[i]:=xwr[i]+1 
        else 
          xwr[i]:=xwr[i]-1; 
        If ywr[i]<y then 
          ywr[i]:=ywr[i]+1 
        else 
          ywr[i]:=ywr[i]-1; 
        diabe³ek(i,false) 
      end; 
    if zegbom>0 then 
      begin 
        bomba(xbom,ybom,zegbom,true); 
        zegbom:=zegbom-1; 
        naprowadzanie(xbom,ybom); 
        if zegbom=0 then 
          begin 
            wybuch(xbom,ybom); 
            zegbom:=-1 
          end 
        else 
          bomba(xbom,ybom,zegbom,false) 
      end; 
    status; 
    If IsEvent then 
      Begin 
        event(k,l,z); 
        moveto(20,600); 
        write(k,',',l,',',z); 
        If (K=1)and(l=27) then 
          GoTo 2 
        else 
          if (k=1)and(l=32)and(zegbom<0)and(coins>=cenabom) then 
            begin 
              xbom:=x; 
              ybom:=y+r; 
              zegbom:=15; 
              coins:=coins-cenabom; 
            end 
          else 
            If (k=1)and(z=0)and(l=88)and(coins>=cenatl) then 
              Begin 
                tl:=tl+1; 
                coins:=coins-cenatl; 
              end; 
        If (k=1)and(z=0)and(l=90)and(coins>=cenalv) then 
          Begin 
            lives:=lives+1; 
            coins:=coins-cenalv; 
          end 
        else 
          If (k=1)and(l=40) then 
            Begin 
              Pen(1,255,255,255); 
              circle(x,y,r); 
              Rectangle( x2, y2, x2+r2*2+1,y2+r2*2+1); 
              Pen(1,0,0,0); 
              y:=y+4; 
            end; 
        If (k=1)and(l=38) then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+r2*2+1,y2+r2*2+1); 
            Pen(1,0,0,0); 
            y:=y-4; 
          end; 
        If (k=1)and(l=39) then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+r2*2+1,y2+r2*2+1); 
            Pen(1,0,0,0); 
            x:=x+4; 
          end; 
        If (k=1)and(l=37) then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
            Pen(1,0,0,0); 
            x:=x-4; 
          end; 
        If (k=1)and(l=13)and(tl>0) then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
            Pen(1,0,0,0); 
            tl:=tl-1; 
            x:=random(350); 
            y:=random(350); 
          end; 
        If (y>365)then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
            Pen(1,0,0,0); 
            y:=365 
          end; 
        If (x>365)then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
            Pen(1,0,0,0); 
            x:=365 
          end; 
        If (y<0)then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
            Pen(1,0,0,0); 
            y:=0 
          end; 
        If (x<0)then 
          Begin 
            Pen(1,255,255,255); 
            circle(x,y,r); 
            Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
            Pen(1,0,0,0); 
            x:=0 
          end; 
          status;
      end 
    else 
      Delay(100); 
    For i:=1 to ilewr do 
      If z³apa³(i) then 
        Begin 
          Pen(1,255,255,255); 
          circle(x,y,r); 
          Rectangle( x2, y2, x2+(r2*2)+1,y2+(r2*2)+1); 
          Pen(1,0,0,0); 
          lives:=lives-1; 
          y:=random(350); 
          x:=random(350); 
        end; 
    If (lives<1) then 
      GoTo 2; 
    If lives<1 then 
      GoTo 2; 
  until (x>x2+r2/2)and(x<x2+r2/2*3)and(y>y2+r2/2)and(y<y2+r2/2*3); 
  lvl:=lvl+1; 
  ilewr:=ilewr+1; 
  coins:=coins+2; 
  Clear; 
  GoTo 1; 
  2: Brush(1,255,255,255); 
  MoveTo(165,165); 
  WriteLn('GAME OVER'); 
  status; 
  if lvl>records[trudnosc].rek then 
    begin 
      records[trudnosc].rek:=lvl; 
      moveto(100,10); 
      writeln('rekordzisto! podaj imie: '); 
      moveto(125,25); 
      readln(records[trudnosc].im); 
      zapisz_rekordy 
    end 
end.
