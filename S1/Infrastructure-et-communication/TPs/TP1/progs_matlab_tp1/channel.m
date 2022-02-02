function wfil=channel(b,lcn,G,Pn,Bwth);
%Rb is set to 1
Rb=1;
nb=length(b);
T0=nb/Rb;
Ts=1/Rb;
tdur=Ts;
dt=0.05;
t = 0:dt:T0;
T=T0;
N=length(t);
n = 0:1:N-1;
M=N/2;
w=wave_gen(b,lcn,1);
% Noise generation
lg=length(w);
a=sqrt(12*Pn)/2;
nz=sqrt(Pn)*randn(lg,1);


% Calculating FFT
W = dt*fft(w);
f = n/T;
% Calculating position of 4th NULL
pos = index(f,4/tdur);

% Calculating filtered waveform
% foff sets filter cutoff frequency
%
foff = Bwth/tdur;
%
Wfil = W;
for (i = 1:1:length(Wfil))
  if ((f(i) >= foff) & (f(i) <= ((1/dt) - foff)) )
     Wfil(i) = 0;
  end;
end;
wfil = G*((1/dt)*ifft(Wfil)+nz);

plot(t,real(wfil));
xlabel('Time x Tb');
ylabel('y(t)');
title('Output Waveform');
grid;
