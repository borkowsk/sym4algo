Program rownanie_kwadratowe;

var
a, b, c, delta, x1, x2: real;

begin
    writeln('Podaj parametry r�wnania kwadratowego');
    write('Parametr a: ');
    readln(a);
    write('Parametr b: ');
    readln(b);
    write('Parametr c: ');
    readln(c);
    writeln('');
    delta := b*b-4*a*c;
    if (delta > 0) then
    begin
        x1 := (-b-sqrt(delta))/(2*a);
        x2 := (-b+sqrt(delta))/(2*a);
        writeln('R�wnanie posiada dwa rozwi�zania: ', x1, ' oraz ', x2);
    end
    else if (delta = 0) then
    begin
        x1 := -b/(2*a);
        writeln('R�wnanie posiada jedno rozwi�zanie: ', x1);
    end
    else
    begin
        writeln('R�wnanie nie ma rozwi�za�');
    end
end.  