program œrednia_pierwiastek_œredniej_sumowanie_kwadrat; 


function kwadrat(x:real):real; 

begin 
kwadrat:=x*x; 
end; 

var 
sum1,sum2,sum3,w,x,y: real; 
z,l,licz1,licz2:integer; 

begin 
sum1:=0; 
sum2:=0; 
sum3:=0; 
licz1:=0; 
licz2:=0; 
writeln('iloœæ liczb:'); 
readln(l); 
writeln('wpisz wartoœæi'); 
for z:=1 to l do 
begin 
readln(w); 
if w>0 then 
begin 
Sum1 := sum1 + w; 
licz1:=licz1+1; 
end;
 
if w<0 then 
begin 
Sum2 := sum2 + w; 
licz2:=licz2+1; 
end;
 
if w=0 then 
sum3:= sum3+1; 
end;
 
if l>0 then 
begin 
if licz1>0 then 
begin 
x:=sum1/licz1; 
writeln ('Dla wartoœæi dodatnich:'); 
writeln ('wysz³o ',licz1,' wartoœæi dodatnich'); 
writeln ('suma = ',sum1); 
writeln ('Œrednia = ',x); 
writeln ('kwadrat œredniej= ',kwadrat(x)); 
writeln ('pierwiastek œredniej= ',sqrt(x)); 
end; 
else 
writeln ('brak wartoœæi  dodatnich'); 
if licz2>0 then 
begin 
y:=sum2/licz2; 
writeln (''); 
writeln ('Dla wartoœci ujemnych :'); 
writeln ('wysz³o ',licz2,' wartoœæi ujemnych'); 
writeln ('suma = ',sum2); 
writeln ('Œrednia = ',y); 
writeln ('kwadrat œredniej= ',kwadrat(y)); 
writeln ('pierwiastek œredniej nie wystêpuje'); 
end; 
else 
writeln ('brak liczb ujemnych'); 
end;
 
writeln (''); 
writeln('wartoœæ zero pojawi³o siê ',sum3,' razy'); 
end.