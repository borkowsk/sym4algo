Program Pracadom2;



Var

  sdodat,sujem,war:real;

 
   z, l1,l1plus,l1minus:integer; 



Begin


  sdodat:=0;sujem:=0;l1plus:=0;l1minus:=0;


  WriteLn('Podaj ilo�� liczb kt�r� b�dziesz wprowadza� ');


  ReadLn(l1);


  WriteLn('Podaj kolejno liczby w ilo�ci kt�r� definiowa�e� wcze�niej ');


            For z:=1 to l1 do 

     Begin


          ReadLn(war);

    
          If war>-1 then sdodat:=sdodat+war;


          If war>-1 then l1plus:=l1plus+1;


          If war<0 then sujem:=sujem+war; 


          If war<0 then l1minus:=l1minus+1;

     


      end;


 
   WriteLn;

 WriteLn('Wprowadzi�e� ',l1,' Warto�ci');

 WriteLn;

 WriteLn('W tym ',l1plus,' warto�ci dodatnich'); 

 WriteLn('Oraz ',l1minus,' warto�ci ujemnych');

 WriteLn;

 WriteLn('Suma warto�ci dodatnich ',sdodat,'');

 WriteLn('Suma warto�ci ujemnych ',sujem,''); 

 WriteLn;

 WriteLn('�rednia Warto�ci dodatnich ',sdodat/l1,'');

 WriteLn('�rednia Warto�ci ujemnych ',sujem/l1,''); 

 WriteLn;

 WriteLn('Kwadrat warto�ci dodatnich ',((sdodat/l1)*(sdodat/l1)),'');

 WriteLn('Kwadrat warto�ci ujemnych ',((sujem/l1)*(sujem/l1)),''); 

 WriteLn;

 WriteLn('Pierwiastek �redniej warto�ci ', (sqrt(sdodat/l1)),'');

  

end.