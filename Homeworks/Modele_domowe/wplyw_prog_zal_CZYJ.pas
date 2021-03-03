Program Zaliczeniowy; 
{Implementacja modelu wp�ywu spo�ecznego 
dla pi�ciu rodzaj�w s�siedztwa, 
dw�ch pogl�d�w, pe�nym zaludnieniu, bez si�}
 
Const 
{Zmienne kluczowe dla symulacji}
   Bok=16; {pierwiastek z liczby agent�w, czyli ilu na kraw�dzi}
   IleS�siad�w=24; {4-czterech s�siad�w po bokach, 
                   8-o�miu s�siad�w na oko�o,
                   12-szesnastu s�siad�w na oko�o,      
                   20-dwudziestu s�siad�w na oko�o,
                   24-dwudziestuczterech s�siad�w na oko�o}
   IlePogl�d�w=6; {Liczba konkuruj�cych poglad�w}
{Zmienne potrzebne do wizualizacji}   
   Rozm=12; {D�ugo�� boku agenta = rozmiar pojedynczej komorki z brzegiem(?)} 
   Brzeg=1; {Obwodka} 
   xPocz�tek=10; {lewa kraw�d� od kt�rej zaczynamy pisa� i rysowa�}
   yPocz�tek=10; {pionowa kraw�d� od kt�rej zaczynamy pisa� i rysowa�}

Type 
  Agent=record 
    x,y:integer; {wsp�rz�dne}
    pogl�d:integer; {1..IlePogladow} 
    TabS�siad�w_x,TabS�siad�w_y:array[1..IleS�siad�w] of integer;
  end; 

  �wiat=array[1..Bok,1..Bok] of Agent; {Tablica z agentami}

  TabPogl�d�w=array[1..IlePogl�d�w] of integer; 

Var 
   �wiatSymulacji:�wiat; 
   Pogl�dy: TabPogl�d�w; 
   numerkroku:integer;
   f:text;



