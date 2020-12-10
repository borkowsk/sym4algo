program pliki_tekstowe;

var
  in , out : text ;
  a        : char ;
  filename : string ;

begin
  
  writeln ( 'Usuwanie podwojnych spacji' ) ;
  write ( 'Podaj nazwe pliku WEjsciowego: ' ) ;
  readln ( filename ) ; 
  assign ( in , filename ) ; { zakladam, ze plik istnieje
                               - nie wiem czy w ALGO mozna zmieniac 
                               wskazania dla kompilatora }
  write ( 'Podaj nazwe pliky WYjsciowego: ' ) ;
  readln ( filename ) ;
  assign ( out , filename ) ;

  reset ( in ) ;
  rewrite ( out ) ;
  
  writeln ( 'Czytanie i przerabianie pliku: ' ) ;
  writeln ( '------------------------------' ) ;
  while not eof ( in ) do begin
    
    read ( in , a ) ;
    write ( out , a ) ;
    write ( a ) ;

    if ( a = ' ' ) then begin
      
      while ( ( a = ' ' ) AND ( not eof ( in ) ) ) do read ( in , a );
      
      if not eof ( in ) then begin 
        write ( out , a ) ; 
        write ( a ) ;
      end ;
      
    end ;
    
  end;
  writeln ;
  writeln ( '------------------------------' ) ;
  
  close ( out );
  close ( in ) ;
  
end.