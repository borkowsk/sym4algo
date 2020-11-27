program Drapie¿niki_i_Ofiary;

const
  Bok=30; {liczba komórek boku tablicy}
  xPocz=0; {wspó³rzêdna x lewego górnego rogu rysowanej tablicy}
  yPocz=0; {wspó³rzêdna y lewego górnego rogu rysowanej tablicy}
  Rozm=8; {dlugoœæ boku rysowanych komórek}
  g_of=0.4; {gêstoœæ ofiar w tablicy}
  g_drap=0.2; {gêstoœæ drapie¿ników w tablicy; musi byæ mniejsza lub równa 1-g_of}
  g_drz=0.1; {gêstoœæ drzew w tablicy; musi byæ mniejsza lub równa 1-g_of-g_drap}
  p0_of=0.1; {prawdopodobieñstwo naturalnej œmierci ofiary}
  p11_of=0.4; {prawdopodobieñstwo rozmno¿enia ofiary; musi byæ mniejsza lub równa 1-p0_of}
  p5_of=0.1; {prawdopodobieñstwo wejœcia ofiary na drzewo; musi byæ mniejsza lub równa 1-p0_of}
  p4_of=0.1; {prawdopodobieñstwo zejœcia ofiary z drzewa}  
  p0_drap2=0.1; {prawdopodobieñstwo naturalnej œmierci drapie¿nika}
  p2_drap3=0.2; {prawdopodobieñstwo zg³odnienia drapie¿nika}
  p22_drap3=0.6; {prawdopodobieñstwo rozmno¿enia drapie¿nik; musi byæ mniejsze lub równa 1-p2_drap}

type
  Swiat=array[1..Bok,1..Bok] of integer; {1-komórka z ofiar¹, 2-z g³odnym drapie¿nikiem, 
                                          3-z najedzonym drapie¿nikiem, 0-pusta,
                                          4-z pustym drzewem, 5-z ofiar¹ na drzewie}
                                          
  para=record
    x,y: integer;
  end;
  TabKierunkow=array[0..7] of Para;
  TabStatystyk=array[0..5] of integer;
  
var
  TenSwiat:Swiat;
  Kierunki:TabKierunkow;
  Statystyki:TabStatystyk;
  Komorka, Kierunek:Para;
  krok:integer;
  f:text;

procedure Inicjalizacja (var ts:Swiat; var tk:TabKierunkow);
 
  procedure Inicjalizacja_Swiata (var ts:Swiat);
    var 
      i,j:integer;
      p:real;
    begin
      for i:=1 to Bok do
        for j:=1 to Bok do begin
          p:=random;
          if (p<g_of) then
            ts[i,j]:=1
          else if ((p>=g_of+g_drap) and (p<1-g_drz)) then
            ts[i,j]:=2
          else if (p>=1-g_drz) then
            ts[i,j]:=4            
          else
            ts[i,j]:=0;
        end;
    end;
  
  procedure Inicjalizacja_Kierunkow (var tk:TabKierunkow);
    var ix,iy,j:integer;
    begin
      j:=0;
      for ix:=-1 to 1 do
        for iy:=-1 to 1 do
          if not((ix=0) and (iy=0)) then begin
            tk[j].x:=ix;
            tk[j].y:=iy;
            j:=j+1;
          end;
    end;

  begin
    Inicjalizacja_Swiata (ts);
    Inicjalizacja_Kierunkow (tk);
  end;

procedure LosujKomorke (var kom:Para); {zmienia globaln¹ zmienn¹ Komorka}
  begin
    kom.x:=random(bok)+1;
    kom.y:=random(bok)+1;
  end;

procedure LosujKierunek (var kier:Para); {zmienia globaln¹ zmienn¹ Kierunek}
  begin
    kier:=Kierunki[random(8)];
  end;
  
Function CzyPusta (ts:Swiat; kom:Para):integer; {1-pusta; 0-pe³na}
  begin
    if (ts[kom.x,kom.y]=0) then
      CzyPusta:=1
    else
      CzyPusta:=0;
  end;

Function CzyDrap (ts:Swiat; kom:Para):integer; {1-Drapie¿nik; 0-wpp}
  begin
    if ((ts[kom.x,kom.y]=2) or (ts[kom.x,kom.y]=3)) then
      CzyDrap:=1
    else
      CzyDrap:=0;
  end;
  
Function CzyOf (ts:Swiat; kom:Para):integer; {1-Ofiara; 0-wpp}
  begin
    if (ts[kom.x,kom.y]=1) then
      CzyOf:=1
    else
      CzyOf:=0;
  end;
  
