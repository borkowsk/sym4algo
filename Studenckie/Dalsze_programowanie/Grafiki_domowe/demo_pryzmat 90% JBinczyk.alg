{
W za³¹czniku przesy³am pracê domow¹.

Pozdrawiam!

Jan Biñczyk
}

{A reszta grupy?!
Dosyæ ba³aganiczny ten kod...}

Program Pryzmat; 

Var 
i,s:integer; 
k,m:integer; 
r,f:integer;


Procedure pryzmat(x,y:integer); 
{PRYZMAT} 
Begin 


Pen(3, 188, 188, 188); 
MoveTo(420,400);{dó³PRAWY}
LineTo(180,500);
MoveTo(420,400);{prawyPRAWY}
LineTo(230,180);
MoveTo(180,500);{lewyPRAWY}
LineTo(230,180);
MoveTo(180,500);{dó³LEWY}
LineTo(50,400);
MoveTo(50,400);{lewyLEWY}
LineTo(230,180);
MoveTo(50,400);{dó³TYLNI}
LineTo(420,400);
Fill(10, 10);


end; 




Procedure promien(x,y:integer); 


Begin 
{ Pen(253, 248, 206,0 ); } 
Pen(10, 255, 255, 255); 
Line(250, i*22, 250, i*22); 



end; 
Procedure promien0(x,y:integer); 
Begin
Pen(i, 255, 255, 255); 
MoveTo(0,237); 
LineTo(154,275); 
Line(250, 250+i*55, 250, 250+i*55); 

{ROZSZCZEPIONE SWIATLO W PRYZMACIE}

Pen(4,243, 250, 220);
MoveTo(154,275);{lewe}
LineTo(205,340);
MoveTo(154,275);{tylne}
LineTo(328,295);
MoveTo(328,295);{prawe}
LineTo(205,340);

end;


Procedure promien1(x,y:integer); 


Begin 



Pen(6, 152, 106, 172); 
MoveTo(328,295); 
LineTo(2000,1000); 


end;

Procedure promien2(x,y:integer); 


Begin 



Pen(6, 184, 119, 191); 
MoveTo(304,304); 
LineTo(2000,1200); 




end;
Procedure promien3(x,y:integer);
Begin
Pen(6, 109, 113, 2483); 
MoveTo(287,313); 
LineTo(2000,1400); 

end;

Procedure promien4(x,y:integer); 


Begin 

Pen(6, 116, 222, 10); 
MoveTo(270,320); 
LineTo(2000,1600); 




end;

Procedure promien5(x,y:integer); 

Begin;
Pen(6, 231, 239, 71); 
MoveTo(249,326); 
LineTo(2000,1800); 

end; 

Procedure promien6(x,y:integer); 
Begin
Pen(6, 238, 203, 81); 
MoveTo(227,337); 
LineTo(2000,2000); 


end;
Procedure promien7(x,y:integer); 
Begin
Pen(6,223, 0, 0); 
MoveTo(205,340); 
LineTo(2000,2200); 


end;
Begin 

For i:=1 to 1 do 
Begin

LineTo(0, 0); 
LineTo(0, 500); 
LineTo(500, 500); 
LineTo(100, 500);
Brush(1,0, 0, 0); 
Fill(10, 10);

end; 

Begin 

For i:=1 to 1 do 
Begin

k:=1;
m:=1;

pryzmat(k,m);

end;

Begin 

For i:=1 to 10 do 
Begin

k:=1;
m:=1;

promien0(k,m);

Delay(100);
end;

Begin 

For i:=1 to 10 do 
Begin


promien1(k,m);
promien2(k,m);
promien3(k,m);
promien4(k,m);
promien5(k,m);
promien6(k,m);
promien7(k,m);
moveto(100,20);
textcolor(243, 243, 243); 
Font(10 ,0 ,400 );
writeln ('pryzmat fiz., graniastos³up z przezroczystego materia³u'); 
writeln ('o podstawie trójk¹tnej, rozszczepiaj¹cy œwiat³o na widmo!');
Delay(150);
end;
end;
end;
end;

end.
