Program MistrzKlawiatury;

Type Wspó³rzêdne = record 
                    x : integer;
                    y : integer;
                   end;
                  
Type Po³o¿enie = array [32 .. 90] of Wspó³rzêdne;

Label 88;

{----------------------------------------------------------}

Procedure Zaznacz(W: Wspó³rzêdne; k: integer);

Const O = 2;    {odleg³oœæ od lewej i górnej krawedzi klawisza}
      R_K = 25;  {rozmiar kó³ka} 
Begin
  Case k of
    0: Pen(2,255,255,255); {kolor musi byæ taki sam, jak t³o klawiszy}
    1: Pen(2,255,0,0);
  end;
  Ellipse(W.x + O,W.y + O,W.x+O+R_K,W.y+O+R_K);
end; {Zaznacz}

{----------------------------------------------------------}

Procedure Klawisz(Var P: Po³o¿enie; W: Wspó³rzêdne; ch : char);

Const  R_K = 30;
       R_CZ = 8; {R_CZ - rozmiar czcionki}
       OL = 5; {O - lewy odstep literki w klawiszu}
       OG = 2; {OL - odstep gorny literki/cyferki na klawiszu}

Var l : integer;

Begin
   l := Ord(ch);
   P[l].x:= W.x;
   P[l].y:= W.y;
   Pen(2, 60 , 0 , 45);
   Rectangle( W.x, W.y , W.x+R_K, W.y+R_K);
   MoveTo(W.x + OL, W.y + OG );
   Write(ch);
end; {Klawisz}

{----------------------------------------------------------}

Procedure Klawiatura(Var P: Po³o¿enie);

Const X0 = 50; {X0, Y0 - wspó³rzêdne po³o¿enia klawiatury}
      Y0 = 300;
      SZ = 380; { SZ, W - szerokoœæ i wysokoœæ klawaitury}
      W = 180;
      R_K = 30;  { rozmiar klawisza}
      O = 5; {O - odstêp miedzy klawiszami}
      P0W = 10; { odstêp pierwszego wiersza ( rzedu cyfr) }
      P1W = 25; { odstep od lewej 1 wiersza liter }
      P2W = 32; { odstep od lewej 2 wiersza liter m}
      P3W = 50; { odstep od lewej 3 wiersza liter}
      O_SP = 105; { odstep wiersza ze spacja od lewej}
      SZ_S = 140; { szerokoœæ klawisza spacji}
         
Var  i, j, k : integer;
     Wsp : Wspó³rzêdne;

Begin
   {rysowanie obramówki klawiatury}
   Pen(2,160,82,45);
   Rectangle( X0,Y0, X0+SZ , Y0+W);
   {rysowanie kolejnych klawiszy}

   { Klawiszy z cyferkami }
   for i:=0 to 8 do
     begin
       Wsp.x:= X0+P0W+(O+R_K)*(i);
       Wsp.y:= Y0+O;
       Klawisz(P, Wsp, Chr(49+i));
     end;
   { plus 0 }
   Wsp.x:= X0+P0W+(O+R_K)*(i+1);
   Wsp.y:= Y0+O;
   Klawisz(P, Wsp, '0');
   { Pozosta³ych klawiszy... wierszami - Wsp.y bez zamian}
   Wsp.y:= Y0+O+(R_K+O);
   k:= 0;
   { Q }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'Q'); k := k+1;
   { W }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'W'); k := k+1;
   { E }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'E'); k := k+1;
   { R }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'R'); k := k+1;
   { T }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'T'); k := k+1;
   { Y }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'Y'); k := k+1;
   { U }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'U'); k := k+1;
   { I }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'I'); k := k+1;
   { O }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'O'); k := k+1;
   { P }
   Wsp.x := X0+P1W+(R_K+O)*k;
   Klawisz(P, Wsp, 'P'); k := k+1;
   { drugi wiersz liter }
   Wsp.y:= Y0+O+(R_K+O)*2;
   k:= 0;
   { A }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'A'); k := k+1;
   { S }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'S'); k := k+1;
   { D }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'D'); k := k+1;
   { F }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'F'); k := k+1;
   { G }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'G'); k := k+1;
   { H }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'H'); k := k+1;
   { J }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'J'); k := k+1;
   { K }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'K'); k := k+1;
   { L }
   Wsp.x := X0+P2W+(R_K+O)*k;
   Klawisz(P, Wsp, 'L'); k := k+1;
    { trzeci wiersz liter }
   Wsp.y:= Y0+O+(R_K+O)*3;
   k:= 0;
   { Z }
   Wsp.x := X0+P3W+(R_K+O)*k;
   Klawisz(P, Wsp, 'Z'); k := k+1;
   { X }
   Wsp.x := X0+P3W+(R_K+O)*k;
   Klawisz(P, Wsp, 'X'); k := k+1;
   { C }
   Wsp.x := X0+P3W+(R_K+O)*k;
   Klawisz(P, Wsp, 'C'); k := k+1;
   { V }
   Wsp.x := X0+P3W+(R_K+O)*k;
   Klawisz(P, Wsp, 'V'); k := k+1;
   { B }
   Wsp.x := X0+P3W+(R_K+O)*k;
   Klawisz(P, Wsp, 'B'); k := k+1;
   { N }
   Wsp.x := X0+P3W+(R_K+O)*k;
   Klawisz(P, Wsp, 'N'); k := k+1;
   { M }
   Wsp.x := X0+P3W+(R_K+O)*k;
   Klawisz(P, Wsp, 'M'); k := k+1;
   { i spacja , kod ascii = 32}
   P[32].x:= X0 + O_SP + round(SZ_S/2) - 10;
   P[32].y:= Y0+O+(R_K+O)*4;
   Pen(2, 60 , 0 , 45);
   Rectangle( X0 + O_SP, Y0+O+(R_K+O)*4 ,X0 + O_SP + SZ_S, Y0+O+(R_K+O)*4+R_K);
   
