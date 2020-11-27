program spacje;

var
  plik_we , plik_wy : string ; 
  znak : char ;
  wejscie , wyjscie : text ;

begin
  writeln ( 'Podaj: ' ) ;
  write ( '1. Pliku do obrobki: ' ) ;
  readln ( plik_we ) ;

  assign ( wejscie , plik_we ) ;
  reset ( wejscie ) ;

  write ( '2. Plik koncowy: ' ) ;
  readln ( plik_wy ) ;
  assign ( wyjscie , plik_wy ) ;
  rewrite ( wyjscie ) ;
  
  writeln ( 'Obrabianie pliku ' , plik_we ) ;
  while not eof ( wejscie ) do begin
    
    read ( wejscie , znak ) ;
    
    if ( znak = ' ' ) then begin
    
      write ( wyjscie , znak ) ;
      while ( ( znak = ' ' ) AND ( not eof ( wejscie ) ) ) do read ( wejscie , znak );
    
    end;
    
    if ( znak <> ' ' ) then write ( wyjscie , znak ) ; { warunek istotny gdy wstawiamy spacje na koncu pliku }
    
  end;
  
  close ( wyjscie );
  close ( wejscie ) ;
  writeln ( 'KONIEC' ) ;
  
  
  
end.