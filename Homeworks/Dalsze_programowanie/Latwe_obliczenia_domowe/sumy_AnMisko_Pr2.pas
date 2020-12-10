Program Pracadom2;



Var

  sdodat,sujem,war:real;

 
   z, l1,l1plus,l1minus:integer; 



Begin


  sdodat:=0;sujem:=0;l1plus:=0;l1minus:=0;


  WriteLn('Podaj iloœæ liczb któr¹ bêdziesz wprowadza³ ');


  ReadLn(l1);


  WriteLn('Podaj kolejno liczby w iloœci któr¹ definiowa³eœ wczeœniej ');


            For z:=1 to l1 do 

     Begin


          ReadLn(war);

    
          If war>-1 then sdodat:=sdodat+war;


          If war>-1 then l1plus:=l1plus+1;


          If war<0 then sujem:=sujem+war; 


          If war<0 then l1minus:=l1minus+1;

     


      end;


 
   WriteLn;

 WriteLn('Wprowadzi³eœ ',l1,' Wartoœci');

 WriteLn;

 WriteLn('W tym ',l1plus,' wartoœci dodatnich'); 

 WriteLn('Oraz ',l1minus,' wartoœci ujemnych');

 WriteLn;

 WriteLn('Suma wartoœci dodatnich ',sdodat,'');

 WriteLn('Suma wartoœci ujemnych ',sujem,''); 

 WriteLn;

 WriteLn('Œrednia Wartoœci dodatnich ',sdodat/l1,'');

 WriteLn('Œrednia Wartoœci ujemnych ',sujem/l1,''); 

 WriteLn;

 WriteLn('Kwadrat wartoœci dodatnich ',((sdodat/l1)*(sdodat/l1)),'');

 WriteLn('Kwadrat wartoœci ujemnych ',((sujem/l1)*(sujem/l1)),''); 

 WriteLn;

 WriteLn('Pierwiastek œredniej wartoœci ', (sqrt(sdodat/l1)),'');

  

end.