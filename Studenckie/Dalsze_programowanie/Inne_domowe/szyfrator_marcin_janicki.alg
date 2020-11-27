Program szyrator; 
{program szyfruj¹cy i deszyfruj¹cy plik tekstowy trzema prostymi metodami szyfrowania} 

var 
   {G³ówne zmienne programu} 
   plik2,plik:text; 
   c:char; 
   y:integer; 
   nazwa,nazwa2:string; 

procedure poczatek; 
{procedura podania pliku wejœciowego i wyjœciowego} 

Begin 
  writeln('Podaj nazwê pliku wejœciowego:'); 
  readln(nazwa); 
  writeln('Podaj nazwê pliku wyjœciowego:'); 
  readln(nazwa2); 
  Assign(plik,nazwa); 
  Reset(plik); 
  Assign(plik2,nazwa2); 
  writeln('------------------------------'); 
end; 

Procedure czysc; 
{czyœci okno} 

begin 
  Clear; 
end; 


procedure szyfro1; 
{procedura szyfrowania szyferm cezara} 

begin 
  writeln('Szyfr Cezara'); 
  writeln('1.podaj nazwe pliku który chcesz zaszyfrowaæ wraz z rozszerzeniem(akceptowane tylko txt)'); 
  writeln('2.nacisnij enter '); 
  writeln('3.podaj nazwe pliku wyjsciowego jaki ma utorzyæ program z zaszyfrowanym tekstem') ; 
  writeln('4.naciœnij enter'); 
  poczatek; 
  rewrite(plik2); 
  while not eof(plik) do 
    begin 
      read(plik,c); 
      c:=lowercase(c); 
      if c='a' then 
        c:='d' 
      else 
        if c='b' then 
          c:='e' 
        else 
          if c='c' then 
            c:='f' 
          else 
            if c='d' then 
              c:='g' 
            else 
              if c='e' then 
                c:='h' 
              else 
                if c='f' then 
                  c:='i' 
                else 
                  if c='g' then 
                    c:='j' 
                  else 
                    if c='h' then 
                      c:='k' 
                    else 
                      if c='i' then 
                        c:='l' 
                      else 
                        if c='j' then 
                          c:='m' 
                        else 
                          if c='k' then 
                            c:='n' 
                          else 
                            if c='l' then 
                              c:='o' 
                            else 
                              if c='m' then 
                                c:='p' 
                              else 
                                if c='n' then 
                                  c:='q' 
                                else 
                                  if c='o' then 
                                    c:='r' 
                                  else 
                                    if c='p' then 
                                      c:='s' 
                                    else 
                                      if c='q' then 
                                        c:='t' 
                                      else 
                                        if c='r' then 
                                          c:='u' 
                                        else 
                                          if c='s' then 
                                            c:='v' 
                                          else 
                                            if c='t' then 
                                              c:='w' 
                                            else 
                                              if c='u' then 
                                                c:='x' 
                                              else 
                                                if c='v' then 
                                                  c:='y' 
                                                else 
                                                  if c='w' then 
                                                    c:='z' 
                                                  else 
                                                    if c='x' then 
                                                      c:='a' 
                                                    else 
                                                      if c='y' then 
                                                        c:='b' 
                                                      else 
                                                        if c='z' then 
                                                          c:='c'; 
      Write(plik2,c); 
    end; 
end; 




procedure deszyfro1; 
{deszyfrowanie pliku zaszyfrowanego szyfrem cezara} 