Function CzyPusteDrz (ts:Swiat; kom:Para):integer; {1-Puste Drzewo; 0-wpp}
  begin
    if (ts[kom.x,kom.y]=4) then
      CzyPusteDrz:=1
    else
      CzyPusteDrz:=0;
  end;  

procedure UstawKolor (ts:Swiat; i,j:integer); {ustawianie koloru w zale¿noœci od tego, co znajduje siê w komórce}
  begin
    case ts[i,j] of
      1: Brush(1, 220,220,255); 
      2: Brush(1, 255,0,0);
      3: Brush(1, 192,0,0);
      4: Brush(1, 0,220,0);
      5: Brush(1, 0,220,220)
    else Brush(1, 255,255,255);
    end;  
  end;
  
procedure RysujSwiat (ts:Swiat); {rysowanie ca³ej tablicy}
  var 
     i,j,kolor:integer; 
  begin 
    Pen(1,245,245,245);
    for i:=1 to bok do 
      for j:=1 to bok do 
        begin 
          UstawKolor(ts, i,j);             
          Rectangle(xPocz+i*Rozm,yPocz+j*Rozm,xPocz+(i+1)*Rozm,yPocz+(j+1)*Rozm); 
        end; 
  end;
  
procedure RysujZmiane (ts:Swiat; kom,nowe:Para); {rysowanie tylko tego, co siê zmieni³o}
  var 
    kolor:integer; 
  begin 
    Pen(1,245,245,245);
    UstawKolor(ts, kom.x,kom.y);
    Rectangle(xPocz+kom.x*Rozm,yPocz+kom.y*Rozm,xPocz+(kom.x+1)*Rozm,yPocz+(kom.y+1)*Rozm);
    if ((nowe.x>0) and (nowe.y>0)) then begin
      UstawKolor(ts, nowe.x,nowe.y);    
      Rectangle(xPocz+nowe.x*Rozm,yPocz+nowe.y*Rozm,xPocz+(nowe.x+1)*Rozm,yPocz+(nowe.y+1)*Rozm);
    end;  
  end;

Procedure WypiszKrok(numerkroku, ypoz:integer); 
  begin
    Brush(1,255,255,255); 
    WriteLn; 
    MoveTo(0,ypoz);
    WriteLn('Numer kroku = ',numerkroku:4);
  end;

Procedure ZliczanieStatystyk(ts:Swiat; Var stat:TabStatystyk); 
  var 
    i,j,pom:integer; 
  begin 
    for pom:=0 to 5 do 
      stat[pom]:=0; 
    for i:=1 to bok do 
      for j:=1 to bok do 
        stat[ts[i,j]]:=stat[ts[i,j]]+1; 
end;

Procedure WypiszStatystyki(stat:TabStatystyk; ypoz:integer); 
  begin
    Brush(1,255,255,255); 
    WriteLn; 
    MoveTo(0,ypoz);
    WriteLn('Liczba Pustych: ',stat[0]:4);
    WriteLn('Liczba Ofiar: ',stat[1]:4);
    WriteLn('Liczba G³odnych Drapie¿ników: ',stat[2]:4);
    WriteLn('Liczba Najedzonych Drapie¿ników: ',stat[3]:4);
    WriteLn('Liczba Pustych Drzew: ',stat[4]:4);
    WriteLn('Liczba Zajêtych Drzew: ',stat[5]:4);        
  end;

Procedure WypiszDoPliku (var f:text; stat:TabStatystyk; numkr:integer);
  var
    pom:integer;
  begin
    if (numkr=-1) then
      Write(f, 'numer_kroku puste ofiary g³odne_drap najedzone_drap puste_drzewa zajête_drzewa')    else
      begin
        Write(f, numkr);
        for pom:=0 to 5 do
          Write (f, ' ',stat[pom]);
      end;
    writeln(f);  
  end;
  
procedure Ruch (var ts:Swiat; var kom,nowe:Para);
  begin
    ts[nowe.x,nowe.y]:=ts[kom.x,kom.y];
    ts[kom.x,kom.y]:=0;
  end;

procedure Rozmnazanie (var ts:Swiat; var kom,nowe:Para); {drapie¿niki lub ofiary}
  begin
    if (CzyDrap(ts,kom)=1) then
      ts[kom.x,kom.y]:=2;
    ts[nowe.x,nowe.y]:=ts[kom.x,kom.y];
  end;

procedure Zjadanie (var ts:Swiat; var kom,nowe:Para);
  begin
    ts[nowe.x,nowe.y]:=3;
    ts[kom.x,kom.y]:=0;
  end;
  
