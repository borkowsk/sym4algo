Program FirstLine; 
{Program Ani Gawryœ} 

VAR 
   plik,plik2:text; 
   c,d:char; 
   nazwa,nazwa2:string; 

BEGIN 
  d:=' '; 
  Font (10,0,800); 
  Writeln ('Program s³u¿y do usuwaniazbêdnych spacji w plikach'); 
  Writeln ('tekstowych.'); 
  Writeln; 
  Font (8,0,400); 
  Writeln('Podaj nazwê pliku wejœciowego (w którym chcesz poprawiæ'); 
  Write ('iloœæ spacji: '); 
  TextColor(120,50,70); 
  Font (8,0,800); 
  Readln(nazwa); 
  Assign(plik,nazwa); 
  Reset(plik); 
  Writeln; 
  TextColor (0,0,0); 
  Font (8,0,400); 
  Writeln('Podaj nazwê pliku wyjœciowego (w którym program zapisze'); 
  Write ('poprawion¹ wersjê: '); 
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
        {a u mnie dzia³a ;-)} 
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
  Writeln ('Aby zobaczyæ rezultat odszukaj i otwórz plik: ',nazwa2,'.'); 
END.
