PROGRAM Suma;

{created by Ania Gawry�} 

CONST 
      k=-1234567; {k - sta�a koniec}

VAR 
      W,d:real;  {W - suma; d - podana warto��}
 

BEGIN 
  Font(15,0,600 );
  WRITELN ('Program "SUMA"');
  Font (8,0,0); 
  WRITELN (''); 
  WRITELN (''); 
  TextColor( 17,62,124 );
  WRITELN ('Program s�u�y do obliczenia sumy liczb, kt�re podasz.'); 
  WRITELN ('Aby zako�czy� program i zobaczy� jego wynik podaj warto�� "-1234567".'); 
  WRITELN ('Warto�� "-1234567" nie jest brana pod uwag� w obliczeniach sumy.'); 
  WRITELN (''); 
  WRITELN (''); 

  W:=0; 
  TextColor( 0,0,0 );
  WRITELN ('Podaj pierwsz� liczb�: '); 
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
  WRITELN ('Poda�e� warto�� "-1234567", kt�ra ko�czy program.');            
  WRITELN ('Suma podanych liczb wynosi: ',W+1234567);         
  WRITELN ('czyli: ',W+1234567:8:4,'.'); 
                           
END.