begin 
  writeln('Szyfr Cezara'); 
  writeln('1.podaj nazwe pliku który chcesz odszyfrowaæ wraz z rozszerzeniem(akceptowane tylko txt)'); 
  writeln('2.nacisnij enter '); 
  writeln('3.podaj nazwe pliku wyjsciowego jaki ma utorzyæ program z odszyfrowanym tekstem') ; 
  writeln('4.naciœnij enter'); 
  poczatek; 
  rewrite(plik2); 
  while not eof(plik) do 
    begin 
      read(plik,c); 
      c:=lowercase(c); 
      if c='d' then 
        c:='a' 
      else 
        if c='e' then 
          c:='b' 
        else 
          if c='f' then 
            c:='c' 
          else 
            if c='g' then 
              c:='d' 
            else 
              if c='h' then 
                c:='e' 
              else 
                if c='i' then 
                  c:='f' 
                else 
                  if c='j' then 
                    c:='g' 
                  else 
                    if c='k' then 
                      c:='h' 
                    else 
                      if c='l' then 
                        c:='i' 
                      else 
                        if c='m' then 
                          c:='j' 
                        else 
                          if c='n' then 
                            c:='k' 
                          else 
                            if c='o' then 
                              c:='l' 
                            else 
                              if c='p' then 
                                c:='m' 
                              else 
                                if c='q' then 
                                  c:='n' 
                                else 
                                  if c='r' then 
                                    c:='o' 
                                  else 
                                    if c='s' then 
                                      c:='p' 
                                    else 
                                      if c='t' then 
                                        c:='q' 
                                      else 
                                        if c='u' then 
                                          c:='r' 
                                        else 
                                          if c='v' then 
                                            c:='s' 
                                          else 
                                            if c='w' then 
                                              c:='t' 
                                            else 
                                              if c='x' then 
                                                c:='u' 
                                              else 
                                                if c='y' then 
                                                  c:='v' 
                                                else 
                                                  if c='z' then 
                                                    c:='w' 
                                                  else 
                                                    if c='a' then 
                                                      c:='x' 
                                                    else 
                                                      if c='b' then 
                                                        c:='y' 
                                                      else 
                                                        if c='c' then 
                                                          c:='z'; 
      Write(plik2,c); 
    end; 
end; 




procedure szyfro2; 
{szyfrowanie szyfrem drabinkowym} 

begin 
  writeln('Szyfr drabinka'); 
  writeln('1.podaj nazwe pliku który chcesz zaszyfrowaæ wraz z rozszerzeniem(akceptowane tylko txt)'); 
  writeln('2.nacisnij enter '); 
  writeln('3.podaj nazwe pliku wyjsciowego jaki ma utorzyæ program z zaszyfrowanym tekstem') ; 
  writeln('4.naciœnij enter'); 
  poczatek; 
  rewrite(plik2); 
  while not eof(plik) do 
    begin 
      read(plik,c); 
      c:=lowercase(c); 
      if c='a' then 
        c:='³' 
      else 
        if c='b' then 
          c:='m' 
        else 
          if c='c' then 
            c:='n' 
          else 
            if c='d' then 
              c:='o' 
            else 
              if c='e' then 
                c:='p' 
              else 
                if c='f' then 
                  c:='r' 
                else 
                  if c='g' then 
                    c:='s' 
                  else 
                    if c='h' then 
                      c:='t' 
                    else 
                      if c='i' then 
                        c:='u' 
                      else 
                        if c='j' then 
                          c:='w' 
                        else 
                          if c='k' then 
                            c:='Y' 
                          else 
                            if c='l' then 
                              c:='z' 
                            else 
                              if c='³' then 
                                c:='a' 
                              else 
                                if c='m' then 
                                  c:='b' 
                                else 
                                  if c='n' then 
                                    c:='c' 
                                  else 
                                    if c='o' then 
                                      c:='d' 
                                    else 
                                      if c='p' then 
                                        c:='e' 
                                      else 
                                        if c='r' then 
                                          c:='f' 
                                        else 
                                          if c='s' then 
                                            c:='g' 
                                          else 
                                            if c='t' then 
                                              c:='h' 
                                            else 
                                              if c='u' then 
                                                c:='i' 
                                              else 
                                                if c='w' then 
                                                  c:='j' 
                                                else 
                                                  if c='y' then 
                                                    c:='k' 
                                                  else 
                                                    if c='z' then 
                                                      c:='l'; 
      Write(plik2,c); 
    end; 
end; 





procedure deszyfro2; 
{deszyfrowanie pliku zaszyfrowanego szyfrem drabinkowym} 

