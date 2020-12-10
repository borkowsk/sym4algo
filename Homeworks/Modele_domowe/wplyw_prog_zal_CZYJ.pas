Program Zaliczeniowy; 
{Implementacja modelu wp³ywu spo³ecznego 
dla piêciu rodzajów s¹siedztwa, 
dwóch pogl¹dów, pe³nym zaludnieniu, bez si³}
 
Const 
{Zmienne kluczowe dla symulacji}
   Bok=16; {pierwiastek z liczby agentów, czyli ilu na krawêdzi}
   IleS¹siadów=24; {4-czterech s¹siadów po bokach, 
                   8-oœmiu s¹siadów na oko³o,
                   12-szesnastu s¹siadów na oko³o,      
                   20-dwudziestu s¹siadów na oko³o,
                   24-dwudziestuczterech s¹siadów na oko³o}
   IlePogl¹dów=6; {Liczba konkuruj¹cych pogladów}
{Zmienne potrzebne do wizualizacji}   
   Rozm=12; {D³ugoœæ boku agenta = rozmiar pojedynczej komorki z brzegiem(?)} 
   Brzeg=1; {Obwodka} 
   xPocz¹tek=10; {lewa krawêdŸ od której zaczynamy pisaæ i rysowaæ}
   yPocz¹tek=10; {pionowa krawêdŸ od której zaczynamy pisaæ i rysowaæ}

Type 
  Agent=record 
    x,y:integer; {wspó³rzêdne}
    pogl¹d:integer; {1..IlePogladow} 
    TabS¹siadów_x,TabS¹siadów_y:array[1..IleS¹siadów] of integer;
  end; 

  Œwiat=array[1..Bok,1..Bok] of Agent; {Tablica z agentami}

  TabPogl¹dów=array[1..IlePogl¹dów] of integer; 

Var 
   ŒwiatSymulacji:Œwiat; 
   Pogl¹dy: TabPogl¹dów; 
   numerkroku:integer;
   f:text;



Procedure Inicjalizacja(Var TenŒwiat:Œwiat); 
  
  procedure UstalS¹siedztwo (Var a:Agent);
    Var pom,x,y:integer;
    Begin
      x:=a.x;
      y:=a.y;
      a.TabS¹siadów_x[1]:=x;
      a.TabS¹siadów_y[1]:=y-1;
      a.TabS¹siadów_x[2]:=x+1;
      a.TabS¹siadów_y[2]:=y;
      a.TabS¹siadów_x[3]:=x;
      a.TabS¹siadów_y[3]:=y+1;
      a.TabS¹siadów_x[4]:=x-1;
      a.TabS¹siadów_y[4]:=y;
      If (IleS¹siadów>4) then
        Begin   
          a.TabS¹siadów_x[5]:=x-1;
          a.TabS¹siadów_y[5]:=y-1;
          a.TabS¹siadów_x[6]:=x+1;
          a.TabS¹siadów_y[6]:=y-1;
          a.TabS¹siadów_x[7]:=x+1;
          a.TabS¹siadów_y[7]:=y+1;
          a.TabS¹siadów_x[8]:=x-1;
          a.TabS¹siadów_y[8]:=y+1;  
          If (IleS¹siadów>8) then
            Begin   
              a.TabS¹siadów_x[9]:=x;
              a.TabS¹siadów_y[9]:=y-2;
              a.TabS¹siadów_x[10]:=x+2;
              a.TabS¹siadów_y[10]:=y;
              a.TabS¹siadów_x[11]:=x;
              a.TabS¹siadów_y[11]:=y+2;
              a.TabS¹siadów_x[12]:=x-2;
              a.TabS¹siadów_y[12]:=y; 
              If (IleS¹siadów>12) then
                Begin   
                  a.TabS¹siadów_x[13]:=x-1;
                  a.TabS¹siadów_y[13]:=y-2;
                  a.TabS¹siadów_x[14]:=x+1;
                  a.TabS¹siadów_y[14]:=y-2;
                  a.TabS¹siadów_x[15]:=x+2;
                  a.TabS¹siadów_y[15]:=y-1;
                  a.TabS¹siadów_x[16]:=x+2;
                  a.TabS¹siadów_y[16]:=y+1;  
                  a.TabS¹siadów_x[17]:=x+1;
                  a.TabS¹siadów_y[17]:=y+2;
                  a.TabS¹siadów_x[18]:=x-1;
                  a.TabS¹siadów_y[18]:=y+2;
                  a.TabS¹siadów_x[19]:=x+2;
                  a.TabS¹siadów_y[19]:=y+1;
                  a.TabS¹siadów_x[20]:=x+2;
                  a.TabS¹siadów_y[20]:=y-1;  
                  If (IleS¹siadów>20) then
                    Begin   
                      a.TabS¹siadów_x[21]:=x-2;
                      a.TabS¹siadów_y[21]:=y-2;
                      a.TabS¹siadów_x[22]:=x+2;
                      a.TabS¹siadów_y[22]:=y-2;
                      a.TabS¹siadów_x[23]:=x+2;
                      a.TabS¹siadów_y[23]:=y+2;
                      a.TabS¹siadów_x[24]:=x-2;
                      a.TabS¹siadów_y[24]:=y+2;            
                    end;                               
                end; 
            end;
        end;
      For pom:=1 to IleS¹siadów do
        If ((a.TabS¹siadów_x[pom]<1) or (a.TabS¹siadów_y[pom]<1) or (a.TabS¹siadów_x[pom]>Bok) or (a.TabS¹siadów_y[pom]>Bok)) then
          Begin
            a.TabS¹siadów_x[pom]:=0;
            a.TabS¹siadów_y[pom]:=0;
          end;
    end;  
  
  Var 
    i,j:integer;
  
  Begin
    For i:=1 to Bok do
      For j:=1 to Bok do
        Begin
          TenŒwiat[i,j].x:=i;
          TenŒwiat[i,j].y:=j;          
          TenŒwiat[i,j].pogl¹d:=random(IlePogl¹dów)+1;
          UstalS¹siedztwo(TenŒwiat[i,j]);
        end;  
  end;



