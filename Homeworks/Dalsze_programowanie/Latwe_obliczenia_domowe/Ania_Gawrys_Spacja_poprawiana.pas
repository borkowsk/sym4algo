Program FirstLine; 
{Program Ani Gawry�} 

VAR 
   plik,plik2:text; 
   c,d:char; 
   nazwa,nazwa2:string; 

BEGIN 
  d:=' '; 
  Font (10,0,800); 
  Writeln ('Program s�u�y do usuwaniazb�dnych spacji w plikach'); 
  Writeln ('tekstowych.'); 
  Writeln; 
  Font (8,0,400); 
  Writeln('Podaj nazw� pliku wej�ciowego (w kt�rym chcesz poprawi�'); 
  Write ('ilo�� spacji: '); 
  TextColor(120,50,70); 
  Font (8,0,800); 
  Readln(nazwa); 
  Assign(plik,nazwa); 
  Reset(plik); 
  Writeln; 
  TextColor (0,0,0); 
  Font (8,0,400); 
  Writeln('Podaj nazw� pliku wyj�ciowego (w kt�rym program zapisze'); 
  Write ('poprawion� wersj�: '); 
  TextColor(120,50,70); 
  Font (8,0,800); 
  Readln(nazwa2); 
  Assign(plik2,nazwa2); 
  ReWrite(plik2); 
  Repeat 
    Begin 
      Read(plik,c); 
      if c<>' ' then 
        Write (plik2,c) 
      else 
        {a u mnie dzia�a ;-)} 
        Begin 
          if c<>d then 
            Write (plik2,c); 
        end; 
      d:=c; 
    end; 
  Until Eof(plik); 
  Close (plik); 
  Close (plik2); 
  TextColor (0,0,0); 
  Font (8,0,400); 
  Writeln; 
  Writeln ('Aby zobaczy� rezultat odszukaj i otw�rz plik: ',nazwa2,'.'); 
END.
