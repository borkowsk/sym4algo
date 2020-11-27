{ Uwaga! Plik ze s³ówkami musi byæ zakoñczony znakiem nowej linii - najlepiej dodawaæ s³owa przez program}

Program NaukaSlowek;
const SIZE = 30;
      nazwa_pliku = 'slowka.txt';
var
   slowka,tlumaczenia: array[1..SIZE] of string;
   plik1:text;
   liczbaSlowek, numerSlowka, dlugoscLinii, liczbaProb:integer;
   start, koniec,koniec2:boolean;
   c:char;
   plikWejsciowy,linia: string;   
   label 1;
   
procedure rozpocznijTest;
var slowo,tlumaczenie,wpisaneSlowo:string;
    spacja, wylosowanyNumer, nrPodpowiedzi, licznikProb, ilosc:integer;
    koniec:boolean;    
begin

   
{**************** wype³nienie tablic s³ówkami *****************}

   clear;

   writeln('Podaj liczbê s³ów do testowania: ');
   readln(liczbaProb);
      
            
   Assign(plik1,nazwa_pliku);
   Reset(plik1);
   
   liczbaSlowek := 0;   
   
   while not eof(plik1) do
   begin
      readln(plik1,linia);
      dlugoscLinii := Length(linia);
      liczbaSlowek:=liczbaSlowek+1;
      ilosc := 1;
      
      repeat
         ilosc := ilosc + 1;
      until linia[ilosc] = ' ';
      
      
      slowka[liczbaSlowek] := linia;    
      delete(slowka[liczbaSlowek],ilosc, dlugoscLinii-ilosc+1);
      tlumaczenia[liczbaSlowek] := linia;    
      delete(tlumaczenia[liczbaSlowek],1,ilosc);
   end;
   
   Close(plik1);
   
{***************************************************************}
   koniec := false;
   koniec2 := false;
   
   for licznikProb := 1 to liczbaProb do
   begin 
   
      if koniec2 = false then
      begin
   
         wylosowanyNumer := random(liczbaSlowek) + 1;
      
         slowo := slowka[wylosowanyNumer];
         tlumaczenie := tlumaczenia[wylosowanyNumer];
   
   
         clear;
         TextColor(0,0,255);
         writeln(slowo);
         TextColor(0,0,0);
         writeln('');
         writeln('p - podpowiedŸ');
         writeln('q - wyjœcie');
         writeln('');
   
   
         nrPodpowiedzi := 0;
         repeat
      
   
            readln(wpisaneSlowo);
            if wpisaneSlowo = 'p' then
            begin
               nrPodpowiedzi := nrPodpowiedzi + 1;
               if nrPodpowiedzi <= length(tlumaczenie) then
               begin
                  clear;
         TextColor(0,0,255);
         writeln(slowo);
         TextColor(0,0,0);
         writeln('');
         writeln('p - podpowiedŸ');
         writeln('q - wyjœcie');
         writeln('');

                  write('podpowiedŸ: ');
                  for ilosc := 1 to nrPodpowiedzi do
                     write(tlumaczenie[ilosc]);
                  for ilosc := nrPodpowiedzi + 1 to length(tlumaczenie) do
                     write('.');
                  writeln('');
                  writeln('');
               end
               else
               begin
                  clear;
                  TextColor(0,0,255);
         writeln(slowo);
         TextColor(0,0,0);
         writeln('');
         writeln('p - podpowiedŸ');
         writeln('q - wyjœcie');
         writeln('');

                  write('podpowiedŸ: ', tlumaczenie);
                  writeln('');
                  writeln('');
               end;
            end
            else if wpisaneSlowo = tlumaczenie then
            begin
               koniec := true;
               writeln('');
               Textcolor(0,255,0);
               writeln('DOBRZE!!!');
               Textcolor(0,0,0);
               writeln('');
               writeln('wciœnij <ENTER> ...');
               readln;
            end
            else if wpisaneSlowo = 'q' then
            begin
               koniec := true;
               koniec2 := true;
            end
            else
            begin
               Textcolor(255,0,0);
               writeln('LE!!!');               
               Textcolor(0,0,0);
            end;
         until koniec = true; 
   
      end;    
   
   end;
         
end;

procedure zapiszSlowo(slowo,tlumaczenie:string);
var i,liczbaSlowek:integer;
    slowa:array[1..SIZE] of string;
    plik:text;
begin
   Assign(plik,nazwa_pliku);
   Reset(plik);
   
   liczbaSlowek := 0;   
   
   while not eof(plik) do
   begin
      readln(plik,linia);
      dlugoscLinii := Length(linia);
      liczbaSlowek:=liczbaSlowek+1;      
      
      slowa[liczbaSlowek] := linia;          
   end;
   
   close(plik);
   
   if liczbaSlowek >= SIZE then
      writeln('Za ma³o pamiêci. Zwiêksz iloœæ s³ów (sta³a SIZE).')
   else
   begin      
      
      Assign(plik,nazwa_pliku);
      Rewrite(plik);
   
      for i:=1 to liczbaSlowek do
      begin
         writeln(plik, slowa[i]);
      end;
      
      writeln(plik, slowo + ' ' + tlumaczenie);
      
      Close(plik);
      writeln('Dodano nowe s³owo');
   end;
end; 

procedure dodajSlowo;
var slowo, tlumaczenie:string;    
    koniec:boolean;
    c:char;
begin
   koniec := false;
   clear;
   readln;
   write('Podaj nowe s³owo: ');
   readln(slowo);
   writeln('');
   write('Podaj t³umaczenie dla s³owa ', slowo, ': ');
   readln(tlumaczenie);
   writeln('');
   writeln('');
   writeln('S³owo:', slowo);
   writeln('Tlumaczenie:', tlumaczenie);
   Writeln('Akceptujesz? [T/N]');
   repeat
   read(c);   
   case UpperCase(c) of
   'T': begin koniec := true;writeln('');zapiszSlowo(slowo,tlumaczenie); end;
   'N': begin koniec := true;writeln('');writeln('Nie dodano nowego s³owa'); end;
   end;
   until koniec = true;
   writeln('');
   writeln('wciœnij <ENTER> ...');
   readln;readln;
end;
      

   
Begin
   koniec := false;

   
   
   while not koniec do
   begin
      clear;

      writeln('!!!! Nauka s³ówek !!!!');
      writeln('');
      writeln('1. (D)odaj nowe s³ówko');
      writeln('2. (R)ozpocznij test');
      writeln('3. (W)yjœcie z programu');
      writeln('');
   
      read(c);
      case UpperCase(c) of
      'W': koniec := true;
      'R': rozpocznijTest;
      'D': dodajSlowo;
   end;
   
end;
end.
