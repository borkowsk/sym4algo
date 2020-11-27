program zaliczenie;

{program nalezy odpalac w pelnym widoku wyniku}

{niestety fakt ze wersja Algo w ktorej musielismy napisac ten program jest wersja 
demo przespozyla mi bardzo ale to bardzo wielu problemow, program napisany podczas 
kopiowania zmienial sie w program nie do odczytu, i cala moja praca z jednego dnia 
poszla na marne, mam nadzieje ze ten fakt zostanie wziety pod uwage, moim zdaniem Algo
w wersji demo nie nadaje sie do pracy} 




{procedura rysowania kwadratow z poziomu trudnosci 1 i 2}
procedure rysowanie_kwadratow(x,p:integer);

   var 
    r,g,b:integer;
    tab1:array[1..10] of integer;
   begin
    for x:=1 to x do
     begin
  {losowanie koloru i wyswietlanie kwadratow sformatowanych przez petle}
      r:=random(255);
      g:=random(255);
      b:=random(255);
      brush(1,r,g,b);
      rectangle(p+50,p+35,p+110,p+110);
      brush(1,255,255,255);
      p:=p+60;
     end;
 writeln('');
   end;


{procedura rysowania animacji poczatkowej}
Procedure rysowanie_poczatku(st,sp,skok,o,m,t:integer); 

var 
   i,g:integer; 
    begin 
      for i:=st to sp do 
        begin 
          g:=i*skok; 
          pen(1,150+i+t,50+i+t,50-i-t); 
          rectangle(0+g+20+o,0+g+m,200-g+20+o,200-g+m);
          delay(1);      
        end; 
     end; 

{procedura rysowania koncowej animacji}
Procedure rysowanie_konca(st,sp,skok:integer); 

var 
   i,g:integer; 
    begin 
      for i:=st to sp do 
        begin 
          g:=i*skok;
          pen(1,150-i,100+i,100-i); 
          rectangle(0+g,0+(g*2),600-g,600-(g*2));
          delay(10);      
        end;   
     end; 

{koncowe zamolowywanie kwadratu z animacji koncowej}     
Procedure kwadrat_dalej;

var 
   t:integer;
      begin
      {petla pozwalajaca zamalowac kwadrat do srodka}
        for t:=1 to 200 do
          begin
             pen(1,150-t,100+t,100-t); 
             rectangle(100+t,200+(t*2),500-t,400-(t*2));
             delay(10);            
          end;
end;              


{procedura wyswietlania dalszych instrukcji po zakonczeniu testu}
procedure CoDalej;
begin
writeln;
           writeln;
           writeln('               Co chcesz teraz zrobic?');
           writeln;
           writeln('               Pokaz wynik wcisnij v');
           writeln('               Rozpocznij test ponownie wcisnij 1'); 
           writeln('               Wyjscie z testu wcisnij 3');
           writeln('               Powrot do menu wcisnij z');


end;

{procedura zapisu dopliku}
procedure zapis_pliku(i1:string;i,poziom:integer);
var
plik:text;
wy1,wy2,wy3:string[255];
begin
   wy1:='Ojojoj, s³abiutko...!!!';
   wy2:='Dobrze ale musisz jeszcze poæwiczyæ !!!';
   wy3:='Super jesteœ mistrzem!!!';

  assign(plik,'C:\wyniki_testu.txt');
  rewrite(plik);
  write(plik,'    Twoje imie: ');
  write(plik,i1);
  write(plik,', poziom trudnosci ');
  write(plik, poziom);
  write(plik,', twój wynik= ');

    if i<5 then
      begin
       write(plik,i);
       write(plik,' - '); 
       writeln(plik,wy1);
    end;

   if i>=5 then
    begin
   if i<=8 then
    begin
    write(plik,i);
    write(plik,' - '); 
    writeln(plik,wy2);
    end;
    end;

   if i>8 then
    begin
    write(plik,i);
    write(plik,' - '); 
    writeln(plik,wy3);
    end; 

  close(plik);

end;

{G³ówne zmienne programu}

