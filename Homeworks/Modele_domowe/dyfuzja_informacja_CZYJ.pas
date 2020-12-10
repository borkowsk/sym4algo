Program Dyfuzja; 

type 
   czlowiek=record 
        wie,dowiedzialSie,powiedzial:boolean; 
   end; 

   const 
   Bok=5; 
   Przerwa=0; 
   X=90; 
   Y=90; 
   procentStart=5; 
   procentTotal=15; 
   procentSkok=0; 
   Kroki=10; 
   Zasieg=1; 
   Plik = 'Informacja.xls'; 
var 
   i,j,k,krok,procent:integer; 
   ludzie:array[1..X,1..Y] of czlowiek; 
   iluWie:array[0..Kroki] of integer; 

Procedure rysujBoks(x,y:integer;c:czlowiek); 

var 
   x1,y1:integer; 
Begin 
  if (c.wie) then 
    begin 
      Brush(1,0,255,0); 
    end 
  else 
    if (c.dowiedzialSie) then 
      begin 
        Brush(1,255,255,128); 
      end 
    else 
      begin 
        Brush(1,255,0,0); 
      end; 
  x1:=Przerwa*x+(x-1)*Bok; 
  y1:=Przerwa*y+(y-1)*Bok; 
  Rectangle(x1,y1,x1+Bok,y1+Bok); 
End; 

Procedure init(); 

Begin 
  iluWie[0]:=0; 
  krok:=1; 
  procent:=procentTotal; 
  For i:=1 to X do 
    For j:=1 to Y do 
      Begin 
        if (random(100) < procentStart) then 
          begin 
            ludzie[i,j].wie:=true; 
            iluWie[0]:=iluWie[0]+1; 
          end 
        else 
          begin 
            ludzie[i,j].wie:=false; 
          end; 
        ludzie[i,j].dowiedzialSie:=false; 
        ludzie[i,j].powiedzial:=false; 
        rysujBoks(i,j,ludzie[i,j]); 
      end; 
end; 

Procedure koniec(); 

var 
   iluWieOgolem:integer; 
   P:text; 
Begin 
  Assign(P, Plik); 
  Rewrite(P); 
  iluWieOgolem:=iluWie[0]; 
  Brush(1,255,255,255); 
  MoveTo( 0, Y*(Bok+Przerwa)+10); 
  Writeln('Krok, iluSieDowiedzialo, Razem'); 
  Writeln(P, 'Krok',chr(9),'iluSieDowiedzialo',chr(9),'Razem'); 
  for i:=1 to Kroki do 
    begin 
      iluWieOgolem:=iluWieOgolem+iluWie[i]; 
      Writeln(i,',',iluwie[i],',',iluWieOgolem); 
      Writeln(P, i,chr(9),iluwie[i],chr(9),iluWieOgolem); 
    end; 
  Close(P); 
end; 

Procedure opowiedz(px,py,zas:integer); 

var 
   ii,jj,p,q:integer; 
Begin 
  if (ludzie[i,j].powiedzial=false) then 
    Begin 
      ludzie[i,j].powiedzial:=true; 
      For ii:=px-zas to px+zas do 
        For jj:=py-zas to py+zas do 
          Begin 
            if (random(100)<procent) then 
              Begin 
                p:=ii; 
                q:=jj; 
                if (ii<1)then 
                  Begin 
                    p:=X+ii; 
                  end 
                else 
                  if (ii>X) then 
                    Begin 
                      p:=ii-X; 
                    end; 
                if (jj<1)then 
                  Begin 
                    q:=Y+jj; 
                  end 
                else 
                  if (jj>Y) then 
                    begin 
                      q:=jj-Y; 
                    end; 
                ludzie[p,q].dowiedzialSie:=true; 
                if (ludzie[p,q].wie=false) then 
                  begin 
                    rysujBoks(p,q,ludzie[p,q]); 
                  end; 
              end; 
          end; 
    end; 
end; 

Begin 
  init; 
  For krok:=1 to Kroki do 
    begin 
      iluWie[krok]:=0; 
      procent:=procent-procentSkok; 
      For i:=1 to X do 
        For j:=1 to Y do 
          Begin 
            if (ludzie[i,j].dowiedzialSie) then 
              begin 
                if (ludzie[i,j].wie=false) then 
                  begin 
                    iluWie[krok]:=iluWie[krok]+1; 
                  end; 
                ludzie[i,j].wie:=true; 
                rysujBoks(i,j,ludzie[i,j]); 
              end; 
          end; 
      Delay(1000); 
      For i:=1 to X do 
        For j:=1 to Y do 
          begin 
            if (ludzie[i,j].wie) then 
              begin 
                opowiedz(i,j,Zasieg); 
              end; 
          End; 
      Delay(500); 
    end; 
  koniec; 
end.
