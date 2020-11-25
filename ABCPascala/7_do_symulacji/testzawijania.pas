program testzawijania; 
(*Program testuje "zawijany" dost�p do tablicy dla przypadku
typowego dla wiekszo�ci program�w symulacyjnych czyli tablicy
indeksownej od 0 jak i dla przypadk�w nietypowych... *) 

const 
   LiczbaPr�b=500; 
var 
   tablica0_9:array[0..9] of integer; 
   tablica1_10:array[1..10] of integer; 
   tablica55_65:array[55..65] of integer; 

{TRZY ROZWI�ZANIA PROBLEMU ZAWIJANIA INDEKS�W}
function nIndeks0(isurowy,size:integer):integer; 
{Zawijanie indeksu do tablicy: } 
{* o rozmiarze size i indeksach startuj�cych od 0 } 
{* dozwolony zakres indeks�w w ALGO to -size.."b.du�o" } 
begin 
  nIndeks0:=(isurowy+size) mod size; 
end; 

function nIndeks1(isurowy,last:integer):integer; 
{Zawijanie indeksu do tablicy o  indeksach od 1 do Last } 
{Dozwolony zakres surowych indeks�w w ALGO to -(Last-1)..2*Last } 
begin 
  if isurowy>Last then 
    nIndeks1:=isurowy-Last 
  else 
    if isurowy<1 then 
      nIndeks1:=Last+isurowy 
    else 
      nIndeks1:=isurowy; 
end; 

function nIndeksDowolny(isurowy,pocz�tek,koniec:integer):integer; 
{Zawijanie indeksu do tablicy o dowolnym zakresie indeks�w}
{Dozwolony zakres surowego indeksu to pocz�tek-size.."b.du�o"}
var 
   size:integer; 
begin 
  size:=koniec-pocz�tek+1; {Obliczenie dlugosci}
  isurowy:=isurowy-pocz�tek; {Przesuniecie surowego indeksu w strone 0}
  nIndeksDowolny:=((isurowy+size) mod size)+pocz�tek;{Obliczenie nowego i przesuniecie zpowrotem} 
end; 

(* PROGRAM G��WNY REALIZUJ�CY TEST *)   
var i,S,N:integer; 
begin 
  {Test dla tablicy indeksowanej od 0} 
  for i:=1 to LiczbaPr�b do 
    begin 
      S:=random(50)-10; {Losowanie tak�e zprzed i zza tablicy}
      N:=nIndeks0(S,10);{Poprawienie indeks�w}  
      writeln(S:4,'->',N:4); 
      tablica0_9[N]:=1; 
    end; 
  writeln; 
  
  {Test dla tablicy indeksowanej od 1} 
  for i:=1 to LiczbaPr�b do 
    begin 
      S:=random(30)-9; {Losowanie tak�e zprzed i zza tablicy} 
      N:=nIndeks1(S,10);{Poprawienie indeks�w}  
      writeln(S:4,'->',N:4); 
      tablica1_10[N]:=1; 
    end; 
  writeln; 
  
  {Test dla tablicy indeksowanej dziwnie} 
  for i:=1 to LiczbaPr�b do 
    begin 
      S:=45+random(50); {Losowanie tak�e zprzed i zza tablicy} 
      N:=nIndeksDowolny(S,55,65);{Poprawienie indeks�w}  
      writeln(S:4,'->',N:4); 
      tablica55_65[N]:=1; 
    end; 
end.
