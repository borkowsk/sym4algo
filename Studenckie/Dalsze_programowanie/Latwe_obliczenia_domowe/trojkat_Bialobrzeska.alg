Program Trojkat;
{3) Napisz program wypisuj¹cy na konsole zbudowany z gwiazdek trójk¹t prostok¹tny o d³ugoœci boków przyprostok¹tnych zadanym za pomoc¹ zmiennej (var) o domyœlnej wartoœci 4.

Umo¿liw zmianê d³ugoœci boku za pomoc¹ czytania wartoœci z konsoli.}



 var a, b, c:integer;
  begin
     a:=4;
     
     Writeln('Trójk¹t zbudowany z gwiazdek');
Textcolor(213, 106, 0);
     for c:=1 to a do
          begin
          for b:=1 to c do
           
           Write('*':1);
           Writeln;
          end;
          
     Writeln;
     Textcolor(0, 128, 0);
     Writeln('-=Podaj iloœæ gwiazdek w wierszu i kolumnie-d³ugoœci boków.=-'); writeln;
     Write('*=');
     Readln(a);
     Writeln;
 
    if a<=0 then
        begin
        repeat 
         Textcolor(253, 0, 0);
         Writeln('-=Podaj iloœæ gwiazdek w wierszu i kolumnie-d³ugoœci boków.=-'); writeln;
         Write('*=');
         Readln(a);
         Writeln;
         until a>0
        end;
        
    if a>0 then
       begin
         Textcolor(0, 128, 0);
         Writeln;
         Writeln('-=Twój trójk¹t=-');
         Writeln;
         Textcolor(213, 106, 0);
             
         for c:=1 to a do
          begin
          for b:=1 to c do
           
           Write('*':1);
           Writeln;
          end;
       end;
      
      Writeln;
      Textcolor(0, 0, 0); 
      Write('####Koniec programu####'); 
end. 