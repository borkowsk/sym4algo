Program Utw�rzPlikDemo; 
Var 
   Dok: text; 
Begin 
  Assign(Dok,'plik.txt'); 
  Rewrite(Dok); 
  
  Writeln(Dok,'To tylko testowa zawarto�� pliku');
  
  Close(Dok) 
end.
