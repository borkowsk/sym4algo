Program Zaliczeniowy;

{Adrian Gnatek}

{Jest to elektroniczna ankieta- narz�dzie socjologa.
Tre�� ankiety zosta�a sporz�dzona przez Micha�a Haruki 
Yamazaki,a sama ankieta zosta�a przeprowadzona na terenie 
SWPS w okresie 29 Maja 2006 - 5 Czerwca 2006.}

{W wyborze tematu do napisania kierowa�em si�
przede wszystkim u�yteczno�ci�. Wybra�em napisanie programu
-ankiety, poniewa� miewam okazj� "r�cznie" liczy� �rednie 
z setek ankiet. Dzi�ki temu narz�dziu mo�na wi�c oszcz�dzi�
naprawd� sporo czasu.}

{Korzystaj�c z okazji dzi�kuj� za bardzo mi�y kurs. Musz�
przyzna�, �e licz� na kontynuacj�. Pozdrawiam.}
  
 Var
  Sumaa,Sumab,Sumac,Sumad,Sumae,Sumaf:real; 
  Sumag,Sumah,Sumai,Sumaj,Sumak,Sumal:real;
  Sumam,Suman,Sumao,Sumap,Sumar,Sumas:real; 
  Liczbaa,Liczbab,Liczbac,Liczbad,Liczbae,Liczbaf:integer;
  Liczbag,Liczbah,Liczbai,Liczbaj,Liczbak,Liczbal:integer;
  Liczbam,Liczban,Liczbao,Liczbap,Liczbar,Liczbas:integer;  
  a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t,u:integer;
  dok:text;

{-------------------------------------- }
{Ta procedura czy�ci pami�� przy pierwszym
 uruchomieniu ankiety}
 
Procedure Czyszczenie;
 Begin
  Sumaa:=0; Liczbaa:=0;
  Sumab:=0; Liczbab:=0;
  Sumac:=0; Liczbac:=0;
  Sumad:=0; Liczbad:=0;
  Sumae:=0; Liczbae:=0;
  Sumaf:=0; Liczbaf:=0;
  Sumag:=0; Liczbag:=0;
  Sumah:=0; Liczbah:=0;
  Sumai:=0; Liczbai:=0;
  Sumaj:=0; Liczbaj:=0;
  Sumak:=0; Liczbak:=0;
  Sumal:=0; Liczbal:=0;
  Sumam:=0; Liczbam:=0;
  Suman:=0; Liczban:=0;
  Sumao:=0; Liczbao:=0;
  Sumar:=0; Liczbar:=0;
  Sumas:=0; Liczbas:=0;
 end;

{-------------------------------------- }
Procedure Start;
 Begin
  Writeln('                 ANKIETA');
  Writeln;
  Writeln('Serdecznie dzi�kujemy za udzia� w ankiecie'); 
  Writeln('maj�cej na celu zbadanie stosunku student�w');
  Writeln('do nowo otwartego bufetu w naszej szkole.');
  Writeln('Nast�pnie, jako Samorz�d SWPS, mamy zamiar');
  Writeln('przekaza� Wasze opinie w�a�cicielowi tego�');
  Writeln('bufetu i postara� si� wystosowa� ewentualne');
  Writeln('postulaty, kt�re pojawi� si� w toku badania.');
  Writeln;
  Writeln('********************************************');
  Writeln('Prosz� wybra� odpowiedni� odpowied� na skali:');
  Writeln('1 - zdecydowanie nie, 2 - raczej nie');
  Writeln('3 - raczej tak, 4 - zdecydowanie tak');
  Writeln('********************************************');   
 end;

 
{----------------------------------------}
 {Kombinowa�em na r�ne sposoby, jakby t� procedur�
 upro�ci�, ale to rozwi�zanie wydaje mi si� najbardziej
  'stabilne'}
   
