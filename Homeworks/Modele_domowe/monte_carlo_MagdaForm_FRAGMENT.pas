procedure zrób_montecarlo_po_torusie; 
{W³a?ciwy krok modelu w stylu Monte-Carlo}  
var 
   monte,w,h,i,j,k,l:integer; 
srednia:real;
S:integer;
begin 
  for monte:=1 to Last do 
    begin 
      S:=random(last); 
h:=nindeks1(s,last);
j:=nindeks1(s+1,last);
i:=nindeks1(s+2,last);
k:=nindeks1(s+3,last);
l:=nindeks1(s+4,last);

 srednia:=(Swiat[h]*a+Swiat[i]+Swiat[j]+Swiat[k]+Swiat[l]*a)/5; 
      if(srednia<0.3) then 
        swiat[j]:=0 
      else 
        if (srednia>0.3) and (srednia<0.6)then 
          swiat[j]:=1 
        else 
          if (srednia>0.6) and (srednia<0.9)then 
            swiat[j]:=2 
          else 
            if (srednia>0.9) and (srednia<1.2)then 
              swiat[j]:=0 
            else 
              if (srednia>1.2) and (srednia<1.5)then 
                swiat[j]:=1 
              else 
                if (srednia>1.5) and (srednia<1.8)then 
                  swiat[j]:=2 
                else 
                  swiat[j]:=1 

  
    end; 
end; 