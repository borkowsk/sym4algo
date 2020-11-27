{non stop probuje to jakos zapisac, aby mozna bylo to otworzyc  w aldo, ale mam wersje testowa,
i nie mam pojecia jak to zrobic,  przesylam panu wiec w notatniku... u mnie ten program dziala.} 
Program sumowanie_zadanej_liczby_wartosci; 

var 
   suma_dodat,suma_ujemn:real; 
   ldodat,lujem,wartosc,a,liczba:integer; 

begin 
  suma_dodat:=0; 
  suma_ujemn:=0; 
  ldodat:=0; 
  lujem:=0; 
  writeln('ile liczb bedzie?'); 
  readln(liczba); 
  writeln('napisz wartosci'); 
  for a:=1 to liczba do 
    begin 
      readln(wartosc); 
      if wartosc>=0 then 
        begin 
          suma_dodat:=suma_dodat+wartosc; 
          ldodat:=ldodat+1; 
        end 
      else 
        if wartosc<0 then 
          begin 
            suma_ujemn:=suma_ujemn+wartosc; 
            lujem:=lujem+1; 
          end; 
    end; 
  writeln; 
  writeln('Suma liczb dodatnich wynosi:',suma_dodat); 
  writeln('Ilosæ liczb dodatnich:' ,ldodat); 
  if ldodat=0 then 
    begin 
      ldodat:=1 
    end; 
  writeln('srednia liczb dodatnich wynosi:',suma_dodat/ldodat); 
  writeln('Kwadrat sredniej liczb dodatnich:', sqr(suma_dodat/ldodat)); 
  writeln('Pierwiastek sredniej liczb dodatnich:',sqrt(suma_dodat/ldodat)); 
  writeln; 
  writeln('Suma liczb ujemnych wynosi:',suma_ujemn); 
  writeln('Ilosæ liczb ujemnych:' ,lujem); 
  if lujem=0 then 
    begin 
      lujem:=1 
    end; 
  writeln('Srednia liczb ujemych wynosi:', suma_ujemn/lujem); 
  writeln('Kwadrat sredniej liczb ujemnych:', sqr(suma_ujemn/lujem)); 
  writeln('Pierwiastek sredniej liczb ujemnych:' ,('nie ma takiego pierwiastka')); 
end.
