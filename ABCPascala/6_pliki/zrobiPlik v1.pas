Program UtwórzPlikDemo; 
Var 
   Dok: text; 
Begin 
  Assign(Dok,'plik.txt'); 
  Rewrite(Dok); 
  
  Writeln(Dok,'To tylko testowa zawartoœæ pliku');
  
  Close(Dok) 
end.
