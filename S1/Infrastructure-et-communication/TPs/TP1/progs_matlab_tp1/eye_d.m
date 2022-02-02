function wvp=eye_d(w,b,st);

wy=real(w);
Tb=1;
sw=st*Tb;
Rb=1;
n=length(b);
T0=n/Rb;
dt=0.05;
t = 0:dt:sw;
m=length(t);
m1=index(t,Tb);
if st==2
   mp=index(t,Tb/2);
for k=0:n-3
   for j=1:m
      we(j)=wy(mp+j-1+(m-1)*k/2);
   end;
   
    plot(t,we);
      hold on
   end;
   
end;
if st==3
   mp=index(t,Tb);
for k=0:n-3
   for j=1:m
      we(j)=wy(j+(mp-1)*k);
   end;
   
    plot(t,we);
      hold on
   end;
end;

   xlabel('Time');
   title('Eye pattern');
    grid;
  hold off
