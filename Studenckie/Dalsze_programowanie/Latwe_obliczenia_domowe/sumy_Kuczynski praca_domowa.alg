Program pracadomowa;

var

sumad, sumau, wartosc:real;

z, liczba, liczbad, liczbau:integer;

begin

sumad:=0;

sumau:=0;

liczbad:=0;

liczbau:=0;

writeln ('ile bedzie liczb?');

readln (liczba);

writeln ('wprowadz wartosci');

for z:=1 to liczba do

begin

readln (wartosc);

if wartosc>-1     then sumad:=sumad+wartosc;

if wartosc>-1     then liczbad:=liczbad+1;

if wartosc<0       then sumau:=sumau+wartosc;

if wartosc<0       then liczbau:=liczbau+1;

end;

writeln;

writeln ('wprowadziles >',liczba,'< liczby');

writeln;

writeln ('w tym >',liczbad,'< liczb dodatnich');

writeln ('oraz >',liczbau,'< liczb ujemnych');

writeln;

writeln ('suma liczb dodatnich wyniosla >',sumad,'<');

writeln ('suma liczb ujemnych wyniosla >',sumau,'<');

writeln;

writeln ('srednia liczb dodatnich wyniosla >',sumad/liczba,'<');

writeln ('srednia liczb ujemnych wyniosla >',sumau/liczba,'<');

writeln;

writeln ('kwadrat  sredniej liczb dodatnich >', ((sumad/liczba)*(sumad/liczba)),'<');

writeln ('kwadrat sredniej liczb ujemnych >',((sumau/liczba)*(sumau/liczba)),'<');

writeln;

writeln ('pierwiastek ich sredniej to >', (sqrt(sumad/liczba)),'<');

writeln ('liczb ujemnych sie nie pierwiastkuje');

end.