Procedure Inicjalizacja(Var Ten�wiat:�wiat); 
  
  procedure UstalS�siedztwo (Var a:Agent);
    Var pom,x,y:integer;
    Begin
      x:=a.x;
      y:=a.y;
      a.TabS�siad�w_x[1]:=x;
      a.TabS�siad�w_y[1]:=y-1;
      a.TabS�siad�w_x[2]:=x+1;
      a.TabS�siad�w_y[2]:=y;
      a.TabS�siad�w_x[3]:=x;
      a.TabS�siad�w_y[3]:=y+1;
      a.TabS�siad�w_x[4]:=x-1;
      a.TabS�siad�w_y[4]:=y;
      If (IleS�siad�w>4) then
        Begin   
          a.TabS�siad�w_x[5]:=x-1;
          a.TabS�siad�w_y[5]:=y-1;
          a.TabS�siad�w_x[6]:=x+1;
          a.TabS�siad�w_y[6]:=y-1;
          a.TabS�siad�w_x[7]:=x+1;
          a.TabS�siad�w_y[7]:=y+1;
          a.TabS�siad�w_x[8]:=x-1;
          a.TabS�siad�w_y[8]:=y+1;  
          If (IleS�siad�w>8) then
            Begin   
              a.TabS�siad�w_x[9]:=x;
              a.TabS�siad�w_y[9]:=y-2;
              a.TabS�siad�w_x[10]:=x+2;
              a.TabS�siad�w_y[10]:=y;
              a.TabS�siad�w_x[11]:=x;
              a.TabS�siad�w_y[11]:=y+2;
              a.TabS�siad�w_x[12]:=x-2;
              a.TabS�siad�w_y[12]:=y; 
              If (IleS�siad�w>12) then
                Begin   
                  a.TabS�siad�w_x[13]:=x-1;
                  a.TabS�siad�w_y[13]:=y-2;
                  a.TabS�siad�w_x[14]:=x+1;
                  a.TabS�siad�w_y[14]:=y-2;
                  a.TabS�siad�w_x[15]:=x+2;
                  a.TabS�siad�w_y[15]:=y-1;
                  a.TabS�siad�w_x[16]:=x+2;
                  a.TabS�siad�w_y[16]:=y+1;  
                  a.TabS�siad�w_x[17]:=x+1;
                  a.TabS�siad�w_y[17]:=y+2;
                  a.TabS�siad�w_x[18]:=x-1;
                  a.TabS�siad�w_y[18]:=y+2;
                  a.TabS�siad�w_x[19]:=x+2;
                  a.TabS�siad�w_y[19]:=y+1;
                  a.TabS�siad�w_x[20]:=x+2;
                  a.TabS�siad�w_y[20]:=y-1;  
                  If (IleS�siad�w>20) then
                    Begin   
                      a.TabS�siad�w_x[21]:=x-2;
                      a.TabS�siad�w_y[21]:=y-2;
                      a.TabS�siad�w_x[22]:=x+2;
                      a.TabS�siad�w_y[22]:=y-2;
                      a.TabS�siad�w_x[23]:=x+2;
                      a.TabS�siad�w_y[23]:=y+2;
                      a.TabS�siad�w_x[24]:=x-2;
                      a.TabS�siad�w_y[24]:=y+2;            
                    end;                               
                end; 
            end;
        end;
      For pom:=1 to IleS�siad�w do
        If ((a.TabS�siad�w_x[pom]<1) or (a.TabS�siad�w_y[pom]<1) or (a.TabS�siad�w_x[pom]>Bok) or (a.TabS�siad�w_y[pom]>Bok)) then
          Begin
            a.TabS�siad�w_x[pom]:=0;
            a.TabS�siad�w_y[pom]:=0;
          end;
    end;  
  
  Var 
    i,j:integer;
  
  Begin
    For i:=1 to Bok do
      For j:=1 to Bok do
        Begin
          Ten�wiat[i,j].x:=i;
          Ten�wiat[i,j].y:=j;          
          Ten�wiat[i,j].pogl�d:=random(IlePogl�d�w)+1;
          UstalS�siedztwo(Ten�wiat[i,j]);
        end;  
  end;



Procedure KrokSymulacji(Var Ten�wiat:�wiat); 
{Procedura zmiany stanu symulacji. Zawiera procedury pomocnicze.} 

  procedure ZliczPogl�dyOtoczenia(a:agent; Var Pogl�dyOtoczenia:TabPogl�d�w); 
    Var
      pom:integer;
    Begin
      For pom:=1 to IlePogl�d�w do 
        Pogl�dyOtoczenia[pom]:=0;
      Pogl�dyOtoczenia[a.pogl�d]:=1;
      For pom:=1 to IleS�siad�w do 
        If (a.TabS�siad�w_x[pom]>0) then
          Pogl�dyOtoczenia[Ten�wiat[a.TabS�siad�w_x[pom],a.TabS�siad�w_y[pom]].pogl�d]:=Pogl�dyOtoczenia[Ten�wiat[a.TabS�siad�w_x[pom],a.TabS�siad�w_y[pom]].pogl�d]+1; 
    end; 

  procedure UstalPogl�d(Var a:Agent; Pogl�dyOtoczenia:TabPogl�d�w); 
    Var
      pom,max,pogl�d: integer; 
    Begin 
      {ZliczPogl�dyOtoczenia(a,Pogl�dyOtoczenia);}
      pogl�d:=a.pogl�d;
      max:=1; 
      For pom:=1 to IlePogl�d�w do 
        Begin; 
          If ((Pogl�dyOtoczenia[pom]>max) or ((Pogl�dyOtoczenia[pom]=max)and(pom<>a.pogl�d)and(random<0.5))) then 
            Begin 
              pogl�d:=pom; 
              max:=Pogl�dyOtoczenia[pom]; 
            end; 
        end; 
      a.pogl�d:=pogl�d;
    end; 

  Var
    Pogl�dyOtoczenia:TabPogl�d�w;
    i,j,k,N:integer;

  Begin 
    N:=Bok*Bok; 
    For k:=1 to N do 
      Begin 
        i:=1+random(Bok); 
        j:=1+random(Bok); 
        ZliczPogl�dyOtoczenia(Ten�wiat[i,j],Pogl�dyOtoczenia);
        UstalPogl�d(Ten�wiat[i,j],Pogl�dyOtoczenia); 
      end; 
  end;


