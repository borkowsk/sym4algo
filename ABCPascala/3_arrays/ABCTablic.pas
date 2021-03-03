Program ABCTablic; 

Type 
   MojaTablica=array[1..10] of real; 
var 
   TabA,TabB:MojaTablica; 

Begin 
  TabA[1]:=10; {Przypisanie wartoœci elementu} 
  TabB:=TabA;   {Przypisanie ca³ej tablicy – mo¿e wymagaæ ¿eby tablice by³y zadeklarowane za pomoc¹ tego samego typu tablicowego a nie jak powy¿ej} 
  Writeln(TabB[1]); {Pobranie i wydrukowanie wartoœci elementu} 
End.