procedure Umieranie (var ts:Swiat; var kom:Para);
  begin
    ts[kom.x,kom.y]:=0;
  end;
  
procedure Glodnienie (var ts:Swiat; var kom:Para);
  begin
    ts[kom.x,kom.y]:=2;
  end;

procedure NaDrzewo (var ts:Swiat; var kom,nowe:Para); {kom-komórka z ofiar¹, nowe-komórka z drzewem}
  begin
    ts[nowe.x,nowe.y]:=5;  
    ts[kom.x,kom.y]:=0;
  end;

procedure ZDrzewa (var ts:Swiat; var kom,nowe:Para);  {kom-komórka z ofiar¹ na drzewie, nowe-komórka pusta}
  begin
    ts[nowe.x,nowe.y]:=1;  
    ts[kom.x,kom.y]:=4;
  end;  
    
procedure KrokMC (var ts:Swiat; var kom,kier:Para);
  var
    nowe:Para;
    i,ile_kom,zmiana:integer;
    p:real;
  begin
    ile_kom:=bok*bok;
    for i:=1 to ile_kom do begin
      zmiana:=1;
      nowe.x:=0;
      nowe.y:=0;
      p:=random;
      LosujKomorke(kom);
      case ts[kom.x,kom.y] of
        1: begin
             if (p<p0_of) then
               Umieranie(ts,kom)
             else begin
               LosujKierunek(kier);
               nowe.x:=((bok+kom.x+kier.x-1) mod bok)+1;
               nowe.y:=((bok+kom.y+kier.y-1) mod bok)+1;
               if (CzyPusta(ts, nowe)=1) then begin
                 if (p>=1-p11_of) then
                   Rozmnazanie(ts, kom,nowe)
                 else
                   Ruch(ts, kom,nowe);
               end
               else if ((CzyPusteDrz(ts, nowe)=1) and (p>=1-p5_of)) then
                 NaDrzewo(ts, kom,nowe)
               else zmiana:=0;
             end;
           end;
        2: begin
             if (p<p0_drap2) then
               Umieranie(ts, kom)
             else begin
               LosujKierunek(kier);
               nowe.x:=((bok+kom.x+kier.x-1) mod bok)+1;
               nowe.y:=((bok+kom.y+kier.y-1) mod bok)+1;
               if (CzyOf(ts, nowe)=1) then
                 Zjadanie(ts, kom,nowe)
               else if (CzyPusta(ts, nowe)=1) then
                 Ruch(ts, kom,nowe)
               else zmiana:=0;                                   
             end;       
           end;
        3: begin
             if (p<p2_drap3) then
               Glodnienie(ts,kom)
             else begin
                 LosujKierunek(kier);
                 nowe.x:=((bok+kom.x+kier.x-1) mod bok)+1;
                 nowe.y:=((bok+kom.y+kier.y-1) mod bok)+1; 
               if (CzyPusta(ts, nowe)=1) then begin
                 if (p>=1-p22_drap3) then
                   Rozmnazanie(ts, kom,nowe)
                 else
                   Ruch(ts, kom,nowe);                 
               end
               else zmiana:=0;               
             end;            
           end;
        5: begin
             LosujKierunek(kier);
             nowe.x:=((bok+kom.x+kier.x-1) mod bok)+1;
             nowe.y:=((bok+kom.y+kier.y-1) mod bok)+1;
             if (CzyPusta(ts, nowe)=1) then begin
               if (p>=1-p4_of) then
                 ZDrzewa(ts, kom,nowe)
               else zmiana:=0  
             end
             else zmiana:=0;
           end           
        else zmiana:=0;   
      end;
      {if((zmiana=1)) then
        RysujZmiane(ts,kom,nowe);}
    end;
  end;


BEGIN
  krok:=0;
  Inicjalizacja (TenSwiat, Kierunki);
  RysujSwiat(TenSwiat);
  Assign(f, 'wynik.dat');
  Rewrite(f);
  WypiszDoPliku(f, Statystyki, -1);
  repeat
    if (trunc(krok/10) = krok/10) then begin
      RysujSwiat(TenSwiat);
      ZliczanieStatystyk(TenSwiat, Statystyki);
      WypiszStatystyki(Statystyki, yPocz+(Bok+2)*Rozm+20);
      WypiszKrok(krok, yPocz+(Bok+2)*Rozm);
      WypiszDoPliku(f, Statystyki, krok);
    end;
    KrokMC(TenSwiat, Komorka, Kierunek);
    krok:=krok+1;
  until IsEvent;
  Close(f);
END.
