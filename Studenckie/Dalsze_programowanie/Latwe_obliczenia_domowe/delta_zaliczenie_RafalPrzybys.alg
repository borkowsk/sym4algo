program rownanie ;

{ @autor: Rafa³ Przybyœ }


{ x0 - pierwiastek równania gdy istnieje tylko 1 taki pierwiastek
  x1,x2 - pierwiastki równania gdy istniej¹ 2 takie pierwiastki
  a,b,c - wspó³czynniki równania (kolejno: przy x^2, x, wyraz wolny)
  p,q -  zmienne pomocne przy wyznaczaniu postaci kanonicznej równania
}
      
  var
   a,b,c,delta,x1,x2,x0,p,q : real;
   znak : char;

begin
   writeln('Wyznaczanie pierwiastków równania kwadratowego ');
   write('Podaj wspó³czynnik A ');
   readln(a);
   write('Podaj wspó³czynnik B ');
   readln(b);
   write('Podaj wspó³czynnik C ');
   readln(c);
   writeln;
   writeln('Równanie ma posta† :  ',A:3:1,'*X^ + ',B:3:1,'*X + ',C:3:1,' = 0');
   writeln;
if A > 0.0 then
   writeln('Ramiona funkcji s¥ zwrócone w górê');
if A < 0.0 then
   writeln('Ramiona funkcji s¥ zwr¢cone w dó³');
   writeln;
   delta:= B*B-4*A*C;  {wyznaczanie delty na podstawie wzoru}


if A = 0.0 then  {przypadek funkcji liniowej}
    begin
    writeln('To nie jest funkcja kwadratowa. ');
    writeln('Naciœnij klawisz spacji ,aby zakoñczyc ');
     repeat
       
    until ZNAK = Chr(32);
      end;


 if delta > 0.0 then {przypadek funkcji nieliniowej}
  begin
     x1:=(-B-sqrt(delta))/(2*A);  {wyznaczanie 1 pierwiastka równania}
     x2:=(-B+sqrt(delta))/(2*A);  {wyznaczanie 2 pierwiastka równania}
     writeln('Dla Delty > 0 i wynosz¹cej  ', delta:3:1);
     writeln('pierwiastki maja wartoœci :');
     writeln('X1 = ',x1:3:1);
     writeln('X2 = ',x2:3:1);

  end;

 if delta = 0.0 then  {przypadek 1 pierwiastka równania}
  begin
     x0:=(-B)/(2*A);  {wyznaczamy pierwiastek za pomoc¹ wzoru}
     writeln('Dla Delty = 0 i wynosz¥cej  ', delta:3:1);
     writeln('pierwiastek ma wartoœæ:');
     writeln('X0 = ',x0:3:1);
  end;

if delta < 0.0 then  {przypadek braku pierwiastka równania}
  begin
     writeln('Dla Delty < 0 i wynosz¹cej  ', delta:3:1);
     writeln('równanie nie ma rozwi¹zania');
  end;

  begin
  writeln;
   p:= (-B)/(2*A);  {punkt ten wskazuje na wartoœæ X wierzcho³ka funkcji}
   q:= (-delta)/(4*A);  {punkt ten wskazuje na wartoœæ Y wierzcho³ka funkcji}
   writeln('Wspó³czynnik p wynosi', p:3:1);
   writeln('Wspó³czynnik q wynosi', q:3:1);
   end;
     writeln('Wierzcho³ek funkcji lewy w punkcie:(',p:3:1, ',' , q:3:1 ,')' );
     writeln;
     
 {wierzcho³ek funkcji mo¿e znajdowaæ siê w 4 ró¿nych æwiartkach osi wspó³rzêdnych:}
 {I æwiartka:}
if p >= 0.00 then
begin
if q >= 0.00 then
     writeln('Postaæ kanoniczna:',a:3:1,'(x-',p:3:1 ,')^+',q:3:1) ;
if q < 0.00 then
     writeln('Postaæ kanoniczna:',a:3:1,'(x-',p:3:1,')^-',-q:3:1) ;
     end;
 
 {II æwiartka:}
if p < 0.00 then
  begin
if q >= 0.00    then
     writeln('Postaæ kanoniczna:',a:3:1,'(x+',-p:3:1,')^+',q:3:1);
if q < 0.00     then
     writeln('Postaæ kanoniczna:',a:3:1,'(x+',-p:3:1,')^-',-q:3:1) ;
     end;
     writeln;
  
 {III æwiartka:}
if delta > 0.00  then
begin
   if x1 >= 0.00  then
   begin
   if x2 >= 0.00 then
    writeln('Postaæ iloczynowa:',a:3:1,'(x-',x1:3:1,')(x-',x2:3:1,')');
   if x2 < 0.00 then
     writeln('Postaæ iloczynowa:',a:3:1,'(x-',x1:3:1,')(x+',-x2:3:1,')');
   end;

 {IV æwiartka:}
   if x1 < 0.00 then
   begin
   if x2 >= 0.00 then
      writeln('Postaæ iloczynowa:',a:3:1,'(x+',-x1:3:1,')(x-',x2:3:1,')');
   if x2 < 0.00 then
     writeln('Postaæ iloczynowa:',a:3:1,'(x+',-x1:3:1,')(x+',-x2:3:1,')') ;
   end;
end;
if delta = 0.00 then
begin
    if x0 >= 0.00   then
    writeln('Postaæ iloczynowa:',a:3:1,'(x-',x0:3:1,')^');
    if x0 < 0.00   then
    writeln('Postaæ iloczynowa:',a:3:1,'(x+',-x0:3:1,')^');
end;

{ gdy równanie nie ma pierwiastków to nie mo¿na wyznaczyæ postaci kanonicznej:}
if  delta < 0.00 then
    writeln('Brak postaci iloczynowej');
     writeln;
     writeln('Naciœnij klawisz spacji ,aby zako¹czyc ');
    
end.