Procedure Pytania;
 
 Begin
   Writeln;
   Repeat
   Write('1. Czy uwa�asz, �e w bufecie jest czysto? ');Read(a);
   Until (a>=1)and(a<=4); 
   Sumaa:=Sumaa+a;
   Liczbaa:=Liczbaa+1;
   
   Writeln;
   Repeat
   Write('2. Czy uwa�asz, �e w bufecie panuje przyjemny zapach? ');Read(b);
   Until (b>=1)and(b<=4);
   Sumab:=Sumab+b;
   Liczbab:=Liczbab+1;
   
   Writeln;
   Repeat   
   Write('3. Czy podoba Ci si� atmosfera w bufecie? ');Read(c);
   Until (c>=1)and(c<=4);
   Sumac:=Sumac+c;
   Liczbac:=Liczbac+1;
      
   Writeln;
   Repeat   
   Write('4. Czy podoba Ci si� wystr�j bufetu? ');Read(d);
   Until (d>=1)and(d<=4);
   Sumad:=Sumad+d;
   Liczbad:=Liczbad+1;   
   
   Writeln;
   Repeat   
   Write('5. Czy uwa�asz, �e g�o�no�� muzyki w bufecie jest odpowiednia? ');Read(e);
   Until (e>=1)and(e<=4);
   Sumae:=Sumae+e;
   Liczbae:=Liczbae+1;   
   
   Writeln;
   Repeat   
   Write('6. Czy uwa�asz, �e posi�ki s� warte swojej ceny? ');Read(f);
   Until (f>=1)and(f<=4);
   Sumaf:=Sumaf+f;
   Liczbaf:=Liczbaf+1;
      
   Writeln;
   Repeat   
   Write('7. Czy Twoim zdaniem posi�ki s� smaczne? ');Read(g);
   Until (g>=1)and(g<=4);
   Sumag:=Sumag+g;
   Liczbag:=Liczbag+1;   
   
   Writeln;
   Repeat   
   Write('8. Czy menu jest wystarczaj�co zr�nicowane? ');Read(h);
   Until (h>=1)and(h<=4);
   Sumah:=Sumah+h;
   Liczbah:=Liczbah+1;
   
   Writeln;
   Repeat   
   Write('9. Czy uwa�asz, �e jedzenie jest �wie�e? ');Read(i);
   Until (i>=1)and(i<=4);
   Sumai:=Sumai+i;
   Liczbai:=Liczbai+1;
   
   Writeln;
   Repeat 
   Write('10. Czy posi�ki, kt�re spo�ywasz s� ciep�e? ');Read(j);
   Until (j>=1)and(j<=4);
   Sumaj:=Sumaj+j;
   Liczbaj:=Liczbaj+1;   
   
   Writeln;
   Repeat 
   Write('11. Czy wielko�� porcji jest zadowalaj�ca? ');Read(k);
   Until (k>=1)and(k<=4);
   Sumak:=Sumak+k;
   Liczbak:=Liczbak+1;   

   Writeln;
   Repeat  
   Write('12. Czy ilo�� stolik�w jest wystarczaj�ca? ');Read(l);
   Until (l>=1)and(l<=4);
   Sumal:=Sumal+l;
   Liczbal:=Liczbal+1;
      
   Writeln;
   Repeat  
   Write('13. Czy jako�� obs�ugi jest zadowalaj�ca? ');Read(m);
   Until (m>=1)and(m<=4);
   Sumam:=Sumam+m;
   Liczbam:=Liczbam+1;  
    
   Writeln;
   Repeat  
   Write('14. Czy uwa�asz, �e powinno by� wi�cej da� wegetaria�skich? ');Read(n);
   Until (n>=1)and(n<=4);
   Suman:=Suman+n;
   Liczban:=Liczban+1;   
   
   Writeln;
   Repeat 
   Write('15. Czy skorzysta�(a)by� z karnet�w obiadowych w pobliskich restauracjach ? ');Read(o);
   Until (o>=1)and(o<=4);
   Sumao:=Sumao+o;
   Liczbao:=Liczbao+1;   

   Writeln;
   Repeat  
   Writeln('16. Jak cz�sto jadasz w bufecie?');
   Writeln('1 - w og�le lub prawie w og�le');
   Writeln('2 - od czasu do czasu');
   Writeln('3 - cz�sto');
   Writeln('4 - prawie codziennie lub codziennie');
   Write('Odpowied�: ');Read(r);
   Until (r>=1)and(r<=4);
   Sumar:=Sumar+r;
   Liczbar:=Liczbar+1;
   
   Writeln;
   Repeat  
   Writeln('17. Jak cz�sto bywasz w bufecie?');
   Writeln('1 - w og�le lub prawie w og�le');
   Writeln('2 - od czasu do czasu');
   Writeln('3 - cz�sto');
   Writeln('4 - prawie codziennie lub codziennie');
   Write('Odpowied�: ');Read(s);
   Until (s>=1)and(s<=4);
   Sumas:=Sumas+s;
   Liczbas:=Liczbas+1;
   Writeln;
   Writeln;
   Writeln('Dzi�kujemy za wype�nienie ankiety :)');
   Writeln('Prosz� powiadomi� osob� prowadz�c�.')
 end;

  
{-----------------------------------}
  