Procedure KrokSymulacji(Var TenŒwiat:Œwiat); 
{Procedura zmiany stanu symulacji. Zawiera procedury pomocnicze.} 

  procedure ZliczPogl¹dyOtoczenia(a:agent; Var Pogl¹dyOtoczenia:TabPogl¹dów); 
    Var
      pom:integer;
    Begin
      For pom:=1 to IlePogl¹dów do 
        Pogl¹dyOtoczenia[pom]:=0;
      Pogl¹dyOtoczenia[a.pogl¹d]:=1;
      For pom:=1 to IleS¹siadów do 
        If (a.TabS¹siadów_x[pom]>0) then
          Pogl¹dyOtoczenia[TenŒwiat[a.TabS¹siadów_x[pom],a.TabS¹siadów_y[pom]].pogl¹d]:=Pogl¹dyOtoczenia[TenŒwiat[a.TabS¹siadów_x[pom],a.TabS¹siadów_y[pom]].pogl¹d]+1; 
    end; 

  procedure UstalPogl¹d(Var a:Agent; Pogl¹dyOtoczenia:TabPogl¹dów); 
    Var
      pom,max,pogl¹d: integer; 
    Begin 
      {ZliczPogl¹dyOtoczenia(a,Pogl¹dyOtoczenia);}
      pogl¹d:=a.pogl¹d;
      max:=1; 
      For pom:=1 to IlePogl¹dów do 
        Begin; 
          If ((Pogl¹dyOtoczenia[pom]>max) or ((Pogl¹dyOtoczenia[pom]=max)and(pom<>a.pogl¹d)and(random<0.5))) then 
            Begin 
              pogl¹d:=pom; 
              max:=Pogl¹dyOtoczenia[pom]; 
            end; 
        end; 
      a.pogl¹d:=pogl¹d;
    end; 

  Var
    Pogl¹dyOtoczenia:TabPogl¹dów;
    i,j,k,N:integer;

  Begin 
    N:=Bok*Bok; 
    For k:=1 to N do 
      Begin 
        i:=1+random(Bok); 
        j:=1+random(Bok); 
        ZliczPogl¹dyOtoczenia(TenŒwiat[i,j],Pogl¹dyOtoczenia);
        UstalPogl¹d(TenŒwiat[i,j],Pogl¹dyOtoczenia); 
      end; 
  end;


Function PoziomClusteringu(TenŒwiat:Œwiat): real; 

  function ZgodnoœæPogl¹dówOtoczenia(a:Agent): real; 
    Var 
      pom, ile_s¹siadów, ile_zgodnych:integer; 
    Begin 
      ile_s¹siadów:=0;
      ile_zgodnych:=0;
    For pom:=1 to IleS¹siadów do 
      If (a.TabS¹siadów_x[pom]>0) then
        Begin
          ile_s¹siadów:=ile_s¹siadów+1;
          If (TenŒwiat[a.TabS¹siadów_x[pom],a.TabS¹siadów_x[pom]].pogl¹d=a.pogl¹d) then
            ile_zgodnych:=ile_zgodnych+1;
        end;  
    If (ile_s¹siadów>0) then
      ZgodnoœæPogl¹dówOtoczenia:=ile_zgodnych / ile_s¹siadów
    else
      ZgodnoœæPogl¹dówOtoczenia:=0;
  end; 

  Var 
     i, j :integer; 
     suma :real;
  Begin 
    suma:=0;
    For i:=1 to bok do 
      For j:=1 to bok do
          suma:=suma + ZgodnoœæPogl¹dówOtoczenia(TenŒwiat[i,j]);
    PoziomClusteringu:=suma / (bok*bok);
  end; 


{histogram pogl¹dów}
Procedure ZliczaniePogl¹dów(TenŒwiat:Œwiat; Var Tab:TabPogl¹dów); 
  Var 
    i,j,pom:integer; 
  Begin 
    For pom:=1 to IlePogl¹dów do 
      Tab[pom]:=0; 
    For i:=1 to bok do 
      For j:=1 to bok do 
        Tab[TenŒwiat[i,j].pogl¹d]:=Tab[TenŒwiat[i,j].pogl¹d]+1; 
