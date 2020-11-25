Program ZgadnijCoTo; 

Const 
   Skok=10; 

Procedure wylosuj_wype³nienie; 

Var 
   r,g,b:integer; 
Begin 
  r:=random(256); 
  g:=random(256); 
  b:=random(256); 
  Brush(1,r,g,b); 
end; 

Procedure Narysuj(x,y,r,s:integer); 

Var 
   i:integer; 
Begin 
  For i:=1 to s do 
    Begin 
      wylosuj_wype³nienie; 
      Ellipse(x-r+i*Skok,y-r+i*Skok*2,x+r-i*Skok,y+r); 
    end; 
end; 

Procedure Zmieñ(x,y,r,s:integer); 

Var 
   i:integer; 
Begin 
  For i:=1 to s do 
    Begin 
      Delay(50); 
      wylosuj_wype³nienie; 
     { Fill(x,y-r+i*Skok*2+2); }
      Point(x,y-r+i*Skok*2+2); 
      write(' '); 
    end; 
end; 

Begin 
  Narysuj(150,150,150,10); 
  While not IsEvent do 
    Begin 
      Zmieñ(150,150,150,10); 
    end; 
end.
