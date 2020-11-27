program zaliczeniowy;
 var
  tab: array [1..27] of char;

procedure tablica;
begin
 tab[1]:='Q';
 tab[2]:='W';
 tab[3]:='E';
 tab[4]:='R';
 tab[5]:='T';
 tab[6]:='Y';
 tab[7]:='U';
 tab[8]:='I';
 tab[9]:='O';
 tab[10]:='P';
 tab[11]:='A';
 tab[12]:='S';
 tab[13]:='D';
 tab[14]:='F';
 tab[15]:='G';
 tab[16]:='H';
 tab[17]:='J';
 tab[18]:='K';
 tab[19]:='L';
 tab[20]:='Z';
 tab[21]:='X';
 tab[22]:='C';
 tab[23]:='V';
 tab[24]:='B';
 tab[25]:='N';
 tab[26]:='M';
end;

procedure wstaw1;
var
 i,x:integer;
begin
 x:=60;
 for i:=1 to 10 do
  begin
     moveto(x,60);
     write(tab[i]);
     x:=x+30;
  end;
end;

procedure wstaw2;
var
 i,x:integer;
begin
  x:=60;
  for i:=11 to 19 do
   begin
     moveto(x,90);
     write(tab[i]);
     x:=x+30;
  end;
end;

procedure wstaw3;
var
 i,x:integer;
begin
    x:=60;
    for i:=20 to 26 do
   begin
     moveto(x,120);
     write(tab[i]);
     x:=x+30;
  end;
end;


procedure wstaw;
begin
     TextColor( 0, 0, 0 );
     wstaw1;
     TextColor( 0, 0, 0 );
     wstaw2;
     TextColor( 0, 0, 0 );
     wstaw3;
end;

procedure t這; 
var
 a,b: integer;
begin 

  brush(1,204,253,237); 
  rectangle(0,0,650,800);
  for a:=50 to 140 do
   begin
    line(350,a,50,a);{linia pozioma}
     a:=a+29;
   end;
  for a:=50 to 350 do
   begin
     line(a,50,a,140);{linia pionowa} 
     a:=a+29;
   end;
end;     


procedure podaj;
 begin
  moveto(10,170);
  writeln('Aby wybrac pierwszy wiersz wcisnij 1');
  moveto(10,185);
  writeln('Aby wybrac drugi wiersz wcisnij 2');
  moveto(10,200);
  writeln('Aby wybrac trzeci wiersz wcisnij 3'); 
  moveto(10,215);
  writeln('Aby wybrac wszystkie wiersze wcisnij 4');
  moveto(10,230);
  writeln('Aby zakonczyc wybierz 5');
  moveto(10,245);
  write('Twoj wybor: ');
  readln(tab[27]);
 end;

procedure a1;
var
 a:char;
 i,j,x,k:integer;
Begin
x:=170;
k:=0; 
TextColor( 255, 0, 0 );
wstaw1;
TextColor( 0, 0, 0 );
for j:=1 to 10 do
 begin
  randomize;                    
  i:=random(10);
  x:=x+15;
  moveto(10,x);
  write('Nacisnij ',tab[1+i],' : ');
  readln(a);
  k:=k+1;
  while(a<>tab[1+i]) do
   begin
    x:=x+15;
    moveto(10,x);
    readln(a);
    k:=k+1;
   end;
 end;
x:=x+15;
moveto(10,x);
writeln('Procent skutecznosci: ',1000/k,'%');
end;


procedure a2;
var
  a:char;
 i,j,x,k:integer;
begin
x:=170;
k:=0;
TextColor( 255, 0, 0 );
wstaw2;
TextColor( 0, 0, 0 );
for j:=1 to 10 do
 begin
  randomize;                    
  i:=random(9);
  x:=x+15;
  moveto(10,x);
  write('Nacisnij ',tab[11+i],' : ');
  readln(a);
  k:=k+1;
  while(a<>tab[11+i]) do
  begin
   x:=x+15;
   moveto(10,x);
   readln(a);
  k:=k+1;
    end;
 end;
x:=x+15;
moveto(10,x);
writeln('Procent skutecznosci: ',1000/k,'%');
end;

procedure a3;
var
  a:char;
 i,j,x,k:integer;
begin
x:=170;
k:=0;
TextColor( 255, 0, 0 );
wstaw3;
TextColor( 0, 0, 0 );
for j:=1 to 10 do
 begin
  randomize;                    
  i:=random(7);
  x:=x+15;
  moveto(10,x);
  write('Nacisnij ',tab[20+i],' : ');
  readln(a);
    k:=k+1;
  while(a<>tab[20+i]) do
   begin
    x:=x+15;
    moveto(10,x);
    readln(a);
    k:=k+1;
    end;
 end;
x:=x+15;
moveto(10,x);
writeln('Procent skutecznosci: ',1000/k,'%');
end;

procedure a4;
var
  a:char;
 i,j,x,k:integer;
begin
TextColor( 255, 0, 0 );
wstaw1;
wstaw2;
wstaw3;
TextColor( 0, 0, 0 );
x:=170;
  k:=0;
for j:=1 to 10 do
 begin
  randomize;                    
  i:=random(26);
  x:=x+15;
  moveto(10,x);
  write('Nacisnij ',tab[1+i],' : ');
  readln(a);
    k:=k+1;
  while(a<>tab[1+i]) do
  begin
  x:=x+15;
  moveto(10,x);
  readln(a);
    k:=k+1;
  end;
 end;
x:=x+15;
moveto(10,x);
writeln('Procent skutecznosci: ',1000/k,'%');
end;

procedure wybor;
begin
 tablica;
 t這;
 wstaw;
 moveto(10,170);
 if tab[27]='1' then a1;
 if tab[27]='2' then a2;
 if tab[27]='3' then a3;
 if tab[27]='4' then a4;
end; 

procedure intro;
begin
t這;
moveto(10,40);
writeln('************************************************');
moveto(10,55);
writeln('*                                              *');
moveto(10,70);
writeln('*                                              *');
moveto(10,85);
writeln('*               Autor: Szymon Karchut          *');
moveto(10,100);
writeln('*                                              *');
moveto(10,115);
writeln('*        Program losuje litere z przedzialu    *');
moveto(10,130);
writeln('*      wybranego przez uzytkownika i sprawdza  *');
moveto(10,145);
writeln('*       ilosc poprawnie wcisnietych klawiszy.  *');
moveto(10,160);
writeln('*                                              *');
moveto(10,175);
writeln('*           Prosze pisac duzymi literami       *');
moveto(10,190);
writeln('*                                              *');
moveto(10,205);
writeln('************************************************');
readln;
end;

begin
 intro;
 tablica;
 t這;
 wstaw;
 podaj;
 wybor;
end.