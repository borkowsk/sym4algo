Program AutomatKolory; 

Const 
   FieldW=40; 
   {szerokosc pola} 
   FieldH=40; 
   {wysoskosc pola} 
   BlockSize=8; 
   {rozmiar komorki} 
   ColorCount=4; 
   {ilosc kolorow} 
   ChangeLimit=3; 
   {ilosc sasiadow potrzebna do zmiany koloru} 
Type 
   color=record 
        r,g,b:integer; 
   end; 
Var 
   Field:array[1..FieldW,1..FieldH] of integer; 
   Buffer:array[1..FieldW,1..FieldH] of integer; 
   Counter:array[1..ColorCount] of integer; 
   Colors:array[1..ColorCount] of color; 
   k,x,y:integer; 

Procedure RandomizeBuffer; 

Var 
   i,j:integer; 
Begin 
  For i:=1 to FieldW do 
    For j:=1 to FieldH do 
      Begin 
        Buffer[i,j]:=random(ColorCount)+1; 
      end; 
end; 

Procedure RandomizeColors; 

Var 
   i:integer; 
Begin 
  For i:=1 to ColorCount do 
    Begin 
      Colors[i].r:=random(256); 
      Colors[i].g:=random(256); 
      Colors[i].b:=random(256); 
    end; 
end; 

Procedure InitField; 

Var 
   i,j:integer; 
Begin 
  For i:=1 to FieldW do 
    For j:=1 to FieldH do 
      Field[i,j]:=0; 
End; 

Procedure UpdateField; 

Var 
   i,j:integer; 
Begin 
  For i:=1 to FieldW do 
    For j:=1 to FieldH do 
      Begin 
        if Field[i,j]<>Buffer[i,j] then 
          begin 
            Field[i,j]:=Buffer[i,j]; 
            Pen(0,Colors[Field[i,j]].r,Colors[Field[i,j]].g,Colors[Field[i,j]].b); 
            Brush(1,Colors[Field[i,j]].r,Colors[Field[i,j]].g,Colors[Field[i,j]].b); 
            Rectangle(BlockSize*i,BlockSize*j,BlockSize*(i+1),BlockSize*(j+1)); 
          end; 
      end; 
end; 

Procedure Process; 

Var 
   i,j,k,l,cx,cy,c,max,maxc:integer; 
   equal:boolean; 
   count:array[1..ColorCount]of integer; 
Begin 
  For i:=1 to FieldW do 
    For j:=1 to FieldH do 
      Begin 
        for c:=1 to ColorCount do 
          count[c]:=0; 
        for k:=-1 to 1 do 
          for l:=-1 to 1 do 
            begin 
              cx:=i+k; 
              cy:=j+l; 
              if cx>FieldW then 
                cx:=1; 
              if cy>FieldH then 
                cy:=1; 
              if cx<1 then 
                cx:=FieldW; 
              if cy<1 then 
                cy:=FieldH; 
              if not((k=0) and (l=0)) then 
                count[Field[cx,cy]]:=count[Field[cx,cy]]+1; 
            end; 
        max:=0; 
        maxc:=0; 
        equal:=true; 
        for c:=1 to ColorCount do 
          begin 
            if max<count[c] then 
              begin 
                max:=count[c]; 
                maxc:=c; 
                equal:=false; 
              end 
            else 
              if max=count[c] then 
                begin 
                  equal:=true; 
                end; 
          end; 
        if not equal then 
          if max>=ChangeLimit then 
            Buffer[i,j]:=maxc; 
      End; 
end; 

Procedure DrawLegend; 

Var 
   i,j,c,total:integer; 
   percent:real; 
Begin 
  total:=FieldW*FieldH; 
  moveto(BlockSize,(FieldH*BlockSize)+20); 
  Brush(0,255,255,255); 
  Pen(1,0,0,0); 
  Writeln('Spacja -> nastepny krok; ESC -> zakonczenie programu'); 
  For c:=1 to ColorCount do 
    Counter[c]:=0; 
  For i:=1 to FieldW do 
    for j:=1 to FieldH do 
      begin 
        Counter[Field[i,j]]:=Counter[Field[i,j]]+1; 
      end; 
  For c:=1 to ColorCount do 
    begin 
      Brush(1,255,255,255); 
      Pen(1,255,255,255); 
      rectangle(BlockSize,(FieldH*BlockSize)+40+20*c,600,(FieldH*BlockSize)+40+20*(c+1)); 
      pen(1,0,0,0); 
      brush(1,Colors[c].r,Colors[c].g,Colors[c].b); 
      rectangle(BlockSize,(FieldH*BlockSize)+40+20*c,BlockSize+12,(FieldH*BlockSize)+40+20*c+12); 
      moveto(Blocksize+20,(FieldH*BlockSize)+38+20*c); 
      brush(0,255,255,255); 
      percent:=(Counter[c]/total)*100; 
      write('Kolor #',c,' - ilosc: ',Counter[c],'/',total,' (',percent:2:2,'%)'); 
    end; 
end; 

Begin 
  RandomizeColors; 
  InitField; 
  RandomizeBuffer; 
  UpdateField; 
  DrawLegend; 
  repeat 
    event(k,x,y); 
    if(k=1) and (x=32) then 
      begin 
        Process; 
        UpdateField; 
        DrawLegend;
      end; 
  until (k=1) and (x=27); 
end.