Function PoziomClusteringu(Ten�wiat:�wiat): real; 

  function Zgodno��Pogl�d�wOtoczenia(a:Agent): real; 
    Var 
      pom, ile_s�siad�w, ile_zgodnych:integer; 
    Begin 
      ile_s�siad�w:=0;
      ile_zgodnych:=0;
    For pom:=1 to IleS�siad�w do 
      If (a.TabS�siad�w_x[pom]>0) then
        Begin
          ile_s�siad�w:=ile_s�siad�w+1;
          If (Ten�wiat[a.TabS�siad�w_x[pom],a.TabS�siad�w_x[pom]].pogl�d=a.pogl�d) then
            ile_zgodnych:=ile_zgodnych+1;
        end;  
    If (ile_s�siad�w>0) then
      Zgodno��Pogl�d�wOtoczenia:=ile_zgodnych / ile_s�siad�w
    else
      Zgodno��Pogl�d�wOtoczenia:=0;
  end; 

  Var 
     i, j :integer; 
     suma :real;
  Begin 
    suma:=0;
    For i:=1 to bok do 
      For j:=1 to bok do
          suma:=suma + Zgodno��Pogl�d�wOtoczenia(Ten�wiat[i,j]);
    PoziomClusteringu:=suma / (bok*bok);
  end; 


{histogram pogl�d�w}
Procedure ZliczaniePogl�d�w(Ten�wiat:�wiat; Var Tab:TabPogl�d�w); 
  Var 
    i,j,pom:integer; 
  Begin 
    For pom:=1 to IlePogl�d�w do 
      Tab[pom]:=0; 
    For i:=1 to bok do 
      For j:=1 to bok do 
        Tab[Ten�wiat[i,j].pogl�d]:=Tab[Ten�wiat[i,j].pogl�d]+1; 
end;



{do rysowania - zamalowywanie na bia�o fragmentu ekranu}
Procedure czyszczenie(gora,dol:integer);
  Begin
    Pen(1,255,255,255);
    Brush(1,255,255,255);
    Rectangle(0,gora,{round(bok*bok*g�sto��)}bok*bok+150,dol)
  end;


