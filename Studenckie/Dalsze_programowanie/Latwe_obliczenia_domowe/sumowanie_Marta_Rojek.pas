program sumowanie ; 

const 
   koniec = -999 ; 
var 
   suma , input : real ; 

begin 
  writeln ( 'Program Marty Rojek' ) ; 
  writeln ; 
  writeln ( 'Sumowanie' ) ; 
  writeln ; 
  input := koniec+1 ; 
  { aby petla 'ruszyla'} 
  suma := 0 ; 
  { inicjowanie wartosci} 
  while ( input <> koniec ) do 
    begin 
      write ( 'Wprowadz liczbe do sumowania ( ' , koniec , ' - koniec ): ' ) ; 
      readln ( input ) ; 
      if ( input = koniec ) then 
        break ;
    suma := suma + input ;

  end;

  writeln ( 'Suma wprowadzonych wartosci: ' , suma :4 :4 ) ;

end.


