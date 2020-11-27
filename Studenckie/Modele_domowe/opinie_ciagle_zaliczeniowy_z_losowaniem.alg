program Kszta�towanieOpinii; 

const 
   REP=1;
   {Ile powtorzen tej samej symulacji}
   Rozm=18; 
   {D�ugo�� boku agenta} 
   Brzeg=1; 
   {Obwodka} 
   NajmRoz=2; 
   {Jaki rozmiar maj� najslabsi agenci} 
   xPocz�tek=20; 
   {lewa kraw�d� od kt�rewj zaczynamy pisa� i rysowa�} 
   yPocz�tek=20; 
   {pionowa kraw�d� od kt�rewj zaczynamy pisa� i rysowa�} 
   Bok=30; 
   {Dlugo�� boku �wiata} 
   IleStopni=10; 
   {Liczba stopni pogl�du} 
   {   epsilon=0;
   {graniczna r�nica zaufania} 
   {   Op�r=1;
   {naturalna liczba dodatnia;obrazuje op�r agenta; wskazuje ile razy bardziej agent ceni opini� w�asn� ni� czyj��} 
   G�sto��=1; 
   {G�sto�� zaludnienia} 
   MaxSi�a=1000; 
   {Najwieksza sila - musi byc odpowiednio du�a do rozk�adu} 
   Rozk�ad=0; 
   {Stopien rozk�adu "Pareto" >=0 - zero daje brak rozkladu, same MaxSi�a} 
type 
   Agent=record 
        pogl�d:integer; 
        {0..IleStopni-1} 
        si�a:integer; 
        {Je�li 0 to martwy} 
   end; 
   �wiat=array[1..Bok,1..Bok] of Agent; 

procedure Inicjacja(var Ten�wiat:�wiat); 
{Wype�nianie �wiata. Nie�ywe maj� si�� = 0} 

var 
   i,j,k:integer; 
   pomoc:real; 
begin 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        if Random<=G�sto�� then 
          begin 
            {�ywy} 
            Ten�wiat[i,j].pogl�d:=random(IleStopni); 
            pomoc:=1; 
            for k:=1 to Rozk�ad do 
              pomoc:=pomoc*random; 
            Ten�wiat[i,j].si�a:=1+trunc(pomoc*(MaxSi�a-1)); 
          end 
        else 
          begin 
            {Martwy} 
            Ten�wiat[i,j].pogl�d:=IleStopni; 
            Ten�wiat[i,j].si�a:=0; 
            {Bo 0 znaczy MARTWY!!!} 
          end; 
      end; 
end; 

function Przeskaluj(v,min,max:real):real; 
{Do wizualizacji} 

begin 
  Przeskaluj:=(v-min)/(max-min); 
end; 

function Przelogarytmuj(v,max:real):real; 
{Do wizualizacji} 

begin 
  v:=ln(v+1); 
  Przelogarytmuj:=v/ln(max+1); 
end; 

procedure Wizualizacja(var Ten�wiat:�wiat); 
{Kwadratami o wielkosci proporcjonalnej do sily} 

var 
   i,j:integer; 
   {Przechodzenie po agentach} 
   q,r,rRoz:real; 
   {Przeliczone cechy agenta} 
   WRoz,ri,vi:integer; 
   {Rozmiar wewn�trzny i pozycjonowanie} 
begin 
  RRoz:=1-NajmRoz/Rozm; 
  WRoz:=Rozm-Brzeg; 
  {Nie uwagl�dniamy szeroko�ci obw�dki (Bord), ale to specyfika ALGO} 
  for i:=0 to Bok-1 do 
    for j:=0 to Bok-1 do 
      begin 
        pen(Brzeg,100,100,100); 
        brush(1,128,128,128); 
        Rectangle(xPocz�tek+i*Rozm,yPocz�tek+j*Rozm,xPocz�tek+(i+1)*Rozm,yPocz�tek+(j+1)*Rozm); 
        if Ten�wiat[i+1,j+1].si�a>0 then 
          begin 
            q:=Przeskaluj(Ten�wiat[i+1,j+1].pogl�d,0,IleStopni-1)*255; 
            r:=Przelogarytmuj(Ten�wiat[i+1,j+1].si�a,MaxSi�a)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:= 
            {Brzeg div 2+}(Rozm-ri) div 2; 
            Pen(1,0,0,0); 
            Brush(1,255,round(q),0); 
            Rectangle(xPocz�tek+i*Rozm+vi,yPocz�tek+j*Rozm+vi,xPocz�tek+i*Rozm+vi+ri,yPocz�tek+j*Rozm+vi+ri); 
          end; 
      end; 
end; 

Function min(x,y:integer):integer; 

begin 
  if x<=y then 
    min:=x 
  else 
    min:=y 
end; 

Function max(x,y:integer):integer; 

begin 
  if x>=y then 
    max:=x 
  else 
    max:=y 
end; 

procedure KrokSymulacji(var Ten�wiat:�wiat; TenOp�r, TenEpsilon:integer); 


function ZmienionaOpinia(x,y 
{konkretny agent}:integer):integer; 

var 
   i,j,sumaPogl�d�w, sumaWag:integer; 
   opinia:real; 
begin 
  if TenOp�r>1 then 
    begin 
      SumaPogl�d�w:=(TenOp�r-1)*(Ten�wiat[x,y].pogl�d*Ten�wiat[x,y].si�a); 
      SumaWag:=(TenOp�r-1)*Ten�wiat[x,y].si�a; 
    end 
  else 
    begin 
      SumaWag:=0; 
      SumaPogl�d�w:=0; 
    end; 
  for i:=max(x-1,1) to min(x+1,bok) do 
    for j:=max(y-1,1) to min(y+1,bok) do 
      if (Ten�wiat[i,j].si�a>0) and (Abs(Ten�wiat[i,j].pogl�d-Ten�wiat[x,y].pogl�d) < TenEpsilon) then 
        begin 
          SumaPogl�d�w:=SumaPogl�d�w+(Ten�wiat[i,j].pogl�d*Ten�wiat[i,j].si�a); 
          SumaWag:=SumaWag+Ten�wiat[i,j].si�a; 
        end; 
  if SumaWag>0 then 
    begin 
      opinia:=SumaPogl�d�w/SumaWag; 
      if ((trunc(2*opinia) = 2*opinia) and (trunc(opinia)<> opinia)) then 
            {czyli opinia ma czesc u�amkow� rowna 0,5} 
        begin 
          if random>=0.5 then 
            ZmienionaOpinia:=trunc(opinia)+1 
          else 
            ZmienionaOpinia:=trunc(opinia); 
        end 
      else 
        ZmienionaOpinia:=round(opinia); 
    end; 
  if SumaWag=0 then 
    ZmienionaOpinia:=Ten�wiat[x,y].pogl�d 
end; 
{w�a�ciwa procedura} 

var 
   i,j,k,N:integer; 
begin 
  N:=bok*bok; 
  for k:=1 to N do 
    begin 
      i:=1+random(Bok); 
      j:=1+random(Bok); 
      Ten�wiat[i,j].pogl�d:=ZmienionaOpinia(i,j); 
      {MoveTo(i*Rozm,j*Rozm); }
      if Ten�wiat[i,j].pogl�d=11 then Writeln(Ten�wiat[i,j].pogl�d); 
     { Delay(5); }
    end; 
end; 

function nazwa:string; 

var 
   tekst1:string; 
begin 
  Str(IleStopni,Tekst1); 
  nazwa:='Opinie_Stopni_'+Tekst1+'_final_4.out'; 
end; 

procedure ZapisStatystyk(var out: text; Ten�wiat:�wiat); 

type 
   LicznikPogl�d�w=array[1..IleStopni] of integer; 
   LicznikProporcji=array[1..IleStopni] of real; 
var 
   i,j,k,l, Ile�ywych, Stres, SumaPogl�d�w, IlePogl�d�w, Liczebno��Modalnego, Modalny:integer; 
   Licz:LicznikPogl�d�w; 
   Prop:LicznikProporcji; 
   �redniStres,ProporcjaModalnego, �redniPogl�d:real; 
begin 
  Stres:=0; 
  Ile�ywych:=0; 
  SumaPogl�d�w:=0; 
  IlePogl�d�w:=0; 
  for i:=1 to IleStopni do 
    Licz[i]:=0; 
  for i:=1 to bok do 
    for j:=1 to bok do 
      if Ten�wiat[i,j].si�a>0 then 
        begin 
          Ile�ywych:=Ile�ywych+1; 
          {najpierw zliczamy ile jakich pogladow} 
          Licz[Ten�wiat[i,j].pogl�d+1]:=Licz[Ten�wiat[i,j].pogl�d+1]+1;
          
          {teraz obliczamy ilu ma "stresujacych partnerow"} 
          for k:=max(i-1,1) to min(i+1,bok) do 
            for l:=max(j-1,1) to min(j+1,bok) do 
              if (Ten�wiat[i,j].pogl�d<>Ten�wiat[k,l].pogl�d) then 
                Stres:=Stres+1; 
        end; 
  �redniStres:=Stres/Ile�ywych; 
  Liczebno��Modalnego:=0; 
  Modalny:=0; 
  for i:=1 to IleStopni do 
    if Licz[i]>0 then 
      begin 
        SumaPogl�d�w:=SumaPogl�d�w+Licz[i]*(i-1); 
        {bo pogl�dy id� od zera do IleStopni-1} 
        IlePogl�d�w:=IlePogl�d�w+1; 
        {czyli patrzymy ile pogl�d�w w og�le jeszcze w populacji wyst�puje} 
        if Licz[i]>Liczebno��Modalnego then 
          begin 
            Modalny:=i; 
            Liczebno��Modalnego:=Licz[i]; 
          end; 
      end; 
  for i:=1 to IleStopni do 
    Prop[i]:=Licz[i]/Ile�ywych; 
  �redniPogl�d:=SumaPogl�d�w/Ile�ywych; 
  ProporcjaModalnego:=Liczebno��Modalnego/Ile�ywych; 
  write(out,chr(9), �redniStres:4:2,chr(9),IlePogl�d�w:2,chr(9),Modalny:4,chr(9),ProporcjaModalnego:4:3); 
  for i:=1 to IleStopni do 
    write(out,chr(9),Licz[i]/Ile�ywych:4:3); 
  writeln(out); 
end; 
{PROGRAM} 

var 
   out:text; 
   �wiatSymulacji:�wiat; 
   krok,epsilon,op�r,i,j,k,l:integer; 

BEGIN 
  epsilon:=11; 
  assign(out,nazwa); 
  rewrite(out); 
  for i:=1 to 10 do 
    begin 
      op�r:=3; 
      epsilon:=epsilon-1; 
      for j:=1 to 1 do 
        begin 
          op�r:=op�r+1; 
          writeln(out,'Epsilon=', Epsilon,' Op�r=',Op�r); 
          write(out,'Numer kroku', chr(9),'�redni stres',chr(9),'Liczba Pogl�d�w',chr(9),'Pogl� modalny',chr(9),'Proporcja pogl�du modalnego'); 
          for l:=1 to IleStopni do 
            write(out,chr(9),'Proporcja pogl�du ',l); 
          writeln(out); 
          for k:=1 to REP do 
            begin 
              write(out,'Iteracja nr ', k); 
              Inicjacja(�wiatSymulacji); 
              krok:=0; 
              while krok<35 do 
                begin 
                  {       ZapisStatystyk(out,�wiatSymulacji);} 
                  {komentarzujemy bo patrzymy teraz tylko na stan ko�cowy} 
                  Wizualizacja(�wiatSymulacji); 
                  KrokSymulacji(�wiatSymulacji,op�r,epsilon); 
                  krok:=krok+1; 
                  brush(1,255,255,255); 
                  writeln; 
                  MoveTo(20,bok*(rozm+round(brzeg/2))+30); 
                  writeln('numer kroku=',krok, ' '); 
                  writeln(i); 
                end; 
              ZapisStatystyk(out,�wiatSymulacji); 
              {zapisujemy dopiero dla ostatniego kroku} 
            end; 
          writeln(out); 
          writeln(out); 
        end; 
    end; 
  close(out); 
END.
