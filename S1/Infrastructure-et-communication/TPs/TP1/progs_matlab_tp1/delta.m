function dlt=delta(x);
for i=1:length(x)
   if x(i)==0
      dlt(i)=1;
   else
      dlt(i)=0;
   end;
end;