Procedure Wizualizacja(Ten�wiat:�wiat); 
  Var 
     i,j:integer; {Przechodzenie po agentach} 
     q:real; {Przeliczone cechy agenta -> do skalowania kolor�w} 
    { WRoz:integer;  {Rozmiar wewn�trzny} 
  Begin 
   { WRoz:=Rozm-Brzeg; {Nie uwagl�dniamy szeroko�ci obw�dki (Bord), ale to specyfika ALGO} 
    For i:=0 to Bok-1 do 
      For j:=0 to Bok-1 do 
        Begin 
          Pen(Brzeg,100,100,100); 
          {Brush(1,128,128,128);
          Rectangle(xPocz�tek+i*Rozm, yPocz�tek+j*Rozm, xPocz�tek+(i+1)*Rozm, yPocz�tek+(j+1)*Rozm);       
          Pen(1,100,100,100);}
          q:=(Ten�wiat[i+1,j+1].pogl�d-1)/(IlePogl�d�w-1)*255;
          Brush(1,round(20+q*0.7),round(20+q*0.3),round(20+q*0.3)); 
          Rectangle(xPocz�tek+i*Rozm,yPocz�tek+j*Rozm,xPocz�tek+(i+1)*Rozm,yPocz�tek+(j+1)*Rozm); 
        end; 
  end; 
  

Procedure WypiszClustering(Ten�wiat:�wiat; xpoz,ypoz:integer); 
  Begin 
    Brush(1,255,255,255); 
    WriteLn; 
    MoveTo(xpoz,ypoz);
    WriteLn('Stopie� clusteringu = ', PoziomClusteringu(Ten�wiat):1:3);
  end; 

Procedure WypiszKrok(numerkroku, xpoz,ypoz:integer); 
  Begin
    Brush(1,255,255,255); 
    WriteLn; 
    MoveTo(xpoz,ypoz);
    WriteLn('Numer kroku = ',numerkroku:4);
  end;
    
Procedure WypiszDoPliku (var f:text; Ten�wiat:�wiat; numkr:integer);
  var
    pom:integer;
  begin
    if (numkr=-1) then
      begin
        Write(f, 'numer_kroku poziom_clusteringu');
        for pom:=1 to IlePogl�d�w do
          Write (f, ' P',pom);
      end
    else
      begin
        ZliczaniePogl�d�w(�wiatSymulacji, Pogl�dy);
        Write(f, numkr,' ', PoziomClusteringu(Ten�wiat):1:3);
        for pom:=1 to IlePogl�d�w do
          Write (f, ' ',Pogl�dy[pom]);
      end;
    writeln(f);  
  end;


Procedure RysujHistPogl�d�w(Tab:TabPogl�d�w; xpoz,ypoz:integer);
  Var i,y:integer;
    q:real;
    prawy:integer;
  Begin
    y:=ypoz;
    czyszczenie(y,y+20+Ilepogl�d�w*22);
    MoveTo(xpoz,y);
    WriteLn('Histogram pogl�d�w:');
    For i:=0 to IlePogl�d�w-1 do
      Begin
        Brush(1,255,255,255);
        MoveTo(xpoz,y+40+(i-1)*22+3 );
        WriteLn('P',i+1);     
        q:=i/(IlePogl�d�w-1)*255;
        Brush(1,round(20+q*0.7),round(20+q*0.3),round(20+q*0.3)); 
        Rectangle(xpoz+20,y+20+i*22,xpoz+20+Tab[i+1],y+40+i*22);
        Brush(1,255,255,255);
        MoveTo(xpoz+20+Tab[i+1]+2,y+40+(i-1)*22+3 );
        WriteLn(Tab[i+1]);
      end;
  end;


Procedure Symulacja(ile_s, ile_p, ile_kr, ile_sym: integer);
  Var
    indekssym:integer;
    ile_st,ile_pt:string;
  Begin 
    str(ile_s,ile_st);
    str(ile_p,ile_pt);
    Assign(f, concat('wynik_', ile_st, '_', ile_pt, '.dat'));
    Rewrite(f);
    WypiszDoPliku(f,�wiatSymulacji,-1);
    For indekssym:=1 to ile_sym do
      begin
        numerkroku:=0;
        Inicjalizacja(�wiatSymulacji); 
        
        While (numerkroku <= ile_kr) do
          begin
            Wizualizacja(�wiatSymulacji);
            WypiszKrok(numerkroku,xPocz�tek,yPocz�tek+bok*(rozm+round(brzeg/2))+2);
            WypiszClustering(�wiatSymulacji,xPocz�tek,yPocz�tek+bok*(rozm+round(brzeg/2))+20);
    
            ZliczaniePogl�d�w(�wiatSymulacji, Pogl�dy);
            RysujHistPogl�d�w(Pogl�dy, xPocz�tek,(rozm+round(brzeg/2))*bok+80);
    
            WypiszDoPliku(f,�wiatSymulacji,numerkroku);
    
            numerkroku:=numerkroku+1;
            
            KrokSymulacji(�wiatSymulacji); 
          end;
      end;
      Close(f); 
  end;


{w�a�ciwy program}
Begin
  Symulacja(IleS�siad�w, IlePogl�d�w, 60, 100);
End.
