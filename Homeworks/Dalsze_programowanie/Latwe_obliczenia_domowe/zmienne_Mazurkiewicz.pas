Program Zmienne;

const nazwa='Program "Zmienne" Piotr Mazurkiewicza';

p=2; 
r=1;
var x,y:real; 

Begin

        {Wyra¿enie 1:  (x+2)*3+1/(y-2*x) }

   begin

    x:=p+2;
    y:=p-2*p;
    x:=x*3;
    y:=1/y;
    x:=x+y;



     writeln('Obliczenia "na raty"');
     writeln(x);

     writeln('Obliczenie "(x+2)*3+1/(y-2*x)"');
     Writeln((p+2)*3+1/(p-2*p)); 
     Writeln

   end;

        {Wyra¿enie 2: ((1+x)*10)/(y*3) }

   begin


    x:=1+p;
    x:=x*10;
    y:=r*3;
    x:=x/y;



     writeln('Obliczenia "na raty"');
     writeln(x);

     writeln('Obliczenie "((1+x)*10)/(y*3)"');
     Writeln(((1+p)*10)/(r*3)); 
     Writeln
     
   end;

        {Wyra¿enie 3: 7*7-3/(x*y-1)+6*6 }

   begin

    x:=7*7;
    x:=x-3;
    y:=p*r;
    y:=y-1;
    x:=x/y;
    y:=6*6;
    x:=x+y;



    writeln('Obliczenia "na raty"');
    writeln(x);

    writeln('Obliczenie "7*7-3/(x*y-1)+6*6"');
    Writeln(7*7-3/(p*r-1)+6*6); 
   
   end

End.