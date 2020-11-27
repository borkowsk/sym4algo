Program Losowe_bladzenie2; 
{Losowe bladzenie w obcym srodowisku} 
{
  Rozwi¹zanie Natalia Gonera - SPIK,
  ale wiêkszoœæ kodu i poprawki Wojciech Borkowski :-)
}

const 
   s=500; 
var 
   x,y,licznik,k,min,max,mean:integer; 

Function distance(x1,y1,x2,y2:real):real; 

begin 
  distance:=sqrt(sqr(x1-x2)+sqr(y1-y2)); 
end; 

begin 
  min:=99999999; 
  max:=0; 
  mean:=0; 
  for k:=0 to 99 do 
    begin 
      licznik:=0; 
      ellipse(0,0,s-1,s-1); 
      x:=s div 2; 
      y:=s div 2; 
     
       repeat 
        pen(1, k * 2 , licznik div 256, licznik mod 128); 
        {k <- WB } 
        point(x,y); 
        moveto(0,0); 
        write(k,' ',licznik); 
        x:=x+random(3)-1; 
        y:=y+random(3)-1; 
        licznik:=licznik+1; 
      until distance(x,y,s/2,s/2) >s/2; 
      
      if licznik < min then 
        min:=licznik; 
      if licznik > max then 
        max:=licznik; 
      mean:=mean+licznik; 
      moveto(0,s); 
      writeln(k,'. w kroku ', licznik,'  '); 
      writeln(' min ', min,'  '); 
      writeln(' max ', max,'  '); 
      writeln(' srednia ', mean  div (k+1),'  '); 
    end; 
end.
