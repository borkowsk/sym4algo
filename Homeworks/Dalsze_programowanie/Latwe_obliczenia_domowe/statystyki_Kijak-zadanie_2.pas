program �rednia_pierwiastek_�redniej_sumowanie_kwadrat; 


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
writeln('ilo�� liczb:'); 
readln(l); 
writeln('wpisz warto��i'); 
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
writeln ('Dla warto��i dodatnich:'); 
writeln ('wysz�o ',licz1,' warto��i dodatnich'); 
writeln ('suma = ',sum1); 
writeln ('�rednia = ',x); 
writeln ('kwadrat �redniej= ',kwadrat(x)); 
writeln ('pierwiastek �redniej= ',sqrt(x)); 
end; 
else 
writeln ('brak warto��i  dodatnich'); 
if licz2>0 then 
begin 
y:=sum2/licz2; 
writeln (''); 
writeln ('Dla warto�ci ujemnych :'); 
writeln ('wysz�o ',licz2,' warto��i ujemnych'); 
writeln ('suma = ',sum2); 
writeln ('�rednia = ',y); 
writeln ('kwadrat �redniej= ',kwadrat(y)); 
writeln ('pierwiastek �redniej nie wyst�puje'); 
end; 
else 
writeln ('brak liczb ujemnych'); 
end;
 
writeln (''); 
writeln('warto�� zero pojawi�o si� ',sum3,' razy'); 
end.