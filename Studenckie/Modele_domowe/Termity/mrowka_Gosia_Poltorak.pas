program Mrowka_Langtona;

const
  Bok=150; {liczba komórek boku tablicy}
  xPocz=2; {wspó³rzêdna x lewego górnego rogu rysowanej tablicy}
  yPocz=2; {wspó³rzêdna y lewego górnego rogu rysowanej tablicy}
  Rozm=4; {dlugoœæ boku rysowanych komórek}

type
  Komorka=integer; {0-bia³a, 1-czarna}
  
  Swiat=array[1..Bok,1..Bok] of Komorka;

  MrowkaL=record
    polozenie:array[1..2] of integer;
    kierunek:array[1..2] of integer;
  end;

var
  SwiatMrowki:Swiat;
  Mrowka:MrowkaL;

procedure Inicjalizacja (var sm:Swiat; var m:MrowkaL);
  var i,j:integer;
  begin
    for i:=1 to bok do
      for j:=1 to bok do
        sm[i,j]:=0;
    m.polozenie[1]:=random(bok)+1;
    m.polozenie[2]:=random(bok)+1;
    m.kierunek[1]:=1;
    m.kierunek[2]:=0;
  end;

procedure RysujSwiat (sm:Swiat); {rysowanie ca³ej tablicy}
  var 
     i,j,kolor:integer; 
  begin 
    for i:=1 to bok do 
      for j:=1 to bok do 
        begin 
          kolor:=255*(1-sm[i,j]);
          Pen(1,100,100,100); 
          Brush(1,kolor,kolor,kolor); 
          Rectangle(xPocz+i*Rozm,yPocz+j*Rozm,xPocz+(i+1)*Rozm,yPocz+(j+1)*Rozm); 
        end; 
  end;
  
procedure RysujRuch (sm:Swiat; m:MrowkaL); {rysowanie tylko tego, co siê zmieni³o}
  var 
    kolor:integer; 
  begin 
    kolor:=255*(1-sm[m.polozenie[1],m.polozenie[2]]);
    Pen(1,100,100,100); 
    Brush(1,kolor,kolor,kolor); 
    Rectangle(xPocz+m.polozenie[1]*Rozm,yPocz+m.polozenie[2]*Rozm,xPocz+(m.polozenie[1]+1)*Rozm,yPocz+(m.polozenie[2]+1)*Rozm); 
  end;

procedure Ruch (var sm:Swiat; var m:MrowkaL);
  var x,y,kx,ky:integer;
  begin
    x:=m.polozenie[1];
    y:=m.polozenie[2];
    kx:=m.kierunek[1];
    ky:=m.kierunek[2];
    if (sm[x,y]=0) then
      sm[x,y]:=1
    else
      sm[x,y]:=0;
    RysujRuch(sm, m);
    m.polozenie[1]:=((x+kx) mod bok);
    if (m.polozenie[1]=0) then
      m.polozenie[1]:=bok;
    m.polozenie[2]:=((y+ky) mod bok);
    if (m.polozenie[2]=0) then
      m.polozenie[2]:=bok;
    if (kx<>0) then begin
      if (sm[m.polozenie[1],m.polozenie[2]]=0) then
        m.kierunek[2]:=0-kx
      else  
        m.kierunek[2]:=0+kx;
      m.kierunek[1]:=0;  
    end
    else begin
      if (sm[m.polozenie[1],m.polozenie[2]]=0) then
        m.kierunek[1]:=0+ky
      else  
        m.kierunek[1]:=0-ky;
      m.kierunek[2]:=0;  
    end;        
  end;
  
  
BEGIN
  Inicjalizacja (SwiatMrowki, Mrowka);
  RysujSwiat (SwiatMrowki);
  repeat
    Ruch(SwiatMrowki, Mrowka);
    {RysujRuch(SwiatMrowki, Mrowka);}
  until IsEvent;
END.
