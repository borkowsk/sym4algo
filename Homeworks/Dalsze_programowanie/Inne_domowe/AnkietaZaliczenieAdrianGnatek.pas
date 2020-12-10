Program Zaliczeniowy;

{Adrian Gnatek}

{Jest to elektroniczna ankieta- narzêdzie socjologa.
Treœæ ankiety zosta³a sporz¹dzona przez Micha³a Haruki 
Yamazaki,a sama ankieta zosta³a przeprowadzona na terenie 
SWPS w okresie 29 Maja 2006 - 5 Czerwca 2006.}

{W wyborze tematu do napisania kierowa³em siê
przede wszystkim u¿ytecznoœci¹. Wybra³em napisanie programu
-ankiety, poniewa¿ miewam okazjê "rêcznie" liczyæ œrednie 
z setek ankiet. Dziêki temu narzêdziu mo¿na wiêc oszczêdziæ
naprawdê sporo czasu.}

{Korzystaj¹c z okazji dziêkujê za bardzo mi³y kurs. Muszê
przyznaæ, ¿e liczê na kontynuacjê. Pozdrawiam.}
  
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
{Ta procedura czyœci pamiêæ przy pierwszym
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
  Writeln('Serdecznie dziêkujemy za udzia³ w ankiecie'); 
  Writeln('maj¹cej na celu zbadanie stosunku studentów');
  Writeln('do nowo otwartego bufetu w naszej szkole.');
  Writeln('Nastêpnie, jako Samorz¹d SWPS, mamy zamiar');
  Writeln('przekazaæ Wasze opinie w³aœcicielowi tego¿');
  Writeln('bufetu i postaraæ siê wystosowaæ ewentualne');
  Writeln('postulaty, które pojawi¹ siê w toku badania.');
  Writeln;
  Writeln('********************************************');
  Writeln('Proszê wybraæ odpowiedni¹ odpowiedŸ na skali:');
  Writeln('1 - zdecydowanie nie, 2 - raczej nie');
  Writeln('3 - raczej tak, 4 - zdecydowanie tak');
  Writeln('********************************************');   
 end;

 
{----------------------------------------}
 {Kombinowa³em na ró¿ne sposoby, jakby tê procedurê
 uproœciæ, ale to rozwi¹zanie wydaje mi siê najbardziej
  'stabilne'}
   
Procedure Pytania;
 
 Begin
   Writeln;
   Repeat
   Write('1. Czy uwa¿asz, ¿e w bufecie jest czysto? ');Read(a);
   Until (a>=1)and(a<=4); 
   Sumaa:=Sumaa+a;
   Liczbaa:=Liczbaa+1;
   
   Writeln;
   Repeat
   Write('2. Czy uwa¿asz, ¿e w bufecie panuje przyjemny zapach? ');Read(b);
   Until (b>=1)and(b<=4);
   Sumab:=Sumab+b;
   Liczbab:=Liczbab+1;
   
   Writeln;
   Repeat   
   Write('3. Czy podoba Ci siê atmosfera w bufecie? ');Read(c);
   Until (c>=1)and(c<=4);
   Sumac:=Sumac+c;
   Liczbac:=Liczbac+1;
      
   Writeln;
   Repeat   
   Write('4. Czy podoba Ci siê wystrój bufetu? ');Read(d);
   Until (d>=1)and(d<=4);
   Sumad:=Sumad+d;
   Liczbad:=Liczbad+1;   
   
   Writeln;
   Repeat   
   Write('5. Czy uwa¿asz, ¿e g³oœnoœæ muzyki w bufecie jest odpowiednia? ');Read(e);
   Until (e>=1)and(e<=4);
   Sumae:=Sumae+e;
   Liczbae:=Liczbae+1;   
   
   Writeln;
   Repeat   
   Write('6. Czy uwa¿asz, ¿e posi³ki s¹ warte swojej ceny? ');Read(f);
   Until (f>=1)and(f<=4);
   Sumaf:=Sumaf+f;
   Liczbaf:=Liczbaf+1;
      
   Writeln;
   Repeat   
   Write('7. Czy Twoim zdaniem posi³ki s¹ smaczne? ');Read(g);
   Until (g>=1)and(g<=4);
   Sumag:=Sumag+g;
   Liczbag:=Liczbag+1;   
   
   Writeln;
   Repeat   
   Write('8. Czy menu jest wystarczaj¹co zró¿nicowane? ');Read(h);
   Until (h>=1)and(h<=4);
   Sumah:=Sumah+h;
   Liczbah:=Liczbah+1;
   
   Writeln;
   Repeat   
   Write('9. Czy uwa¿asz, ¿e jedzenie jest œwie¿e? ');Read(i);
   Until (i>=1)and(i<=4);
   Sumai:=Sumai+i;
   Liczbai:=Liczbai+1;
   
   Writeln;
   Repeat 
   Write('10. Czy posi³ki, które spo¿ywasz s¹ ciep³e? ');Read(j);
   Until (j>=1)and(j<=4);
   Sumaj:=Sumaj+j;
   Liczbaj:=Liczbaj+1;   
   
   Writeln;
   Repeat 
   Write('11. Czy wielkoœæ porcji jest zadowalaj¹ca? ');Read(k);
   Until (k>=1)and(k<=4);
   Sumak:=Sumak+k;
   Liczbak:=Liczbak+1;   

   Writeln;
   Repeat  
   Write('12. Czy iloœæ stolików jest wystarczaj¹ca? ');Read(l);
   Until (l>=1)and(l<=4);
   Sumal:=Sumal+l;
   Liczbal:=Liczbal+1;
      
   Writeln;
   Repeat  
   Write('13. Czy jakoœæ obs³ugi jest zadowalaj¹ca? ');Read(m);
   Until (m>=1)and(m<=4);
   Sumam:=Sumam+m;
   Liczbam:=Liczbam+1;  
    
   Writeln;
   Repeat  
   Write('14. Czy uwa¿asz, ¿e powinno byæ wiêcej dañ wegetariañskich? ');Read(n);
   Until (n>=1)and(n<=4);
   Suman:=Suman+n;
   Liczban:=Liczban+1;   
   
   Writeln;
   Repeat 
   Write('15. Czy skorzysta³(a)byœ z karnetów obiadowych w pobliskich restauracjach ? ');Read(o);
   Until (o>=1)and(o<=4);
   Sumao:=Sumao+o;
   Liczbao:=Liczbao+1;   

   Writeln;
   Repeat  
   Writeln('16. Jak czêsto jadasz w bufecie?');
   Writeln('1 - w ogóle lub prawie w ogóle');
   Writeln('2 - od czasu do czasu');
   Writeln('3 - czêsto');
   Writeln('4 - prawie codziennie lub codziennie');
   Write('OdpowiedŸ: ');Read(r);
   Until (r>=1)and(r<=4);
   Sumar:=Sumar+r;
   Liczbar:=Liczbar+1;
   
   Writeln;
   Repeat  
   Writeln('17. Jak czêsto bywasz w bufecie?');
   Writeln('1 - w ogóle lub prawie w ogóle');
   Writeln('2 - od czasu do czasu');
   Writeln('3 - czêsto');
   Writeln('4 - prawie codziennie lub codziennie');
   Write('OdpowiedŸ: ');Read(s);
   Until (s>=1)and(s<=4);
   Sumas:=Sumas+s;
   Liczbas:=Liczbas+1;
   Writeln;
   Writeln;
   Writeln('Dziêkujemy za wype³nienie ankiety :)');
   Writeln('Proszê powiadomiæ osobê prowadz¹c¹.')
 end;

  
{-----------------------------------}
  
Procedure Wyniki;
 Begin
   Writeln;
   Writeln('*******************************************');
   Writeln('              WYNIKI');
   Writeln('Liczba osób, które wype³ni³y ankietê: ',Liczbaa);
   Writeln('*******************************************');   
   Writeln('To s¹ œrednie wyniki odpowiedzi');
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
   Writeln(Dok,'Liczba osób, które wype³ni³y ankietê: ',Liczbaa);
   Writeln(Dok,'*******************************************');   
   Writeln(Dok,'To s¹ œrednie wyniki odpowiedzi');
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
    Writeln('Has³o poprawne.');
    Writeln;
    Writeln('Czy chcesz przeprowadzic ankiete jeszcze raz?');
    Write('1-Tak, 2-Nie,poka¿ wyniki => '); read(p);
   Until p=2;
  Wyniki;
  Writeln('Czy chcesz zapisaæ wyniki?');
  Write('1-Tak, 2-Nie => ');Read(u);
  if u=1 then Zapisz
  else Writeln('Koniec!');
End. 