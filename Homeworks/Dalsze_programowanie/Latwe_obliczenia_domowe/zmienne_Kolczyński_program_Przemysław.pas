Program Zmienne;
const nazwa='M�j program';
x=6;
y=10;
var a,b,c,d,e,f,g,h,i:real;
begin
{r�wnanie 1}
a:=x+2;
a:=a*3;
a:=a+1;
c:=2*x;
d:=y-c;
a:=a/d;
{r�wnanie 2}
e:=1+x;
e:=e*10;
f:=y*3;
e:=3/f;
{r�wnanie 3}
g:=7*7;
g:=g-3;
h:=x*y;
h:=h-1;
i:=6*6;
g:=g/h;
g:=g+i;

writeln(nazwa);
writeln('Obliczenia "na raty"');
writeln(a);
writeln(e);
writeln(g);

writeln('Obliczenia "proste"');
writeln((x+2)*3+1/(y-2*x));
writeln(((1+x)*10)/(y*3));
writeln (7*7-3/(x*y-1)+6*6);
end.
