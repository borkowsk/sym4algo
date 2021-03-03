Program sinus; 

Const 
   n=0.3; 
Var 
   x,p,w,a:real; 

procedure gw; 

begin 
  a:=0; 
  while a<p do 
    begin 
      a:=a+n; 
      if a=x then 
        begin 
          writeln ('*'); 
        end; 
    end; 
end; 

Begin 
  x:=0; 
  p:=2; 
  while x<p do 
    begin 
      x:=x+n; 
      w:=sin(x);
      gw; 
      writeln (w); 
    end; 
end.
--------------------------------------
program tabliczkaMnozenia; 

const 
   x=10; 
   y=10; 
var 
   a,b:integer; 

begin 
  write('':2); 
  for a:=1 to x do 
    write (a:4); 
  writeln; 
  for b:=1 to y do 
    begin 
      write(b:2); 
      for a:=1 to x do 
        write(b*a:4); 
      writeln; 
    end; 
end.
--------------------------------------
program ciag; 
const 
   a=2; 
var 
   x:integer; 
   s:integer; 
begin 
  x:=-1; 
  s:=0; 
  while x<20 do 
    begin 
      x:=x+a; 
      write(x,';':2); 
      s:=x+s; 
    end; 
  writeln; 
  write('suma: '); 
  write(s:2); 
end.
--------------------------------------
Program gwiazdkowyKwadrat; 
Var 
   a,x,y:integer; 
Begin 
  Write('podaj d³ugoœæ boku i wciœnij ENTER: '); 
  Read(a); 
  Begin 
    If a<1 then 
    writeln(''); 
    writeln(''); 
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
