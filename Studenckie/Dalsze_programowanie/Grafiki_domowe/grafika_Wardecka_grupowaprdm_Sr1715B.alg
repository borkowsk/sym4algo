{
Dorota Wardecka, Arkadiusz Kaümierczak, Konrad Stebnicki, Krzysztof Jankowski, Adam Lewanowicz
}


Program pracadomowa; 


Procedure trawa; 

begin 
  pen(3,40, 189, 48); 
  brush(1,40, 189, 48); 
  rectangle(1000,500,0,1000); 
end; 

Procedure jablko; 

begin 
  pen (1,255,255,255); 
  brush(1,82, 228, 89); 
  ellipse(410,400,425,360); 
  brush (1,232, 0, 5); 
  Ellipse( 370,400,470,500); 
end; 

Procedure sinus; 
 var  
   h: integer; 
begin 
  moveto(0, 50);
  pen(4, 128, 255, 255);
 
  for h:=1 to 1000 do 
    lineto(h, round(50-50*Sin(h/20)));
    delay(10); 

end; 


Procedure tekst;
begin
writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');writeln('');

TextColor( 255, 17, 17 );
writeln('DOROTA');
TextColor(0, 255, 64);
writeln('ARKADIUSZ');
TextColor(128, 0, 128);
writeln('KONRAD');
TextColor(89, 62, 249);
writeln('ADAM');
TextColor(255, 128, 0);
writeln('KRZYSIEK');
end;

Procedure robak; 

var 
   i:integer; 
begin 
  for i:=0 to 180 do 
    begin 
      trawa; 
      jablko; 
     
      moveto(0,i); 
      pen(1,255,255,255); 
      brush(1,123,213,034); 
      Ellipse (205+i,480,10+i,500) ; 
      ellipse (210+i,480,190+i,500); 
      clear; 
      delay(10); 
    end; 
end; 



Begin 
 
   robak; 
   tekst;
   sinus;
  jablko; 
  trawa; 
end.