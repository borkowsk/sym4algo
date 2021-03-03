Program MyszDemo; 
{Program pozwala umieszczac ko³a klikaniem albo przesuwaniem/wleczeniem}
const 
   ZdarzenieKlawiatury=1; 
   ZdarzenieLewyPrzycisk=2; 
   ZdarzenieLewyWleczenie=3; 

procedure assert(f:boolean;s:string); 
{Procedura przerywa program gdy warunek kontrolny nie jest spelniony} 
begin 
  if not(f) then 
    begin 
    writeln('Niespe³niono warunku: ',s);
    writeln('Program zatrzymany awaryjnie',1/0);
    {Trzeba dzieliæ przez 0 bo w ALGO nie ma 'halt;'}
    end 
end; 

procedure Obs³ugaMyszy; 

Var 
   typ_zdarzenia, x, y,oldx,oldy: integer; 
Begin 
  Repeat 
    Event(typ_zdarzenia, x, y); 
    If typ_zdarzenia<>ZdarzenieKlawiatury then 
      Begin 
        If typ_zdarzenia=ZdarzenieLewyPrzycisk then 
          begin 
            {WriteLn('mysz. Lewy przycisk. X=',x,' Y=',y) } 
            pen(1,0,0,0); 
            ellipse(x-5,y-5,x+5,y+5); 
            oldx:=x; 
            oldy:=y; 
          end 
        else 
          begin 
            assert(typ_zdarzenia=ZdarzenieLewyWleczenie,'typ_zdarzenia=ZdarzenieLewyWleczenie'); 
            {WriteLn('mysz. Mysz przemieszcza siê: X=',x,' Y=',y); } 
            pen(1,255,255,255); 
            ellipse(oldx-5,oldy-5,oldx+5,oldy+5); 
            pen(1,0,0,0); 
            ellipse(x-5,y-5,x+5,y+5); 
            oldx:=x; 
            oldy:=y; 
          end; 
      end 
  until (typ_zdarzenia=ZdarzenieKlawiatury); 
  Writeln('Wciœniecie klawiatury przerywa obslugê'); 
end; 

begin 
  Obs³ugaMyszy; 
end.
