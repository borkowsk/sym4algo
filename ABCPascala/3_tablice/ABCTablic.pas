Program ABCTablic; 

Type 
   MojaTablica=array[1..10] of real; 
var 
   TabA,TabB:MojaTablica; 

Begin 
  TabA[1]:=10; {Przypisanie warto�ci elementu} 
  TabB:=TabA;   {Przypisanie ca�ej tablicy � mo�e wymaga� �eby tablice by�y zadeklarowane za pomoc� tego samego typu tablicowego a nie jak powy�ej} 
  Writeln(TabB[1]); {Pobranie i wydrukowanie warto�ci elementu} 
End.
