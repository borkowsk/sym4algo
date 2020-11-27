Program Lora;
label 2,3,4,5,6;
{Program zaliczeniowy - Ania Gawryœ}


var
dzien,miesiac,rok,suma,i,ile,numer,choice:integer;
imie,znak:string;
plik, plik2:text;
s,odp,odp2:char;
tablica: array [1..200] of string; 

procedure koniec;
begin
  Clear;
  Brush(1, 30, 79, 115);
  Rectangle (0,0,600,8900);
  moveto (200,100);
  font (20,0,800);
  TextColor( 225, 85, 190 );
  writeln ('KONIEC');
end;
 
procedure losuj; 
 var
   pocz,kon,j:integer; 
 begin
  pocz:=Random(ile)+1; 
  if pocz+3 < ile then 
    kon:=pocz+3 
  else 
    begin 
      kon:=pocz; 
      pocz:=pocz-3; 
    end; 
  while (pocz >1)and(tablica[pocz]<>'') do 
    pocz:=pocz-1; 
  while (kon <ile)and(tablica[kon]<>'') do 
    kon:=kon+1; 
  for j := pocz to kon do 
    Writeln(tablica[j]); 
  Writeln; 
 end;

Begin
Brush(1, 30, 79, 115);
Rectangle (0,0,600,8900);

MoveTo (50,50);
Font( 12, 0 , 400 );
TextColor( 255, 255, 255 );

writeln ('Witaj! ');
writeln;
Font( 8, 0 , 400 );
MoveTo (50,80);
writeln ('Nazywam siê Lora. Bêdê Twoj¹ asystentk¹ w podró¿y po ');
MoveTo (50,100);
writeln ('niniejszym programie.');

MoveTo (50,150);
write ('Na pocz¹tek podaj mi swoje imiê: ');

Font( 9, 0 , 800 );
TextColor( 255, 0, 0 );

readln (imie);
writeln;
writeln;
writeln;
writeln;



Font( 10, 0 , 800 );
TextColor( 255, 128, 64 );
writeln ('     Czeœæ ',imie,'!');

2:writeln;
writeln;

Font( 8, 0 , 800 );
writeln ('      Wybierz co chcia³byœ/chcia³abyœ robiæ: ');

writeln ('        1. Przeczytaæ swój horoskop');


writeln ('        2. Dowiedzieæ siê co mówi o tobie twój ulubiony kolor');


writeln ('        3. Przeczytaæ kawa³');


Font( 9, 0 , 800 );
TextColor( 255, 0, 0 );

write ('    ');
readln (choice);
Clear;

IF choice=1 then
  {Program nr 1 - Horoskop}
  begin
  3:Clear;
  Write('Podaj dzien urodzenia (1-31): ');
  Readln(dzien);
  Write('Podaj miesiac urodzenia (1-12): ');
  Readln(miesiac);
  writeln;


  suma:= (miesiac * 100) + dzien; {np 1 styczen to bedzie 101, a 12 listopad 1112}

  if (suma >= 1) and (suma<= 119) then
    begin
     writeln ('KOZIORO¯EC 22.XII - 19.I');
     Assign (plik,'files/1.txt');
     Reset(plik);
     while not eof (plik) do
      begin
      read (plik, s);
      write(s);
      end;
     Close(plik);
     writeln;
     writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
     readln (odp);
     if (odp='T') or (odp='t') then
      begin
      goto 3;
      end
     else
      writeln ('Powrót do menu? T/N');
      readln (odp);
     if odp='T' then
     goto 2;
     if odp='t' then
      begin
      goto 2;
      end
     else
     koniec;
    end;
 
