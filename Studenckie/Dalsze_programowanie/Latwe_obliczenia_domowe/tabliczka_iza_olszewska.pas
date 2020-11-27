program tabliczka;
var
i,j,k,w: integer;
begin
write('ile kolumn');
readln(k);
write('ile wierszy');
readln(w);
write('*');
for j:=1 to k do
write(j:4);
writeln;
for i:=1to w do
begin

write (i:2);
for j:=1 to k do
write(i*j:4);
writeln;
end;
end.