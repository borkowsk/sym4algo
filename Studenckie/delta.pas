Program Delta;

{Przesy³am zaleg³e prace domowe.
Bardzo proszê o odpowiedŸ czy dosz³y.
 
Pozdrawiam,
Magdalena W³odarczyk 
+ S³omiñska, Kudra

}

Var Pierwiastek1,Pierwiastek2,a,b,c,delta : real;

Begin
WriteLn( 'Wprowadz kolejno liczby do rownania Ax2 + Bx + C = 0' );
Write ('a = ');
ReadLn( a );
Write ('b = ');
ReadLn( b );
Write ('c = ');
ReadLn( c );

delta := (b*b)-(4*a*c);
if delta < 0 then
   Writeln('Rownanie ',a:4:1,'x2 + ',b:4:1,'x + ',c:4:1,' = 0 nie ma rozwiazania')
else
   if delta > 0 then
      begin
         Pierwiastek1 := (-b+sqrt(delta))/(2*a);
         Pierwiastek2 := (-b-sqrt(delta))/(2*a);
         Writeln('Rownanie ',a:4:1,'x2 + ',b:4:1,'x + ',c:4:1,' = 0 ma 2 rowziazania');
         Writeln('x1 = ',Pierwiastek1:4:1);
         Writeln('x2 = ',Pierwiastek2:4:1);
      end
   else
      begin
         Pierwiastek1 := (-b+sqrt(delta))/(2*a);
         Writeln('Rownanie ',a:4:1,'x2 + ',b:4:1,'x + ',c:4:1,' = 0 ma 1 rowziazanie');
         Writeln('x1 = ',Pierwiastek1:4:1);
      end;
End.

