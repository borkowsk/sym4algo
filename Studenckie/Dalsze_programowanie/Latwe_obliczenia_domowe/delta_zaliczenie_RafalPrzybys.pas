program rownanie ;

{ @autor: Rafa� Przyby� }


{ x0 - pierwiastek r�wnania gdy istnieje tylko 1 taki pierwiastek
  x1,x2 - pierwiastki r�wnania gdy istniej� 2 takie pierwiastki
  a,b,c - wsp�czynniki r�wnania (kolejno: przy x^2, x, wyraz wolny)
  p,q -  zmienne pomocne przy wyznaczaniu postaci kanonicznej r�wnania
}
      
  var
   a,b,c,delta,x1,x2,x0,p,q : real;
   znak : char;

begin
   writeln('Wyznaczanie pierwiastk�w r�wnania kwadratowego ');
   write('Podaj wsp�czynnik A ');
   readln(a);
   write('Podaj wsp�czynnik B ');
   readln(b);
   write('Podaj wsp�czynnik C ');
   readln(c);
   writeln;
   writeln('R�wnanie ma posta� :  ',A:3:1,'*X^ + ',B:3:1,'*X + ',C:3:1,' = 0');
   writeln;
if A > 0.0 then
   writeln('Ramiona funkcji s� zwr�cone w g�r�');
if A < 0.0 then
   writeln('Ramiona funkcji s� zwr�cone w d�');
   writeln;
   delta:= B*B-4*A*C;  {wyznaczanie delty na podstawie wzoru}


if A = 0.0 then  {przypadek funkcji liniowej}
    begin
    writeln('To nie jest funkcja kwadratowa. ');
    writeln('Naci�nij klawisz spacji ,aby zako�czyc ');
     repeat
       
    until ZNAK = Chr(32);
      end;


 if delta > 0.0 then {przypadek funkcji nieliniowej}
  begin
     x1:=(-B-sqrt(delta))/(2*A);  {wyznaczanie 1 pierwiastka r�wnania}
     x2:=(-B+sqrt(delta))/(2*A);  {wyznaczanie 2 pierwiastka r�wnania}
     writeln('Dla Delty > 0 i wynosz�cej  ', delta:3:1);
     writeln('pierwiastki maja warto�ci :');
     writeln('X1 = ',x1:3:1);
     writeln('X2 = ',x2:3:1);

  end;

 if delta = 0.0 then  {przypadek 1 pierwiastka r�wnania}
  begin
     x0:=(-B)/(2*A);  {wyznaczamy pierwiastek za pomoc� wzoru}
     writeln('Dla Delty = 0 i wynosz�cej  ', delta:3:1);
     writeln('pierwiastek ma warto��:');
     writeln('X0 = ',x0:3:1);
  end;

if delta < 0.0 then  {przypadek braku pierwiastka r�wnania}
  begin
     writeln('Dla Delty < 0 i wynosz�cej  ', delta:3:1);
     writeln('r�wnanie nie ma rozwi�zania');
  end;

  begin
  writeln;
   p:= (-B)/(2*A);  {punkt ten wskazuje na warto�� X wierzcho�ka funkcji}
   q:= (-delta)/(4*A);  {punkt ten wskazuje na warto�� Y wierzcho�ka funkcji}
   writeln('Wsp�czynnik p wynosi', p:3:1);
   writeln('Wsp�czynnik q wynosi', q:3:1);
   end;
     writeln('Wierzcho�ek funkcji lewy w punkcie:(',p:3:1, ',' , q:3:1 ,')' );
     writeln;
     
 {wierzcho�ek funkcji mo�e znajdowa� si� w 4 r�nych �wiartkach osi wsp�rz�dnych:}
 {I �wiartka:}
if p >= 0.00 then
begin
if q >= 0.00 then
     writeln('Posta� kanoniczna:',a:3:1,'(x-',p:3:1 ,')^+',q:3:1) ;
if q < 0.00 then
     writeln('Posta� kanoniczna:',a:3:1,'(x-',p:3:1,')^-',-q:3:1) ;
     end;
 
 {II �wiartka:}
if p < 0.00 then
  begin
if q >= 0.00    then
     writeln('Posta� kanoniczna:',a:3:1,'(x+',-p:3:1,')^+',q:3:1);
if q < 0.00     then
     writeln('Posta� kanoniczna:',a:3:1,'(x+',-p:3:1,')^-',-q:3:1) ;
     end;
     writeln;
  
 {III �wiartka:}
if delta > 0.00  then
begin
   if x1 >= 0.00  then
   begin
   if x2 >= 0.00 then
    writeln('Posta� iloczynowa:',a:3:1,'(x-',x1:3:1,')(x-',x2:3:1,')');
   if x2 < 0.00 then
     writeln('Posta� iloczynowa:',a:3:1,'(x-',x1:3:1,')(x+',-x2:3:1,')');
   end;

 {IV �wiartka:}
   if x1 < 0.00 then
   begin
   if x2 >= 0.00 then
      writeln('Posta� iloczynowa:',a:3:1,'(x+',-x1:3:1,')(x-',x2:3:1,')');
   if x2 < 0.00 then
     writeln('Posta� iloczynowa:',a:3:1,'(x+',-x1:3:1,')(x+',-x2:3:1,')') ;
   end;
end;
if delta = 0.00 then
begin
    if x0 >= 0.00   then
    writeln('Posta� iloczynowa:',a:3:1,'(x-',x0:3:1,')^');
    if x0 < 0.00   then
    writeln('Posta� iloczynowa:',a:3:1,'(x+',-x0:3:1,')^');
end;

{ gdy r�wnanie nie ma pierwiastk�w to nie mo�na wyznaczy� postaci kanonicznej:}
if  delta < 0.00 then
    writeln('Brak postaci iloczynowej');
     writeln;
     writeln('Naci�nij klawisz spacji ,aby zako�czyc ');
    
end.