var 
num,licz,z,k,p,q,i,x,n,w,a,l,b,re,ge,be,np,poziom:integer;
plik:text;
c,sym:char;
i1:string[255];
tab:array[1..10] of integer;
los,ppocz,tpocz,lpocz,kpocz,mpocz:integer;


 {program g³owny}
 begin
  i:=0;

 {wypisywanie napisow do animacji rozpoczecia testu} 
  lpocz:=0;
  mpocz:=0;
  tpocz:=0;
   for kpocz:=1 to 4 do
    begin
      rysowanie_poczatku(0,200,1,lpocz,mpocz,tpocz);
      writeln;
{stosujemy instrukcje warunkowe w celu wyswietlenia w odpowiednim czasie napisów poczatkowych}     
       if kpocz=1 then
        begin
         font(20,0,20);
         textcolor(0,0,0);
         moveto(250,40);
         writeln('Witamy');
        end;
       if kpocz=2 then
        begin
         moveto(430,150);
         writeln('w tescie ');
        end;

      if kpocz=3 then
       begin
        moveto(670,250);
        writeln('na');
       end;

      if kpocz=4 then
       begin 
        clear;
{kolorowanie napisu "spostrzegawczosc" i zmiana kolorow}
              for ppocz:=1 to 15 do
        begin
         font(35,0,150);
         textColor(random(255),random(255),random(255)); {losowanie kolorow}
         moveto(120,260);{ustawiamy kursor}  
         writeln('SPOSTRZEGAWCZOŒÆ');
         delay(200); {opoznienie aby zobaczyc zmieniajace sie kolory}
      
        end;

      end;

      lpocz:= lpocz+200;
      mpocz:= mpocz+100;
      tpocz:= tpocz+50;
  end;
clear;


{rozpoczecie testu}

    font(10,0,10);
    writeln;
    Writeln('           Podaj swoje imie: ');
    write('           ');read(i1);

    clear;
    writeln;
    writeln('            Witaj ',i1);
    writeln;
    writeln;
    writeln('                 MENU');
    writeln('     Aby rozpoczac test wcisnij 1');
    writeln('     Zasady testu wcisnij 2');
    writeln('     Zakoncz test wcisnij 3');

 {obsluga menu}
  repeat
  read(c);
  case c of
  '1': 
    begin
    clear;
     writeln('Wybierz poziom trudnosci: ');
     writeln('1 - ³atwy');
     writeln('2 - trudny');
     writeln('3 - bardzo trudny');
     read(l);
     
   {obsluga 1 poziomu}   if l=1 then  
       begin
       clear;
{wyswietlanie 10 testow} 
       for w:=1 to 10 do
         begin

          p:=random(200);
          x:=random(10)+1;
          rysowanie_kwadratow(x,p);
          delay(2000);
          clear;

 {pobieranie odpowiedzi od uczestnika testu i zliczanie poprawnych odpowiedzi} 
          writeln('Ile bylo kwadratów: ');
          read(tab[w]);
          clear;

         if tab[w]=x then
          begin
          i:=i+1;    
          end;
        end;
 
    
{przypisanie poziomu w jakim sie znajdujemy}
    poziom:=1;
    {tworzenie i otwieranie pliku do zapisu wynikow}
    zapis_pliku(i1,i,poziom);
 
     
          CoDalej;
{wyzerowanie zmiennej "i" kiedy powtarzamy test w jednej sesji}
              if c='1' then
              i:=0;     
        
           end;



  {obluga 2 poziomu}    if l=2 then  

         begin
         clear;
{wyswietlanie 10 testow}  
         for w:=1 to 10 do
         begin

          p:=random(200);
          x:=random(10)+1;
          rysowanie_kwadratow(x,p);
          delay(1000);
          clear;

 {pobieranie odpowiedzi od uczestnika testu i zliczanie poprawnych odpowiedzi} 
          writeln('Ile bylo kwadratów: ');
          read(tab[w]);
          clear;

         if tab[w]=x then
          begin
          i:=i+1;    
          end;
        end;
 

{przypisanie poziomu w jakim sie znajdujemy}
   poziom:=2;

{zapisywanie dopliku}

zapis_pliku(i1,i,poziom);

{koniec zapisywania do pliku}



          CoDalej;
{wyzerowanie zmiennej "i" kiedy powtarzamy test w jednej sesji}
  if c='1' then
 i:=0;     
          end;

 {obsluga 3 poziomu}   if l=3 then                        
                            
                                                          
