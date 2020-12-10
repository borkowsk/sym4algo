program mistrzklawiatury;

type wspó³rzêdne = record 
                    x : integer;
                    y : integer;
                   end;
                  
type po³o¿enie = array [32 .. 90] of wspó³rzêdne;

label 88;

{----------------------------------------------------------}

procedure zaznacz(w: wspó³rzêdne; k: integer);

const o = 2;    {odleg³oœæ od lewej i górnej krawedzi klawisza}
      r_k = 25;  {rozmiar kó³ka} 
begin
  case k of
    0: pen(2,255,255,255); {kolor musi byæ taki sam, jak t³o klawiszy}
    1: pen(2,255,0,0);
  end;
  ellipse(w.x + o,w.y + o,w.x+o+r_k,w.y+o+r_k);
end; {zaznacz}

{----------------------------------------------------------}

procedure klawisz(var p: po³o¿enie; w: wspó³rzêdne; ch : char);

const  r_k = 30;
       r_cz = 8; {r_cz - rozmiar czcionki}
       ol = 5; {o - lewy odstep literki w klawiszu}
       og = 2; {ol - odstep gorny literki/cyferki na klawiszu}

var l : integer;

begin
   l := ord(ch);
   p[l].x:= w.x;
   p[l].y:= w.y;
   pen(2, 60 , 0 , 45);
   rectangle( w.x, w.y , w.x+r_k, w.y+r_k);
   moveto(w.x + ol, w.y + og );
   write(ch);
end; {klawisz}

{----------------------------------------------------------}

procedure klawiatura(var p: po³o¿enie);

const x0 = 50; {x0, y0 - wspó³rzêdne po³o¿enia klawiatury}
      y0 = 300;
      sz = 380; { sz, w - szerokoœæ i wysokoœæ klawaitury}
      w = 180;
      r_k = 30;  { rozmiar klawisza}
      o = 5; {o - odstêp miedzy klawiszami}
      p0w = 10; { odstêp pierwszego wiersza ( rzedu cyfr) }
      p1w = 25; { odstep od lewej 1 wiersza liter }
      p2w = 32; { odstep od lewej 2 wiersza liter m}
      p3w = 50; { odstep od lewej 3 wiersza liter}
      o_sp = 105; { odstep wiersza ze spacja od lewej}
      sz_s = 140; { szerokoœæ klawisza spacji}
         
var  i, j, k : integer;
     wsp : wspó³rzêdne;

begin
   {rysowanie obramówki klawiatury}
   pen(2,160,82,45);
   rectangle( x0,y0, x0+sz , y0+w);
   {rysowanie kolejnych klawiszy}

   { klawiszy z cyferkami }
   for i:=0 to 8 do
     begin
       wsp.x:= x0+p0w+(o+r_k)*(i);
       wsp.y:= y0+o;
       klawisz(p, wsp, chr(49+i));
     end;
   { plus 0 }
   wsp.x:= x0+p0w+(o+r_k)*(i+1);
   wsp.y:= y0+o;
   klawisz(p, wsp, '0');
   { pozosta³ych klawiszy... wierszami - wsp.y bez zamian}
   wsp.y:= y0+o+(r_k+o);
   k:= 0;
   { q }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'q'); k := k+1;
   { w }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'w'); k := k+1;
   { e }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'e'); k := k+1;
   { r }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'r'); k := k+1;
   { t }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 't'); k := k+1;
   { y }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'y'); k := k+1;
   { u }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'u'); k := k+1;
   { i }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'i'); k := k+1;
   { o }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'o'); k := k+1;
   { p }
   wsp.x := x0+p1w+(r_k+o)*k;
   klawisz(p, wsp, 'p'); k := k+1;
   { drugi wiersz liter }
   wsp.y:= y0+o+(r_k+o)*2;
   k:= 0;
   { a }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'a'); k := k+1;
   { s }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 's'); k := k+1;
   { d }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'd'); k := k+1;
   { f }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'f'); k := k+1;
   { g }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'g'); k := k+1;
   { h }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'h'); k := k+1;
   { j }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'j'); k := k+1;
   { k }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'k'); k := k+1;
   { l }
   wsp.x := x0+p2w+(r_k+o)*k;
   klawisz(p, wsp, 'l'); k := k+1;
    { trzeci wiersz liter }
   wsp.y:= y0+o+(r_k+o)*3;
   k:= 0;
   { z }
   wsp.x := x0+p3w+(r_k+o)*k;
   klawisz(p, wsp, 'z'); k := k+1;
   { x }
   wsp.x := x0+p3w+(r_k+o)*k;
   klawisz(p, wsp, 'x'); k := k+1;
   { c }
   wsp.x := x0+p3w+(r_k+o)*k;
   klawisz(p, wsp, 'c'); k := k+1;
   { v }
   wsp.x := x0+p3w+(r_k+o)*k;
   klawisz(p, wsp, 'v'); k := k+1;
   { b }
   wsp.x := x0+p3w+(r_k+o)*k;
   klawisz(p, wsp, 'b'); k := k+1;
   { n }
   wsp.x := x0+p3w+(r_k+o)*k;
   klawisz(p, wsp, 'n'); k := k+1;
   { m }
   wsp.x := x0+p3w+(r_k+o)*k;
   klawisz(p, wsp, 'm'); k := k+1;
   { i spacja , kod ascii = 32}
   p[32].x:= x0 + o_sp + round(sz_s/2) - 10;
   p[32].y:= y0+o+(r_k+o)*4;
   pen(2, 60 , 0 , 45);
   rectangle( x0 + o_sp, y0+o+(r_k+o)*4 ,x0 + o_sp + sz_s, y0+o+(r_k+o)*4+r_k);
   