end;



{do rysowania - zamalowywanie na bia³o fragmentu ekranu}
Procedure czyszczenie(gora,dol:integer);
  Begin
    Pen(1,255,255,255);
    Brush(1,255,255,255);
    Rectangle(0,gora,{round(bok*bok*gêstoœæ)}bok*bok+150,dol)
  end;


Procedure Wizualizacja(TenŒwiat:Œwiat); 
  Var 
     i,j:integer; {Przechodzenie po agentach} 
     q:real; {Przeliczone cechy agenta -> do skalowania kolorów} 
    { WRoz:integer;  {Rozmiar wewnêtrzny} 
  Begin 
   { WRoz:=Rozm-Brzeg; {Nie uwaglêdniamy szerokoœci obwódki (Bord), ale to specyfika ALGO} 
    For i:=0 to Bok-1 do 
      For j:=0 to Bok-1 do 
        Begin 
          Pen(Brzeg,100,100,100); 
          {Brush(1,128,128,128);
          Rectangle(xPocz¹tek+i*Rozm, yPocz¹tek+j*Rozm, xPocz¹tek+(i+1)*Rozm, yPocz¹tek+(j+1)*Rozm);       
          Pen(1,100,100,100);}
          q:=(TenŒwiat[i+1,j+1].pogl¹d-1)/(IlePogl¹dów-1)*255;
          Brush(1,round(20+q*0.7),round(20+q*0.3),round(20+q*0.3)); 
          Rectangle(xPocz¹tek+i*Rozm,yPocz¹tek+j*Rozm,xPocz¹tek+(i+1)*Rozm,yPocz¹tek+(j+1)*Rozm); 
        end; 
  end; 
  

Procedure WypiszClustering(TenŒwiat:Œwiat; xpoz,ypoz:integer); 
  Begin 
    Brush(1,255,255,255); 
    WriteLn; 
    MoveTo(xpoz,ypoz);
    WriteLn('Stopieñ clusteringu = ', PoziomClusteringu(Tenœwiat):1:3);
  end; 

Procedure WypiszKrok(numerkroku, xpoz,ypoz:integer); 
  Begin
    Brush(1,255,255,255); 
    WriteLn; 
    MoveTo(xpoz,ypoz);
    WriteLn('Numer kroku = ',numerkroku:4);
  end;
    
Procedure WypiszDoPliku (var f:text; TenŒwiat:Œwiat; numkr:integer);
  var
    pom:integer;
  begin
    if (numkr=-1) then
      begin
        Write(f, 'numer_kroku poziom_clusteringu');
        for pom:=1 to IlePogl¹dów do
          Write (f, ' P',pom);
      end
    else
      begin
        ZliczaniePogl¹dów(ŒwiatSymulacji, Pogl¹dy);
        Write(f, numkr,' ', PoziomClusteringu(Tenœwiat):1:3);
        for pom:=1 to IlePogl¹dów do
          Write (f, ' ',Pogl¹dy[pom]);
      end;
    writeln(f);  
  end;


Procedure RysujHistPogl¹dów(Tab:TabPogl¹dów; xpoz,ypoz:integer);
  Var i,y:integer;
    q:real;
    prawy:integer;
  Begin
    y:=ypoz;
    czyszczenie(y,y+20+Ilepogl¹dów*22);
    MoveTo(xpoz,y);
    WriteLn('Histogram pogl¹dów:');
    For i:=0 to IlePogl¹dów-1 do
      Begin
        Brush(1,255,255,255);
        MoveTo(xpoz,y+40+(i-1)*22+3 );
        WriteLn('P',i+1);     
        q:=i/(IlePogl¹dów-1)*255;
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
    WypiszDoPliku(f,ŒwiatSymulacji,-1);
    For indekssym:=1 to ile_sym do
      begin
        numerkroku:=0;
        Inicjalizacja(ŒwiatSymulacji); 
        
        While (numerkroku <= ile_kr) do
          begin
            Wizualizacja(ŒwiatSymulacji);
            WypiszKrok(numerkroku,xPocz¹tek,yPocz¹tek+bok*(rozm+round(brzeg/2))+2);
            WypiszClustering(ŒwiatSymulacji,xPocz¹tek,yPocz¹tek+bok*(rozm+round(brzeg/2))+20);
    
            ZliczaniePogl¹dów(ŒwiatSymulacji, Pogl¹dy);
            RysujHistPogl¹dów(Pogl¹dy, xPocz¹tek,(rozm+round(brzeg/2))*bok+80);
    
            WypiszDoPliku(f,ŒwiatSymulacji,numerkroku);
    
            numerkroku:=numerkroku+1;
            
            KrokSymulacji(ŒwiatSymulacji); 
          end;
      end;
      Close(f); 
  end;


{w³aœciwy program}
Begin
  Symulacja(IleS¹siadów, IlePogl¹dów, 60, 100);
End.
