Program Losowanie_galtona1; 
{Jak wyglada rozk³ad wylosowanych cyfr} 

Const 
   ile_razy=1000; 
   ile_cyfr=7; 
Var 
   liczniki:array[0..ile_cyfr] of integer; 

procedure losuj; 
Var 
   i:integer; 
   c:integer; 
begin 
  WriteLn('Losowanie ',ile_razy,' liczb z zakresu <0..',ile_cyfr-1,'>'); 
  For i:=1 to ile_razy do 
    begin 
      c:=random(2)+random(2)+random(2)+random(2)+random(2)+random(2); 
      Write(c,' '); 
      liczniki[c]:=liczniki[c]+1; 
    end; 
end; 

procedure zeruj; 
Var 
   j:integer; 
begin 
  for j:=0 to ile_cyfr-1 do 
    liczniki[j]:=0; 
end; 

procedure drukuj; 
Var 
   j:integer; 
begin 
  writeln; 
  writeln('WYNIKI:'); 
  for j:=0 to ile_cyfr-1 do 
    writeln(j,' ',liczniki[j]); 
end; 

Begin 
  zeruj; 
  losuj; 
  drukuj; 
end.