end; {klawiatura}

{----------------------------------------------------------}

{sprawdza i zaznacza na klawiaturze okreslony klawisz}
procedure sprawdz_i_zaznacz(var p: po³o¿enie; ch: char; k :integer);
begin
    if ( (ord(ch)>=97) and (ord(ch)<=122) ) then
        begin
         zaznacz(p[ord(ch)-32], k);
        end
       else
         begin
          if ch = ' ' then
             begin
               zaznacz(p[32], k);
             end
          else
             begin
               if ( (ord(ch)>=48) and (ord(ch)<=57) ) then
                 begin
                   zaznacz(p[ord(ch)], k);
                 end
              end
    end;
end;

{----------------------------------------------------------}

var  p : po³o¿enie;
     napis : string;
     k, x, y, poz, rozmiar : integer; {poz - pozycja kursora}
     il_wpisanych_znakow, il_bledow : integer;
     prawda : boolean;
     ch : char;
     g1,g2, m1,m2, s1,s2, ilosc_sekund : integer;
     ilosc_pop_znakow_na_sek : real;
     poprawnosc : integer;
     

begin
   {napis instrukcji i narysowanie ramek}
   pen(2,139,0,0);
   rectangle( 30,30, 450 , 500);
   klawiatura(p);
   moveto(40,40);
   write('info - wcisnij dowolny klawisz aby zaczac');
   moveto(40,55);
   write('     - aby wyjsc kliknij mysza');
   {czekanie na wprowadzenie jakiegos znaku}
   event(k,x,y);
   {wypisanie testowego tektu do napisania}
   pen(1,255,255,255);
   brush( 1,245 ,245 ,220 );
   rectangle( 60,140, 420 , 160);
   napis := 'sprawdzam litery od a do z i cyfry od 0 do 9';
   moveto(63,142);
   write(napis);
   rozmiar:= length( napis );
   
   {rysowanie pola do wprowadzania tekstu}
   brush( 1,255, 228, 225  );
   rectangle( 60,180, 420 , 200);
   brush( 0,255, 228, 225  );
   moveto(63, 182);
   prawda:= true;
   poz:= 1;
   il_wpisanych_znakow:= 0;
   time(g1 ,m1,s1);
   while prawda do
     begin
       ch := napis[poz];
       sprawdz_i_zaznacz(p, ch, 1);
       event(k,x,y);
       {wczytano znak - zwiekszam liczbe wpisanych znakow}
       il_wpisanych_znakow:= il_wpisanych_znakow +1;
       if not(k=1) then goto 88; {przerwanie petli}
       if y=2 then
         begin
           if ch = chr(x) then
             begin
               {wprowadzony znak jest poprawny, wiec odznaczam dany klawisz i wypisuje literke}
               {zwiekszam rowniesz pozycje we wzorcowym lancuchu}
               sprawdz_i_zaznacz(p, ch, 0);
               write(ch);
               poz:= poz + 1;
             end;
          end;
       if poz = (rozmiar + 1) then
         begin
           {koniec wpisywania tekstu}
           {obliczanie statystyk i wypisywanie ich w odpowiednim polu}
           time(g2 ,m2,s2);
           {obliczanie czasu jaki uplynal od poczatku zadania}
           ilosc_sekund:= (g2-g1)*3600 + (m2-m1)*60 + (s2-s1);

           ilosc_pop_znakow_na_min:= (rozmiar/ilosc_sekund)*60;
           {obliczenie procentu poprawnie wprowadzonych znaków}
           poprawnosc:= round((rozmiar*100)/il_wpisanych_znakow);

           {rysowanie pola do wyswietlenia wyniku i wyswietlenie wyniku}
           pen(1,255,255,255);
           brush( 1,255, 182, 193 );
           rectangle( 60,220, 360 ,255);
           moveto(61, 222);
           write( 'wynik: poprawnoœæ  ', poprawnosc, '%');
           moveto(61, 236);
           write( '       szybkoœæ  ', ilosc_pop_znakow_na_min:4:2, ' znaków/minute');
           brush( 0,245 ,245 ,220 );
           {przerwanie petli}
           goto 88;
         end;    
     end;

   88: moveto(165, 490 );
   writeln('zakoñczono program');

end.
   
 
