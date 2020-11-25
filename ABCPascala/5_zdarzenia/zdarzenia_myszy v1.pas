Program ZdarzenieDemo; 
{Skopiowane z pomocy to programu Algo}
Var 
   k, x, y: integer; 
Begin 
  Repeat 
    Event(k, x, y); 
    Write('Czynnoœæ: '); 
    If k=1 then 
      Begin 
        Write('klawiatura. '); 
        If y=0 then 
          WriteLn('Wciœniêty klawisz steruj¹cy. Kod ',x) 
        else 
          If y=1 then 
            WriteLn('Steruj¹cy klawisz. Kod ',x) 
          else 
            WriteLn('Widoczny klawisz. Znak ''',chr(x),'''') 
      end 
    else 
      If k=2 then 
        WriteLn('mysz. Lewy przycisk. X=',x,' Y=',y) 
      else 
        WriteLn('mysz. Mysz przemieszcza siê: X=',x,' Y=',y) 
  until (k=1) and (x=27); 
end.