begin
                  clear;
{wyswietlanie 10 testow}                   
  for w:=1 to 10 do
    begin
{losowanie koloru}
              re:=random(255);
              ge:=random(255);
              be:=random(255);    
              
                            
{losowanie i wyswietlanie poziomu 3}                   
                  
            los:=random(5);
   if los=0 then
       begin
        brush(1,re,ge,be);
        rectangle(200,400,250,450);
        rectangle(700,300,750,350);
        rectangle(500,270,550,320);
        rectangle(150,100,200,150);
        rectangle(400,70,450,120);
        rectangle(100,400,150,450);
        rectangle(320,370,370,420);    
      num:=7;{przypisanie do zmiennej odpowiedzi poprawnej}
        
     
        delay(500);
        end;
   
    if los=1 then      
       begin
         brush(1,re,ge,be);
         pen(1,255,0,0);
         rectangle(10,0,60,50);
         rectangle(120,0,170,50);
         rectangle(200,400,250,450);
         rectangle(700,300,750,350);
         rectangle(500,270,550,320);
       num:=5;
        
        delay(500);
        end;
    if los=2 then
      begin
       brush(1,re,ge,be);
       rectangle(700,300,750,350);
       rectangle(500,270,550,320);
       rectangle(150,100,200,150);
       rectangle(400,70,450,120);
       rectangle(300,200,350,250);
       rectangle(200,300,250,350);
       rectangle(100,250,150,300);
       rectangle(100,400,150,450);
       rectangle(320,370,370,420);
      num:=9;
      
      delay(500);
      end;   
   if los=3 then
      begin
       brush(1,re,ge,be);
       rectangle(200,300,250,350);
       rectangle(300,200,350,250);
       rectangle(200,300,250,350);
       rectangle(10,0,60,50);
       rectangle(120,0,170,50);
       rectangle(100,250,150,300);
       rectangle(100,400,150,450);
       rectangle(320,370,370,420);
      num:=8;
      
      
      delay(500);
      end;
   if los=4 then
     begin
       brush(1,re,ge,be);
       rectangle(400,70,450,120);
       rectangle(300,200,350,250);
       rectangle(200,300,250,350);
       rectangle(100,250,150,300);
       rectangle(100,400,150,450);
       rectangle(320,370,370,420);
       num:=6;
      
      delay(500);
      end;
      
   clear;

 
 {pobieranie odpowiedzi od uczestnika testu i zliczanie poprawnych odpowiedzi} 
          writeln('Ile bylo kwadratów: ');
          read(tab[w]);
          clear;

         if tab[w]=num then
          begin
          i:=i+1;    
          end;
                  
                  
    end;


{przypisanie poziomu w jakim sie znajdujemy}
poziom:=3;

{otwieranie pliku i zapisywanie do niego wynikow}
  zapis_pliku(i1,i,poziom);

{koniec zapisywania do pliku}



           CoDalej;
{wyzerowanie zmiennej "i" kiedy powtarzamy test w jednej sesji}
  if c='1' then
 i:=0;     
          end;           
            
  end;


{wyswietlanie zasad testu}
 '2': 
 begin
 clear;
 writeln('                            Zasady testu:');
 writeln('Celem testu jest zmierzenie poziomu spostrzegawczoœci uczestnika.');
 writeln('Test sk³ada siê z trzydziestu zadañ i jest podzielony na trzy poziomy trudnoœci.');
 writeln('Zadaniem gracza jest zliczenie, w okreœlonym czasie, ile kwadratów znajdujê siê');
 writeln('w danym zadaniu i zapisaniu ich liczby. Wraz ze wzrostem poziomu trudnoœci skraca');
 writeln('siê d³ugoœæ czasu oraz zmienia siê rozstawienie figur.   ');
 writeln;
 writeln('Wyniki zapisywane sa do pliku o nazwie "wyniki_testu" (domyœlna lokalizacja "c:\") ');
 writeln;
 writeln;

 write('Aby powrocic do menu wcisnij z : ');
 end;

'z':
begin
clear;
writeln;
writeln;
writeln('                 MENU');
writeln('     Aby rozpoczac test wcisnij 1');
writeln('     Zasady testu wcisnij 2');
writeln('     Zakoncz test wcisnij 3');

end;

{otwieranie pliku z wynikami}
'v':
Begin 
  Assign(plik,'c:\wyniki_testu.txt'); 
  Reset(plik); 
  While not eof(plik) do 
    Begin 
      Read(plik,sym); 
      Write(sym); 
    end;
  Close(plik);
end;

end

until UpperCase(C)='3'; 


 {animacja konczenia testu}
 clear;
 rysowanie_konca(0,100,1);    
     
 moveto(160,250);
      
{petla pozwalajaca wyswietlic napisy koncowe w roznych kolorach}
                      
  for licz:=1 to 10 do
  begin
  Font(25,0,150);
  textColor(random(255),random(255),random(255));
  writeln('Dziekujemy');
  moveto(160,290);
  writeln('za udzia³');
  moveto(160,330);
  writeln('w teœcie');
  delay(200);
  moveto(160,250);
  end;

{dokonczenie animacji koncowej}
 kwadrat_dalej;
    


end.                                   