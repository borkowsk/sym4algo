program ZmienneNapisy; 
const Sta³aNapisowa='12345678901234567890';
var 
   afc:array[0..1023] of char; 
   c:char;
   i:integer;
   
   s1:string[10]; 
   s2:string[255]; 
  
begin 
  for c:='A' to 'z' do
  begin
     afc[ord(c)-ord('A')]:=c;
  end;
  
  for i:=0 to ord('z')-ord('A') do
     write(afc[i]); 
  
  writeln;
        
  s1:='Tralalala'; 
  
  s2:=Sta³aNapisowa;
  s2:=s2+Sta³aNapisowa+Sta³aNapisowa+Sta³aNapisowa;
  
  writeln(s1);
  writeln(s2);
end.
