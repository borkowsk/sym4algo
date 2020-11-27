Program LengthDemo; 

Var 
   s: string; 
   i: integer; 

Begin 
  ReadLn(s); 
  For i := 1 to Length(s) do 
    WriteLn(s[i]) 
end.
