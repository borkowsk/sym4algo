Program sumuj_zadane_modyfikacje; 
 

var 
   sd,su:real; 
   ld,lu,z,wartosc,liczba:integer;
  

begin 
  sd:=0; 
  su:=0;
  ld:=0;
  lu:=0; 
  writeln('Ile b�dzie liczb?'); 
  readln(liczba); 
  writeln('Podawaj warto�ci'); 
  for z:=1 to liczba do 
    begin 
      readln(wartosc); 
      if wartosc>=0 then
      begin
        sd:=sd+wartosc;
        ld:=ld+1;
        end
        else
        if wartosc<0 then
       begin
         su:=su+wartosc;
         lu:=lu+1;
      end;
      end;
      
writeln('Ilo�� liczb dodatnich:' ,ld);
writeln('Ilo�� liczb ujemnych:' ,lu);
if ld=0 then 
        begin
        ld:=1
        end;
      if lu=0 then
        begin
        lu:=1
        end;
writeln('�rednia liczb dodatnich wynosi:',sd/ld);
writeln('Srednia liczb ujemych wynosi:', su/lu);
writeln('Suma liczb dodatnich wynosi:',su);
writeln('Suma liczb ujemnych wynosi:',su);
writeln('Kwadrat �redniej liczb dodatnich:', sqr(sd/ld));
writeln('Pierwiastek �redniej liczb dodatnich:',sqrt(sd/ld));
writeln('Kwadrat �redniej liczb ujemnych:', sqr(su/lu));
writeln('Pierwiastek �redniej liczb ujemnych:'  ,('NIE ISTNIEJE TAKI PIERWIASTEK:)'));

end.