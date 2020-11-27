Program Sumuj_zadane;
var Wartosc : real;   {wartosc podana przez uzytkownika}
    Suma_dod : real;  {suma liczb dodatnich}
    Suma_uj : real;   {suma liczb ujemnych}
    Liczba : integer; {ilosc liczb podanych przez uzytkownika}
    Liczba_dod : integer;  {ilosc liczb dodatnich}
    Liczba_uj : integer;   {ilosc liczb ujemnych}
    i : integer;           {licznik}
 
 
BEGIN
  Suma_dod:=0;  {inicjowanie zmiennych}
  Suma_uj:=0;
  Liczba_dod:=0;
  Liczba_uj:=0;
                {wczytywanie ilosci liczb}
  writeln('Ile bedzie liczb?');
  readln(Liczba);
  writeln('Podawaj wartosci ');
  for i:=1 to Liczba do   {wczytywanie wartosci liczb}
   begin
     readln(Wartosc);
     if Wartosc < 0 then  {gdy podano liczbe ujemna}
      begin
        Suma_uj:=Suma_uj+Wartosc;   {aktualizujemy sume liczb ujemnych}
        Liczba_uj:=Liczba_uj+1;     {zwiekszamy ilosc liczb ujemnych}
      end
     else      {w przeciwnym wypadku - podano liczabe dodtania}
      begin
        Suma_dod:=Suma_dod+Wartosc; {akualizujemy sume liczb dodatnich}
        Liczba_dod:=Liczba_dod+1;   {zwiekszamy ilosc liczb dodatnich}
      end;
   end;
             {Wypisywanie wynikow koncowych}
  writeln('Ilosc liczb dodatnich: ', Liczba_dod);
  if Liczba_dod>0 then
    writeln('Srednia liczb dodatnich wynosi: ', Suma_dod/Liczba_dod);
  writeln('Suma liczb dodatnich wynosi: ', Suma_dod);
  if Liczba_dod>0 then
    writeln('Kwadrat sredniej liczb dodatnich: ',sqr(Suma_dod/Liczba_dod));
  if Liczba_dod>0 then
   writeln('Pierwiastek sredniej liczb dodatnich: ',sqrt(Suma_dod/Liczba_dod));
 
  writeln; {pusty wiersz}

  writeln('Ilosc liczb ujemnych: ', Liczba_uj);
  if Liczba_uj>0 then
    writeln('Srednia liczb ujemnych wynosi ',Suma_uj/Liczba_uj);
  writeln('Suma liczb ujemnych wynosi: ',Suma_uj);
  if Liczba_uj>0 then
    writeln('Kwadrat sredniej liczb ujemnych: ', sqr(Suma_uj/Liczba_uj));
  if Liczba_uj>0 then
    writeln('Pierwiastek sredniej liczb ujemnych: nie istnieje');

END.