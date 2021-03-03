Program Swieta; 


procedure bombka(x,y: integer; skala: real); 

var 
   kolor: integer; 
begin 
  kolor:=random(3); 
  Pen(2,0,0,0); 
  case kolor of 
    0: 
      Brush(1,255,232,70); 
    1: 
      Brush(1,204,102,153); 
    2: 
      Brush(1,51,153,255); 
  end; 
  ellipse(round(x-25*skala),round(y-25*skala),round(x+25*skala),round(y+25*skala)); 
  brush(1,255,255,255); 
  ellipse(round(x-15*skala),round(y-15*skala),round(x+5*skala), round(y+15*skala)); 
end; 

procedure swieczka(x,y: integer; skala: real); 

begin 
  brush(1,204,0,0); 
  rectangle(x,y,round(x+11*skala),round(y+30*skala)); 
  brush(1,255,255,0); 
  ellipse(round(x-1*skala),round(y),round(x+11*skala),round(y-20*skala)); 
  brush(1,255,255,255); 
  ellipse(round(x+3*skala),round(y),round(x+7*skala),round(y-15*skala)); 
end; 

procedure trojkat(x,y: integer; skala: real); 

begin 
  y:=round(y-24*skala); 
  pen(2,0,0,0); 
  brush(1,51,153,51); 
  Line(round(x-75*skala),round(y+80*skala),round(x+75*skala),round(y+80*skala)); 
  Line(x,y,round(x-75*skala),round(y+80*skala)); 
  Line(x,y,round(x+75*skala),round(y+80*skala)); 
  Fill(x,y+3); 
end; 

procedure trapez(x,y: integer; skala: real); 

begin 
  pen(2,0,0,0); 
  brush(1,51,153,51); 
  Line(round(x-75*skala),round(y+56*skala),round(x+75*skala),round(y+56*skala)); 
  Line(round(x-25*skala),y,round(x-75*skala),round(y+56*skala)); 
  Line(round(x+25*skala),y,round(x+75*skala),round(y+56*skala)); 
  Line(round(x+25*skala),y,round(x-25*skala),y); 
  Fill(x,y+3); 
end; 

procedure choinka(x,y:integer; skala: real; wysokosc: integer); 

var 
   i,yP:integer; 
   s: real; 
begin 
  s:=skala; 
  yP:=y; 
  for i:=1 to wysokosc-1 do 
    begin 
      trapez(x,y,s); 
      s:=s*0.7; 
      y:=round(y-56*s); 
    end; 
  trojkat(x,y,s); 
  s:=skala; 
  y:=yP; 
  for i:=1 to wysokosc do 
    begin 
      delay(400); 
      bombka(round(x+(10-random*17)*s), round(y+(10+random*36)*s), s*0.5*(0.5+random*0.5)); 
      delay(300); 
      bombka(round(x+(27-random*17)*s), round(y+(10+random*36)*s), s*0.5*(0.5+random*0.5)); 
      delay(200); 
      bombka(round(x+(10-random*17)*s), round(y+(10+random*36)*s), s*0.5*(0.5+random*0.5)); 
      delay(100); 
      bombka(round(x+(27-random*17)*s), round(y+(10+random*36)*s), s*0.5*(0.5+random*0.5)); 
      delay(100); 
      bombka(round(x+(45-random*17)*s), round(y+(10+random*36)*s), s*0.5*(0.5+random*0.5)); 
delay(100);
            swieczka(round(x-75*s),round(y+26*s),s);
            swieczka(round(x+64*s),round(y+26*s),s);
            s:=s*0.7; 
      y:=round(y-56*s); 
    end; 
end; 

var
z,y: integer;

Begin 
  randomize;
  writeln('Ile poziomów ma mieæ choinka?');
  Readln(z);
  choinka(300,400,2,z); 
  delay(300);
  MoveTo(0,40);
  Writeln('A ile razy mniejsza ma byæ druga choinka?');
  Read(y);
  choinka(80,170,2/y,4);
 end.