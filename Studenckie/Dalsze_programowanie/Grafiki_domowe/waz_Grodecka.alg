{uda�o mi si� jedynie sprawi�, �eby co� podobnego do w�a si� porusza�o,
a poniewa� wydaje mi si�, �e oddanie programu zaliczeniowego by�o obowi�zkowe, 
to oddaje ten kawa�ek programu, kt�ry uda�o mi si� i chcia�o napisa�} 
program waz; 

var 
   xk,yk,xp,yp,k,i,a:integer; 

procedure ruch; 

begin 
  k:=20; 
  xp:=250; 
  xk:=xp; 
  yp:=200; 
  yk:=yp; 
  for a:=1 to 60 do 
    begin 
      pen(5,0,255,255); 
      line(xp,yp,xp,yp); 
      xp:=xp+1; 
      a:=a+1; 
    end; 
  repeat 
    delay(10); 
    begin 
      i:=1; 
      xp:=xp+i; 
      xk:=xk+i; 
      pen(5,0,255,255); 
      line(xp,yp,xp,yp); 
    end; 
  until xp=400; 
  if xp=400 then 
    repeat 
      delay(10); 
      begin 
        yp:=yp+1; 
        pen(5,0,255,255); 
        line(xp,yp,xp,yp); 
      end; 
    until yp=500; 
end; 

begin 
  ruch; 
end.
