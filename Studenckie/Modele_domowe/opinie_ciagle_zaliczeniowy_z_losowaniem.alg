program Kszta³towanieOpinii; 

const 
   REP=1;
   {Ile powtorzen tej samej symulacji}
   Rozm=18; 
   {D³ugoœæ boku agenta} 
   Brzeg=1; 
   {Obwodka} 
   NajmRoz=2; 
   {Jaki rozmiar maj¹ najslabsi agenci} 
   xPocz¹tek=20; 
   {lewa krawêdŸ od którewj zaczynamy pisaæ i rysowaæ} 
   yPocz¹tek=20; 
   {pionowa krawêdŸ od którewj zaczynamy pisaæ i rysowaæ} 
   Bok=30; 
   {Dlugoœæ boku œwiata} 
   IleStopni=10; 
   {Liczba stopni pogl¹du} 
   {   epsilon=0;
   {graniczna ró¿nica zaufania} 
   {   Opór=1;
   {naturalna liczba dodatnia;obrazuje opór agenta; wskazuje ile razy bardziej agent ceni opiniê w³asn¹ ni¿ czyj¹œ} 
   Gêstoœæ=1; 
   {Gêstoœæ zaludnienia} 
   MaxSi³a=1000; 
   {Najwieksza sila - musi byc odpowiednio du¿a do rozk³adu} 
   Rozk³ad=0; 
   {Stopien rozk³adu "Pareto" >=0 - zero daje brak rozkladu, same MaxSi³a} 
type 
   Agent=record 
        pogl¹d:integer; 
        {0..IleStopni-1} 
        si³a:integer; 
        {Jeœli 0 to martwy} 
   end; 
   Œwiat=array[1..Bok,1..Bok] of Agent; 

procedure Inicjacja(var TenŒwiat:Œwiat); 
{Wype³nianie œwiata. Nie¿ywe maj¹ si³ê = 0} 

var 
   i,j,k:integer; 
   pomoc:real; 
begin 
  for i:=1 to Bok do 
    for j:=1 to Bok do 
      begin 
        if Random<=Gêstoœæ then 
          begin 
            {¯ywy} 
            TenŒwiat[i,j].pogl¹d:=random(IleStopni); 
            pomoc:=1; 
            for k:=1 to Rozk³ad do 
              pomoc:=pomoc*random; 
            TenŒwiat[i,j].si³a:=1+trunc(pomoc*(MaxSi³a-1)); 
          end 
        else 
          begin 
            {Martwy} 
            TenŒwiat[i,j].pogl¹d:=IleStopni; 
            TenŒwiat[i,j].si³a:=0; 
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

procedure Wizualizacja(var TenŒwiat:Œwiat); 
{Kwadratami o wielkosci proporcjonalnej do sily} 

var 
   i,j:integer; 
   {Przechodzenie po agentach} 
   q,r,rRoz:real; 
   {Przeliczone cechy agenta} 
   WRoz,ri,vi:integer; 
   {Rozmiar wewnêtrzny i pozycjonowanie} 
begin 
  RRoz:=1-NajmRoz/Rozm; 
  WRoz:=Rozm-Brzeg; 
  {Nie uwaglêdniamy szerokoœci obwódki (Bord), ale to specyfika ALGO} 
  for i:=0 to Bok-1 do 
    for j:=0 to Bok-1 do 
      begin 
        pen(Brzeg,100,100,100); 
        brush(1,128,128,128); 
        Rectangle(xPocz¹tek+i*Rozm,yPocz¹tek+j*Rozm,xPocz¹tek+(i+1)*Rozm,yPocz¹tek+(j+1)*Rozm); 
        if TenŒwiat[i+1,j+1].si³a>0 then 
          begin 
            q:=Przeskaluj(TenŒwiat[i+1,j+1].pogl¹d,0,IleStopni-1)*255; 
            r:=Przelogarytmuj(TenŒwiat[i+1,j+1].si³a,MaxSi³a)*RRoz; 
            ri:=NajmRoz+round(r*(WRoz-NajmRoz)); 
            vi:= 
            {Brzeg div 2+}(Rozm-ri) div 2; 
            Pen(1,0,0,0); 
            Brush(1,255,round(q),0); 
            Rectangle(xPocz¹tek+i*Rozm+vi,yPocz¹tek+j*Rozm+vi,xPocz¹tek+i*Rozm+vi+ri,yPocz¹tek+j*Rozm+vi+ri); 
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

procedure KrokSymulacji(var TenŒwiat:Œwiat; TenOpór, TenEpsilon:integer); 


function ZmienionaOpinia(x,y 
{konkretny agent}:integer):integer; 

var 
   i,j,sumaPogl¹dów, sumaWag:integer; 
   opinia:real; 
begin 
  if TenOpór>1 then 
    begin 
      SumaPogl¹dów:=(TenOpór-1)*(TenŒwiat[x,y].pogl¹d*TenŒwiat[x,y].si³a); 
      SumaWag:=(TenOpór-1)*TenŒwiat[x,y].si³a; 
    end 
  else 
    begin 
      SumaWag:=0; 
      SumaPogl¹dów:=0; 
    end; 
  for i:=max(x-1,1) to min(x+1,bok) do 
    for j:=max(y-1,1) to min(y+1,bok) do 
      if (TenŒwiat[i,j].si³a>0) and (Abs(TenŒwiat[i,j].pogl¹d-TenŒwiat[x,y].pogl¹d) < TenEpsilon) then 
        begin 
          SumaPogl¹dów:=SumaPogl¹dów+(TenŒwiat[i,j].pogl¹d*TenŒwiat[i,j].si³a); 
          SumaWag:=SumaWag+TenŒwiat[i,j].si³a; 
        end; 
  if SumaWag>0 then 
    begin 
      opinia:=SumaPogl¹dów/SumaWag; 
      if ((trunc(2*opinia) = 2*opinia) and (trunc(opinia)<> opinia)) then 
            {czyli opinia ma czesc u³amkow¹ rowna 0,5} 
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
    ZmienionaOpinia:=TenŒwiat[x,y].pogl¹d 
end; 
{w³aœciwa procedura} 

var 
   i,j,k,N:integer; 
begin 
  N:=bok*bok; 
  for k:=1 to N do 
    begin 
      i:=1+random(Bok); 
      j:=1+random(Bok); 
      TenŒwiat[i,j].pogl¹d:=ZmienionaOpinia(i,j); 
      {MoveTo(i*Rozm,j*Rozm); }
      if TenŒwiat[i,j].pogl¹d=11 then Writeln(TenŒwiat[i,j].pogl¹d); 
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

procedure ZapisStatystyk(var out: text; TenŒwiat:Œwiat); 

type 
   LicznikPogl¹dów=array[1..IleStopni] of integer; 
   LicznikProporcji=array[1..IleStopni] of real; 
var 
   i,j,k,l, Ile¯ywych, Stres, SumaPogl¹dów, IlePogl¹dów, LiczebnoœæModalnego, Modalny:integer; 
   Licz:LicznikPogl¹dów; 
   Prop:LicznikProporcji; 
   ŒredniStres,ProporcjaModalnego, ŒredniPogl¹d:real; 
begin 
  Stres:=0; 
  Ile¯ywych:=0; 
  SumaPogl¹dów:=0; 
  IlePogl¹dów:=0; 
  for i:=1 to IleStopni do 
    Licz[i]:=0; 
  for i:=1 to bok do 
    for j:=1 to bok do 
      if TenŒwiat[i,j].si³a>0 then 
        begin 
          Ile¯ywych:=Ile¯ywych+1; 
          {najpierw zliczamy ile jakich pogladow} 
          Licz[TenŒwiat[i,j].pogl¹d+1]:=Licz[TenŒwiat[i,j].pogl¹d+1]+1;
          
          {teraz obliczamy ilu ma "stresujacych partnerow"} 
          for k:=max(i-1,1) to min(i+1,bok) do 
            for l:=max(j-1,1) to min(j+1,bok) do 
              if (TenŒwiat[i,j].pogl¹d<>TenŒwiat[k,l].pogl¹d) then 
                Stres:=Stres+1; 
        end; 
  ŒredniStres:=Stres/Ile¯ywych; 
  LiczebnoœæModalnego:=0; 
  Modalny:=0; 
  for i:=1 to IleStopni do 
    if Licz[i]>0 then 
      begin 
        SumaPogl¹dów:=SumaPogl¹dów+Licz[i]*(i-1); 
        {bo pogl¹dy id¹ od zera do IleStopni-1} 
        IlePogl¹dów:=IlePogl¹dów+1; 
        {czyli patrzymy ile pogl¹dów w ogóle jeszcze w populacji wystêpuje} 
        if Licz[i]>LiczebnoœæModalnego then 
          begin 
            Modalny:=i; 
            LiczebnoœæModalnego:=Licz[i]; 
          end; 
      end; 
  for i:=1 to IleStopni do 
    Prop[i]:=Licz[i]/Ile¯ywych; 
  ŒredniPogl¹d:=SumaPogl¹dów/Ile¯ywych; 
  ProporcjaModalnego:=LiczebnoœæModalnego/Ile¯ywych; 
  write(out,chr(9), ŒredniStres:4:2,chr(9),IlePogl¹dów:2,chr(9),Modalny:4,chr(9),ProporcjaModalnego:4:3); 
  for i:=1 to IleStopni do 
    write(out,chr(9),Licz[i]/Ile¯ywych:4:3); 
  writeln(out); 
end; 
{PROGRAM} 

var 
   out:text; 
   ŒwiatSymulacji:Œwiat; 
   krok,epsilon,opór,i,j,k,l:integer; 

BEGIN 
  epsilon:=11; 
  assign(out,nazwa); 
  rewrite(out); 
  for i:=1 to 10 do 
    begin 
      opór:=3; 
      epsilon:=epsilon-1; 
      for j:=1 to 1 do 
        begin 
          opór:=opór+1; 
          writeln(out,'Epsilon=', Epsilon,' Opór=',Opór); 
          write(out,'Numer kroku', chr(9),'Œredni stres',chr(9),'Liczba Pogl¹dów',chr(9),'Pogl¹ modalny',chr(9),'Proporcja pogl¹du modalnego'); 
          for l:=1 to IleStopni do 
            write(out,chr(9),'Proporcja pogl¹du ',l); 
          writeln(out); 
          for k:=1 to REP do 
            begin 
              write(out,'Iteracja nr ', k); 
              Inicjacja(ŒwiatSymulacji); 
              krok:=0; 
              while krok<35 do 
                begin 
                  {       ZapisStatystyk(out,ŒwiatSymulacji);} 
                  {komentarzujemy bo patrzymy teraz tylko na stan koñcowy} 
                  Wizualizacja(ŒwiatSymulacji); 
                  KrokSymulacji(ŒwiatSymulacji,opór,epsilon); 
                  krok:=krok+1; 
                  brush(1,255,255,255); 
                  writeln; 
                  MoveTo(20,bok*(rozm+round(brzeg/2))+30); 
                  writeln('numer kroku=',krok, ' '); 
                  writeln(i); 
                end; 
              ZapisStatystyk(out,ŒwiatSymulacji); 
              {zapisujemy dopiero dla ostatniego kroku} 
            end; 
          writeln(out); 
          writeln(out); 
        end; 
    end; 
  close(out); 
END.