begin 
  writeln('Szyfr drabinka'); 
  writeln('1.podaj nazwe pliku który chcesz odszyfrowaæ wraz z rozszerzeniem(akceptowane tylko txt)'); 
  writeln('2.nacisnij enter '); 
  writeln('3.podaj nazwe pliku wyjsciowego jaki ma utorzyæ program z odszyfrowanym tekstem') ; 
  writeln('4.naciœnij enter'); 
  poczatek; 
  rewrite(plik2); 
  while not eof(plik) do 
    begin 
      read(plik,c); 
      c:=lowercase(c); 
      if c='³' then 
        c:='a' 
      else 
        if c='m' then 
          c:='b' 
        else 
          if c='n' then 
            c:='c' 
          else 
            if c='o' then 
              c:='d' 
            else 
              if c='p' then 
                c:='e' 
              else 
                if c='r' then 
                  c:='f' 
                else 
                  if c='s' then 
                    c:='g' 
                  else 
                    if c='t' then 
                      c:='h' 
                    else 
                      if c='u' then 
                        c:='i' 
                      else 
                        if c='w' then 
                          c:='j' 
                        else 
                          if c='y' then 
                            c:='k' 
                          else 
                            if c='z' then 
                              c:='l' 
                            else 
                              if c='a' then 
                                c:='³' 
                              else 
                                if c='b' then 
                                  c:='m' 
                                else 
                                  if c='c' then 
                                    c:='n' 
                                  else 
                                    if c='d' then 
                                      c:='o' 
                                    else 
                                      if c='e' then 
                                        c:='p' 
                                      else 
                                        if c='f' then 
                                          c:='r' 
                                        else 
                                          if c='g' then 
                                            c:='s' 
                                          else 
                                            if c='h' then 
                                              c:='t' 
                                            else 
                                              if c='i' then 
                                                c:='u' 
                                              else 
                                                if c='j' then 
                                                  c:='w' 
                                                else 
                                                  if c='k' then 
                                                    c:='y' 
                                                  else 
                                                    if c='l' then 
                                                      c:='z'; 
      Write(plik2,c); 
    end; 
end; 











procedure szyfro3; 
{szyfrowanie pliku szyfrem AtBash} 

begin 
  writeln('Szyfr AtBash'); 
  writeln('1.podaj nazwe pliku który chcesz zaszyfrowaæ wraz z rozszerzeniem(akceptowane tylko txt)'); 
  writeln('2.nacisnij enter '); 
  writeln('3.podaj nazwe pliku wyjsciowego jaki ma utorzyæ program z zaszyfrowanym tekstem') ; 
  writeln('4.naciœnij enter'); 
  poczatek; 
  rewrite(plik2); 
  while not eof(plik) do 
    begin 
      read(plik,c); 
      c:=lowercase(c); 
      if c='a' then 
        c:='z' 
      else 
        if c='b' then 
          c:='y' 
        else 
          if c='c' then 
            c:='x' 
          else 
            if c='d' then 
              c:='w' 
            else 
              if c='e' then 
                c:='u' 
              else 
                if c='f' then 
                  c:='t' 
                else 
                  if c='g' then 
                    c:='s' 
                  else 
                    if c='h' then 
                      c:='r' 
                    else 
                      if c='i' then 
                        c:='p' 
                      else 
                        if c='j' then 
                          c:='o' 
                        else 
                          if c='k' then 
                            c:='n' 
                          else 
                            if c='l' then 
                              c:='m' 
                            else 
                              if c='m' then 
                                c:='l' 
                              else 
                                if c='n' then 
                                  c:='k' 
                                else 
                                  if c='o' then 
                                    c:='j' 
                                  else 
                                    if c='p' then 
                                      c:='i' 
                                    else 
                                      if c='r' then 
                                        c:='h' 
                                      else 
                                        if c='s' then 
                                          c:='g' 
                                        else 
                                          if c='t' then 
                                            c:='f' 
                                          else 
                                            if c='u' then 
                                              c:='e' 
                                            else 
                                              if c='w' then 
                                                c:='d' 
                                              else 
                                                if c='x' then 
                                                  c:='c' 
                                                else 
                                                  if c='y' then 
                                                    c:='b' 
                                                  else 
                                                    if c='z' then 
                                                      c:='a'; 
      Write(plik2,c); 
    end; 
end; 





procedure deszyfro3; 
{deszyfrowanie pliku zaszyfrowanego szyfrem AtBash} 

