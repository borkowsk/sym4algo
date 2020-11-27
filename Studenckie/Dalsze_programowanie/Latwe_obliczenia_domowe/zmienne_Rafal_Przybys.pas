Program zmienne; 

Const 
   nazwa='program "zmienne" Rafala Przybys' ;
   p=3; 
Var 
   a1,b1,a2,b2,a3,b3,c3,x,y:real; 

Begin 
  x:=6; 
  y:=10; 
  
  a1:=(x+2); 
  a1:=a1*3; 
  b1:=2*x; 
  b1:=y-b1; 
  b1:=1/b1; 
  
  a1:=a1+b1; 
  
  a2:=1+x; 
  a2:=a2*10; 
  b2:=y*3; 
  a2:=a2/b2;
   
  a3:=7*7; 
  b3:=x*y; 
  b3:=b3-1; 
  b3:=3/b3; 
  c3:=6*6; 
  a3:=a3-b3+c3; 
  
  WriteLn('obliczenia na raty'); 
  WriteLn('1 dzialanie'); 
  WriteLn(a1); 
  WriteLn('2 dzialanie'); 
  WriteLn(a2); 
  WriteLn('3 dzialanie'); 
  WriteLn(a3); 
  Writeln;
  WriteLn('obliczanie "(x+2)*3+1/(y-2*x)"'); 
  WriteLn((x+2)*3+1/(y-2*x)); 
  WriteLn('obliczanie "((1+x)*10/(y*3)"'); 
  WriteLn((1+x)*10/(y*3)); 
  WriteLn ('obliczanie" (7*7-3/(x*y-1)+6*6)"'); 
  WriteLn((7*7-3/(x*y-1)+6*6)); 
end.
