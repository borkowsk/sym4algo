program sumowanie;

const koniec=999;

var
  sum , input : real;

begin
  writeln( 'Program written by: Joanna Obszynska' );
  writeln;
  writeln ( 'Sumowanie' );
  writeln;
  writeln;

  { wstepne wartosci }
  input := koniec+1;
  sum   := 0;

  while ( input <> koniec ) do begin
    write ( 'Wprowadz liczbe do sumowania ( ' , koniec , ' - koniec ): ' );
    readln ( input );
    sum := sum + input;
  end;
  sum := sum - input;


  writeln ( 'Wynik sumowania: ' , sum :3 :3 );
end.