if (suma >= 1222) and (suma<= 1231) then


  begin
  writeln ('KOZIORO¯EC 22.XII - 19.I');
  Assign (plik,'files/1.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 120) and (suma<= 218) then 
  begin
  writeln ('WODNIK 20.I - 18.II');
  Assign (plik,'files/2.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 219) and (suma<= 320) then 
  begin
  writeln ('RYBY 19.II - 20.III');
  Assign (plik,'files/3.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;
  
  
if (suma >= 321) and (suma<= 420) then 
  begin
  writeln ('Baran 21.III - 20.IV');
  Assign (plik,'files/4.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;


if (suma >= 421) and (suma<= 521) then 

  begin
  writeln ('BYK 21.IV - 21.V');
  Assign (plik,'files/5.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 522) and (suma<= 620) then 

  begin
  writeln ('BLINIÊTA 22.V - 20.VI');
  Assign (plik,'files/6.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 621) and (suma<= 722) then 

 begin
  writeln ('RAK 21.VI - 22.VII');
  Assign (plik,'files/7.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 723) and (suma<= 822) then 

 begin
  writeln ('LEW 23.VII - 22.VIII');
  Assign (plik,'files/8.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 823) and (suma<= 922) then 

 begin
  writeln ('PANNA 23.VIII - 22.IX');
  Assign (plik,'files/9.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 923) and (suma<= 1023) then 

 begin
  writeln ('WAGA 23.IX - 23.X');
  Assign (plik,'files/10.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 1024) and (suma<= 1121) then 

  begin
  writeln ('SKORPION 24.X - 21.XI');
  Assign (plik,'files/11.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;

if (suma >= 1122) and (suma<= 1221) then 

  begin
  writeln ('STRZELEC 22.XI - 21.XII');
  Assign (plik,'files/12.txt');
  Reset(plik);
  While (not EOF(plik)) do
  begin
  read (plik, s);
  write(s);  
  end;
  Close(plik);
  writeln;
  writeln ('Chcesz podaæ inn¹ datê urodzenia? T/N');
  readln (odp);
  if (odp='T') or (odp='t') then
  begin
  goto 3;
  end
  else
  writeln ('Powrót do menu? T/N');
  readln (odp);
  if odp='T' then
  goto 2;
  if odp='t' then
  begin goto 2; end
  else
  koniec;
  end;


end;

IF choice=3 then
  {Program nr 3 - dowcipy}
  begin
  4:Assign(plik,'files/dowcipy.txt');
  Reset(plik); 
  i:=0;
  Writeln ('A teraz pora na dowcip:');
  Writeln;
  Writeln('Jasiu mówi do mamy:');
  Writeln ('-Mamo, tata powiesi³ siê na strychu!');
  Writeln ('Mama biegnie na strych i nikogo tam nie widzi i mówi do Jasia:');
  Writeln ('-Jak ty mo¿esz w³asn¹ matkê straszyæ!');
  Writeln ('A Jasiu na to:');
  Writeln ('-Prym Aprylis, tata powiesi³ siê w piwnicy!'); 
  Writeln;
 
  while (not EOF(plik)) and (i<200) do 
    begin 
      i:=i+1; 
      Readln(plik,tablica[i]); 
    end; 
    ile:=i;
    Close (plik);
    Randomize;
 
    5:Writeln('Jeszcze jeden? T/N'); 
    Readln(znak); 
    if (znak='t') or (znak='T') then 
    begin
      losuj; 
      goto 5;
    end;  
    if (znak='N')or(znak='n') then
    begin
     writeln ('Powrót do menu? T/N');
     readln (znak);
     if (znak='t') or (znak='T') then
     goto 2;
     if (znak='N')or(znak='n') then
     koniec;
    end;
   end;

IF choice=2 then
 {Program nr 2 - kolory}
 begin
 6:Clear;
 writeln ('A teraz pomyœl jaki jest Twój ulubiony kolor.');
 writeln ('Podaj cyferkê odpowiadaj¹c¹ Twojej ulubionej barwie');
 writeln ('a dowiesz siê czegoœ o sobie.');


 writeln ('     1         2         3         4          5 ');

 Brush (1, 0, 128, 0);
 Rectangle (10,70,80,130);

 Brush (1, 0, 128, 192);
 Rectangle (90,70,160,130);

 Brush (1, 252, 16, 10);
 Rectangle (170,70,240,130);

 Brush (1, 247, 230, 21);
 Rectangle (250,70,320,130);

 Brush (1, 132, 70, 9);
 Rectangle (330,70,400,130);

 Brush (1, 255, 128, 0);
 Rectangle (50,140,120,200);

 Brush (1, 255, 255, 255);
 Rectangle (130,140,200,200);

 Brush (1, 163, 129, 192);
 Rectangle (210,140,280,200);

 Brush (1, 0,0,0);
 Rectangle (290,140,360,200);

 Brush (1, 255, 255, 255);
 writeln;
 writeln ('          6         7          8        9');

 Writeln ('Cyfra: ');
 read (numer);
 writeln;

 if numer=1 then
 begin
   Assign (plik2,'files/green.txt');
   Reset(plik2);
   While (not EOF(plik2)) do
    begin
     read (plik2, s);
     write(s);
    end;
   Close(plik2);
   writeln;
   goto 2;
  end;


if numer=2 then
  begin
   Assign (plik2,'files/blue.txt');
   Reset(plik2);
   While (not EOF(plik2)) do
   begin
    read (plik2, s);
    write(s);
   end;
   Close(plik2);
   writeln;
   goto 2;
  end;

if numer=3 then
  begin
   Assign (plik2,'files/red.txt');
   Reset(plik2);
   While (not EOF(plik2)) do
   begin
   read (plik2, s);
   write(s);
   end;
   Close(plik2);
   writeln;
   goto 2;
  end;

if numer=4 then
 begin
  Assign (plik2,'files/yellow.txt');
  Reset(plik2);
  While (not EOF(plik2)) do
  begin
  read (plik2, s);
  write(s);  
  end;
   Close(plik2);
   writeln;
   goto 2;
  end;

if numer=5 then
 begin
  Assign (plik2,'files/brown.txt');
  Reset(plik2);
  While (not EOF(plik2)) do
  begin
  read (plik2, s);
  write(s);  
  end;
   Close(plik2);
   writeln;
   goto 2;
  end;

if numer=6 then
 begin
  Assign (plik2,'files/orange.txt');
  Reset(plik2);
  While (not EOF(plik2)) do
  begin
  read (plik2, s);
  write(s);  
  end;
   Close(plik2);
   writeln;
   goto 2;
  end;

if numer=7 then
 begin
  Assign (plik2,'files/white.txt');
  Reset(plik2);
  While (not EOF(plik2)) do
  begin
  read (plik2, s);
  write(s);  
  end;
   Close(plik2);
   writeln;
   goto 2;
   end;

if numer=8 then
 begin
  Assign (plik2,'files/violet.txt');
  Reset(plik2);
  While (not EOF(plik2)) do
  begin
  read (plik2, s);
  write(s);  
  end;
   Close(plik2);
   writeln;
   goto 2;
  end;
   


if numer=9 then
 begin
  Assign (plik2,'files/black.txt');
  Reset(plik2);
  While (not EOF(plik2)) do
    begin
    read (plik2, s);
    write(s);  
    end;
    Close(plik2);
   writeln;
   goto 2;

  end;

end;
end.


