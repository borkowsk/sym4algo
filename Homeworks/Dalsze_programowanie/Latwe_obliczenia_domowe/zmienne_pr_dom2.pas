Program Zmienne;
  const nazwa='Program Ani Gawryœ do obliczania równañ ze zmiennymi' ;
        x=2;
        y=3;

  var a,b,c:real;

 Begin

  writeln(nazwa);
  writeln('');
  writeln('');

{Obliczenie wyra¿enia nr 1}

   a:=x+2;
   a:=a*3;
   b:=2*x;
   b:=y-b;
   b:=1/b;
   a:=a+b;


   writeln('Wyra¿enie nr 1: "(x+2)*3+1/(y-2*x)"');
   writeln('');
   writeln('Obliczenia "na raty"');
   writeln(a);
   writeln('');
   writeln('Obliczenie "za jednym zamachem"');
   writeln((x+2)*3+1/(y-2*x));

{Obliczenie wyra¿enia numer 2}

   a:=1+x;
   a:=a*10;
   b:=y*3;
   a:=a/b;

   writeln('');
   writeln('');
   writeln('Wyra¿enie nr 2: "(x+2)*3+1/(y-2*x)"');
   writeln('');
   writeln('Obliczenia "na raty"');
   writeln(a);
   writeln('');
   writeln('Obliczenie "za jednym zamachem"');
   writeln(((1+x)*10)/(y*3));


{Obliczenie wyra¿enia numer 3}

   a:=7*7;
   b:=x*y;
   b:=b-1;
   b:=3/b;
   c:=6*6;
   a:=a-b+c;

   writeln('');
   writeln('');
   writeln('Wyra¿enie nr 3: "7*7-3/(x*y-1)+6*6"');
   writeln('');
   writeln('Obliczenia "na raty"');
   writeln(a);
   writeln('');
   writeln('Obliczenie "za jednym zamachem"');
   writeln(7*7-3/(x*y-1)+6*6);

 End. 
