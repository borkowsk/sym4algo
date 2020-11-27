PROGRAM Suma;

{created by Ania Gawryœ} 

CONST 
      k=-1234567; {k - sta³a koniec}

VAR 
      W,d:real;  {W - suma; d - podana wartoœæ}
 

BEGIN 
  Font(15,0,600 );
  WRITELN ('Program "SUMA"');
  Font (8,0,0); 
  WRITELN (''); 
  WRITELN (''); 
  TextColor( 17,62,124 );
  WRITELN ('Program s³u¿y do obliczenia sumy liczb, które podasz.'); 
  WRITELN ('Aby zakoñczyæ program i zobaczyæ jego wynik podaj wartoœæ "-1234567".'); 
  WRITELN ('Wartoœæ "-1234567" nie jest brana pod uwagê w obliczeniach sumy.'); 
  WRITELN (''); 
  WRITELN (''); 

  W:=0; 
  TextColor( 0,0,0 );
  WRITELN ('Podaj pierwsz¹ liczbê: '); 
  READLN (d); 
  W:=W+d; 
   
     REPEAT 
       WRITELN ('+'); 
       READLN (d); 
       W:=W+d; 
     UNTIL 
       d=k;    
  
  WRITELN ('');
  TextColor( 17,62,124 );  
  WRITELN ('Poda³eœ wartoœæ "-1234567", która koñczy program.');            
  WRITELN ('Suma podanych liczb wynosi: ',W+1234567);         
  WRITELN ('czyli: ',W+1234567:8:4,'.'); 
                           
END.