end; {Klawiatura}

{----------------------------------------------------------}

{Sprawdza i zaznacza na klawiaturze okreslony klawisz}
Procedure Sprawdz_i_zaznacz(Var P: Po³o¿enie; ch: char; k :integer);
Begin
    if ( (Ord(ch)>=97) and (Ord(ch)<=122) ) then
        begin
         Zaznacz(P[Ord(ch)-32], k);
        end
       else
         begin
          if ch = ' ' then
             begin
               Zaznacz(P[32], k);
             end
          else
             begin
               if ( (Ord(ch)>=48) and (Ord(ch)<=57) ) then
                 begin
                   Zaznacz(P[Ord(ch)], k);
                 end
              end
    end;
end;

{----------------------------------------------------------}

Var  P : Po³o¿enie;
     napis : String;
     k, x, y, poz, rozmiar : integer; {poz - pozycja kursora}
     il_wpisanych_znakow, il_bledow : integer;
     prawda : boolean;
     ch : char;
     g1,g2, m1,m2, s1,s2, ilosc_sekund : integer;
     ilosc_pop_znakow_na_sek : real;
     poprawnosc : integer;
     

Begin
   {napis instrukcji i narysowanie ramek}
   Pen(2,139,0,0);
   Rectangle( 30,30, 450 , 500);
   Klawiatura(P);
   MoveTo(40,40);
   Write('Info - wcisnij dowolny klawisz aby zaczac');
   MoveTo(40,55);
   Write('     - aby wyjsc kliknij mysza');
   {czekanie na wprowadzenie jakiegos znaku}
   Event(k,x,y);
   {wypisanie testowego tektu do napisania}
   Pen(1,255,255,255);
   Brush( 1,245 ,245 ,220 );
   Rectangle( 60,140, 420 , 160);
   napis := 'sprawdzam litery od a do z i cyfry od 0 do 9';
   MoveTo(63,142);
   Write(napis);
   rozmiar:= Length( napis );
   
   {rysowanie pola do wprowadzania tekstu}
   Brush( 1,255, 228, 225  );
   Rectangle( 60,180, 420 , 200);
   Brush( 0,255, 228, 225  );
   MoveTo(63, 182);
   prawda:= true;
   poz:= 1;
   il_wpisanych_znakow:= 0;
   Time(g1 ,m1,s1);
   while prawda do
     Begin
       ch := napis[poz];
       Sprawdz_i_zaznacz(P, ch, 1);
       Event(k,x,y);
       {wczytano znak - zwiekszam liczbe wpisanych znakow}
       il_wpisanych_znakow:= il_wpisanych_znakow +1;
       If not(k=1) then goto 88; {przerwanie petli}
       If y=2 then
         begin
           if ch = Chr(x) then
             begin
               {wprowadzony znak jest poprawny, wiec odznaczam dany klawisz i wypisuje literke}
               {zwiekszam rowniesz pozycje we wzorcowym lancuchu}
               Sprawdz_i_zaznacz(P, ch, 0);
               Write(ch);
               poz:= poz + 1;
             end;
          end;
       if poz = (rozmiar + 1) then
         begin
           {koniec wpisywania tekstu}
           {Obliczanie statystyk i wypisywanie ich w odpowiednim polu}
           Time(g2 ,m2,s2);
           {obliczanie czasu jaki uplynal od poczatku zadania}
           ilosc_sekund:= (g2-g1)*3600 + (m2-m1)*60 + (s2-s1);

           ilosc_pop_znakow_na_min:= (rozmiar/ilosc_sekund)*60;
           {obliczenie procentu poprawnie wprowadzonych znaków}
           poprawnosc:= round((rozmiar*100)/il_wpisanych_znakow);

           {rysowanie pola do wyswietlenia wyniku i wyswietlenie wyniku}
           Pen(1,255,255,255);
           Brush( 1,255, 182, 193 );
           Rectangle( 60,220, 360 ,255);
           MoveTo(61, 222);
           Write( 'Wynik: poprawnoœæ  ', poprawnosc, '%');
           MoveTo(61, 236);
           Write( '       szybkoœæ  ', ilosc_pop_znakow_na_min:4:2, ' znaków/minute');
           Brush( 0,245 ,245 ,220 );
           {przerwanie petli}
           goto 88;
         end;    
     end;

   88: MoveTo(165, 490 );
   Writeln('Zakoñczono program');

end.
   
 
