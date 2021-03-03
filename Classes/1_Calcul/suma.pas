program suma; 

var 
   x:real; 
   s:real;

   const 
   y=0; 

Begin 
s:=0;
  x:=0 ; 
  Repeat 
    writeln ('podaj liczbe'); 
    readln (x);
    s:=s+x ; 
  until x=y ;
  
   writeln ('suma wynosi:',s:0:0)  
End.