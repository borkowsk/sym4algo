


Program pacha;
                       const
                       prawdopodo=0.5;
                       obroty=23;




                       var
                       zmienna: integer;
                      


Begin 

for zmienna:=0 to obroty do 
  begin
  if random<=prawdopodo then write ('0')
  else write ('1');
  end;



end.