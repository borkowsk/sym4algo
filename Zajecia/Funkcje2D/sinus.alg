Program sinus; 

Const 
   s=0.3; 
   p=1; 
Var 
   x:real; 

Begin 
  x:=0; 
  WriteLn(x:5:3); 
  While x<p do 
    x:=sin(x)+s; 
  If x>1 then 
    Write('**********'); 
  WriteLn(x:5:3); 
end.