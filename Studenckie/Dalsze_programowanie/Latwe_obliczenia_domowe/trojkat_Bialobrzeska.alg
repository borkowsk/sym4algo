Program Trojkat;
{3) Napisz program wypisuj�cy na konsole zbudowany z gwiazdek tr�jk�t prostok�tny o d�ugo�ci bok�w przyprostok�tnych zadanym za pomoc� zmiennej (var) o domy�lnej warto�ci 4.

Umo�liw zmian� d�ugo�ci boku za pomoc� czytania warto�ci z konsoli.}



 var a, b, c:integer;
  begin
     a:=4;
     
     Writeln('Tr�jk�t zbudowany z gwiazdek');
Textcolor(213, 106, 0);
     for c:=1 to a do
          begin
          for b:=1 to c do
           
           Write('*':1);
           Writeln;
          end;
          
     Writeln;
     Textcolor(0, 128, 0);
     Writeln('-=Podaj ilo�� gwiazdek w wierszu i kolumnie-d�ugo�ci bok�w.=-'); writeln;
     Write('*=');
     Readln(a);
     Writeln;
 
    if a<=0 then
        begin
        repeat 
         Textcolor(253, 0, 0);
         Writeln('-=Podaj ilo�� gwiazdek w wierszu i kolumnie-d�ugo�ci bok�w.=-'); writeln;
         Write('*=');
         Readln(a);
         Writeln;
         until a>0
        end;
        
    if a>0 then
       begin
         Textcolor(0, 128, 0);
         Writeln;
         Writeln('-=Tw�j tr�jk�t=-');
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