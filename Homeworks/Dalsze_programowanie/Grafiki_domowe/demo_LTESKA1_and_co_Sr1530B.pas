{Lukasz Teska 11146}
{jest to ze-tak-powiem moja czesc wkladu w prace grupowa}

Program ElipsaDemo; 
var a,b,c,d,e,f,g:integer;



Begin
a:=0;b:=0;c:=500;d:=0;e:=0;f:=500;g:=0;
Writeln('Pokaz graficznych mozliwosci srodowisa ALGO');delay(2000);clear;
Writeln('1.Latajace kola');delay(3000);clear;
while  a<100
do begin
{pen(random(10),random(255),random(255),random(255));}
brush(1,random(255),random(255),random(255));

  Ellipse(Random(540), Random(540), random(480), random(480));
  
 delay(55);clear;
  a:=a+1;
  end;
 Writeln('2.Traba jerychonska');delay(2000);clear;
 while  b<675
do begin
pen(random(2),b,b,random(255));
  Ellipse(1,b,b,400);
  
  delay(10);

  b:=b+1;
  end; clear;
  Writeln('3.Ucho');delay(2000);clear;
   while  c>0
do begin

pen(random(7),c,random(255),d);
  Ellipse(1,c,d,800);
  
  
 delay(8);
  c:=c-1;
  d:=d+1;
  end; clear;
  Writeln('4.Budowanie szalasu');delay(2000);clear;
  
  while e<599
  do begin
  line(random(100),random(55),random(e),e);
  {line(1,random(55),f,f);}
  pen(12,random(255),random(255),random(255));
  e:=e+1;
  f:=f-1;
  delay(10);
  end;clear;
  Writeln('5.Bierki');delay(3000);clear;
  while g<223456
  do begin
  line(random(800),random(800),random(300),random(300));
  pen(5,random(255),random(255),random(255));
  g:=g+1;
 

  end;
   Writeln('Dziekuje za obejrzenie mojego programu');delay(3000);clear;
  
  
  
  
  
  
  
end.