Procedure Wyniki;
 Begin
   Writeln;
   Writeln('*******************************************');
   Writeln('              WYNIKI');
   Writeln('Liczba os�b, kt�re wype�ni�y ankiet�: ',Liczbaa);
   Writeln('*******************************************');   
   Writeln('To s� �rednie wyniki odpowiedzi');
   Writeln('Pytanie 1.: ',Sumaa/Liczbaa);
   Writeln('Pytanie 2.: ',Sumab/Liczbab);
   Writeln('Pytanie 3.: ',Sumac/Liczbac);
   Writeln('Pytanie 4.: ',Sumad/Liczbad);
   Writeln('Pytanie 5.: ',Sumae/Liczbae);
   Writeln('Pytanie 6.: ',Sumaf/Liczbaf);
   Writeln('Pytanie 7.: ',Sumag/Liczbag);
   Writeln('Pytanie 8.: ',Sumah/Liczbah);
   Writeln('Pytanie 9.: ',Sumai/Liczbai);
   Writeln('Pytanie 10.: ',Sumaj/Liczbaj);
   Writeln('Pytanie 11.: ',Sumak/Liczbak);
   Writeln('Pytanie 12.: ',Sumal/Liczbal);
   Writeln('Pytanie 13.: ',Sumam/Liczbam);
   Writeln('Pytanie 14.: ',Suman/Liczban);
   Writeln('Pytanie 15.: ',Sumao/Liczbao);
   Writeln('Pytanie 16.: ',Sumar/Liczbar);
   Writeln('Pytanie 17.: ',Sumas/Liczbas);
   Writeln('*******************************************'); 
 end;  

{-----------------------------------} 

Procedure Zapisz;
  Begin
   Assign(Dok,'C:\wyniki.txt');
   Rewrite(Dok);
   Writeln(Dok,'*******************************************');
   Writeln(Dok,'              WYNIKI');
   Writeln(Dok,'Liczba os�b, kt�re wype�ni�y ankiet�: ',Liczbaa);
   Writeln(Dok,'*******************************************');   
   Writeln(Dok,'To s� �rednie wyniki odpowiedzi');
   Writeln(Dok,'Pytanie 1.: ',Sumaa/Liczbaa);
   Writeln(Dok,'Pytanie 2.: ',Sumab/Liczbab);
   Writeln(Dok,'Pytanie 3.: ',Sumac/Liczbac);
   Writeln(Dok,'Pytanie 4.: ',Sumad/Liczbad);
   Writeln(Dok,'Pytanie 5.: ',Sumae/Liczbae);
   Writeln(Dok,'Pytanie 6.: ',Sumaf/Liczbaf);
   Writeln(Dok,'Pytanie 7.: ',Sumag/Liczbag);
   Writeln(Dok,'Pytanie 8.: ',Sumah/Liczbah);
   Writeln(Dok,'Pytanie 9.: ',Sumai/Liczbai);
   Writeln(Dok,'Pytanie 10.: ',Sumaj/Liczbaj);
   Writeln(Dok,'Pytanie 11.: ',Sumak/Liczbak);
   Writeln(Dok,'Pytanie 12.: ',Sumal/Liczbal);
   Writeln(Dok,'Pytanie 13.: ',Sumam/Liczbam);
   Writeln(Dok,'Pytanie 14.: ',Suman/Liczban);
   Writeln(Dok,'Pytanie 15.: ',Sumao/Liczbao);
   Writeln(Dok,'Pytanie 16.: ',Sumar/Liczbar);
   Writeln(Dok,'Pytanie 17.: ',Sumas/Liczbas);
   Writeln(Dok,'*******************************************'); 
   Close(Dok);
   Writeln;
   Writeln('Koniec!');
  end;
{---------------------------------------}


Begin;
  Czyszczenie;
   Repeat
    Clear;
    Start;
    Pytania;
    Writeln;
      repeat
       Write('Podaj haslo cyfrowe: ');Read(t);
      until t=1410;
    Writeln('Has�o poprawne.');
    Writeln;
    Writeln('Czy chcesz przeprowadzic ankiete jeszcze raz?');
    Write('1-Tak, 2-Nie,poka� wyniki => '); read(p);
   Until p=2;
  Wyniki;
  Writeln('Czy chcesz zapisa� wyniki?');
  Write('1-Tak, 2-Nie => ');Read(u);
  if u=1 then Zapisz
  else Writeln('Koniec!');
End. 