begin 
  writeln('Szyfr AtBash'); 
  writeln('1.podaj nazwe pliku który chcesz odszyfrowaæ wraz z rozszerzeniem(akceptowane tylko txt)'); 
  writeln('2.nacisnij enter '); 
  writeln('3.podaj nazwe pliku wyjsciowego jaki ma utorzyæ program z odszyfrowanym tekstem') ; 
  writeln('4.naciœnij enter'); 
  poczatek; 
  rewrite(plik2); 
  while not eof(plik) do 
    begin 
      read(plik,c); 
      c:=lowercase(c); 
      if c='a' then 
        c:='z' 
      else 
        if c='b' then 
          c:='y' 
        else 
          if c='c' then 
            c:='x' 
          else 
            if c='d' then 
              c:='w' 
            else 
              if c='e' then 
                c:='u' 
              else 
                if c='f' then 
                  c:='t' 
                else 
                  if c='g' then 
                    c:='s' 
                  else 
                    if c='h' then 
                      c:='r' 
                    else 
                      if c='i' then 
                        c:='p' 
                      else 
                        if c='j' then 
                          c:='o' 
                        else 
                          if c='k' then 
                            c:='n' 
                          else 
                            if c='l' then 
                              c:='m' 
                            else 
                              if c='m' then 
                                c:='l' 
                              else 
                                if c='n' then 
                                  c:='k' 
                                else 
                                  if c='o' then 
                                    c:='j' 
                                  else 
                                    if c='p' then 
                                      c:='i' 
                                    else 
                                      if c='r' then 
                                        c:='h' 
                                      else 
                                        if c='s' then 
                                          c:='g' 
                                        else 
                                          if c='t' then 
                                            c:='f' 
                                          else 
                                            if c='u' then 
                                              c:='e' 
                                            else 
                                              if c='w' then 
                                                c:='d' 
                                              else 
                                                if c='x' then 
                                                  c:='c' 
                                                else 
                                                  if c='y' then 
                                                    c:='b' 
                                                  else 
                                                    if c='z' then 
                                                      c:='a'; 
      Write(plik2,c); 
    end; 
end; 




procedure szyfrmenu1; 
{wybór czy chce sie szyfrowaæ ,czy deszyfrowaæ dla szyfru cezara} 

var 
   x:integer; 
begin 
  writeln('Szyfr Cezara'); 
  writeln('1.szyfruj plik:'); 
  writeln('2.deszyfruj plik:'); 
  readln(x); 
  if x=1 then 
    begin 
      czysc; 
      szyfro1; 
    end; 
  if x=2 then 
    begin 
      czysc; 
      deszyfro1; 
    end; 
end; 

procedure szyfrmenu2; 
{wybór czy chce sie szyfrowaæ ,czy deszyfrowaæ dla szyfru drabinkowego} 

var 
   x:integer; 
begin 
  writeln('Szyfr Drabinka'); 
  writeln('1.szyfruj plik:'); 
  writeln('2.deszyfruj plik:'); 
  readln(x); 
  if x=1 then 
    begin 
      czysc; 
      szyfro2; 
    end; 
  if x=2 then 
    begin 
      czysc; 
      deszyfro2; 
    end; 
end; 

procedure szyfrmenu3; 
{wybór czy chce sie szyfrowaæ ,czy deszyfrowaæ dla szyfru AtBash} 

var 
   x:integer; 
begin 
  writeln('Szyfr AtBash'); 
  writeln('1.szyfruj plik:'); 
  writeln('2.deszyfruj plik:'); 
  readln(x); 
  if x=1 then 
    begin 
      czysc; 
      szyfro3; 
    end; 
  if x=2 then 
    begin 
      czysc; 
      deszyfro3; 
    end; 
end; 
{Kod programu g³ównego} 

begin ; 
  writeln('Wybierz metode szyfrowania/deszyfrowania:'); 
  writeln('(wybierz odpowiedni¹ liczbê z klawiatury przyporz¹dkowana szyfrowi i naciœnij enter'); 
  writeln('1.Szyfr Cezara'); 
  writeln('2.Szyfr drabinkowy'); 
  writeln('3.Szyfr AtBash'); 
  readln(y); 
  if y=1 then 
    begin 
      czysc; 
      szyfrmenu1; 
    end; 
  if y=2 then 
    begin 
      czysc; 
      szyfrmenu2; 
    end; 
  if y=3 then 
    begin 
      czysc; 
      szyfrmenu3; 
    end; 
  close(plik2); 
  Close(plik); 
end.


