program FunkcjeMat; 

var 
   x,y:real; 

begin 
  writeln('Podaj x'); 
  readln(x); 
  y:=sin(x); 
  writeln('sin x= ',y:10:5); 
  
  y:=sin(x)+ln(x);
  writeln('sin x + ln x = ',y:10:5);
  {INNE FUNKCJE DO SPRAWDZENIE - }
  {Najedz kursorem na nazwê i wciœnij F1 - Help}
  {sin cos  arctan sqr sqrt  ln  exp
  round trunc} 
  {ord chr str val} 
  {random randomize} 
end.
