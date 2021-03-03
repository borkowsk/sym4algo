Program kwadrat; 

Label 10; 
Var 
   a,x,y:integer; 

Begin 
  10:Write('Podaj d³ugoœæ boku kwadratu: '); 
  ReadLn(a); 
  Begin 
    If a<1 then 
      GoTo 10; 
    For x:=1 to a do 
      Begin 
        For y:=1 to a do 
          If odd(x)=true then 
            Write ('*':2) 
          else 
            Write('x':2); 
        writeln; 
      end; 
  end; 
end.