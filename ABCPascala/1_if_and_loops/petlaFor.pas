Program PêtlaFor; 

var 
   c:char; 
   i:integer; 

Begin 
  For i:=0 to 9 do 
    write(i); 
  writeln; 
  For c:='a' to 'z' do 
    write(c); 
  writeln; 
  For i:=9 downto 0 do 
    write(i); 
  writeln; 
  For c:='z' downto 'a' do 
    write(c); 
end.
