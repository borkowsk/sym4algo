program pierwiastki;

var
  a , b , c , delta , x1 , x2 , x0 : real;

begin
  writeln ( 'Program Marty Rojek' ) ;
  writeln ;

  writeln ( 'y=ax^2+bx+c' ) ;
  writeln ( 'Podaj wspolczynniki:' ) ;
  write ( 'a: ') ;  readln ( a ) ;
  write ( 'b: ') ;  readln ( b ) ;
  write ( 'c: ') ;  readln ( c ) ;

  delta := sqr( b ) - 4 * a * c ;

  if ( a = 0 ) then

    writeln ( 'Blad, rownanie nie jest rownaniem kwadratowym' )

  else

    begin

      if ( delta > 0 ) then

        begin

          x1 := ( -b - sqrt( delta ) ) / 2 * a;
          x2 := ( -b - sqrt( delta ) ) / 2 * a;
          writeln ( 'Pierwiastki: ');
          writeln ( 'x1=' , x1 : 1 : 4 , ' x2=' , x2 : 1 : 4 );

        end

      else if ( delta = 0 ) then

             begin

               x0 := -b / 2 * a ;
               writeln ( 'Pierwiastek: x0=' , x0 : 1 : 4) ;

             end

           else

            writeln ( 'Rownanie nie ma pierwiastkow' ) ;

      end ;

end.




