close all
%load('tut1_dataset40.mat')150/2048;
Ts = 0.05;
M = 100;
N = 1024; 

z = [y u];
zn = [yn u];

out = etfe(z,M,N,Ts);
[mag, phase, wout] = bode(out);

%bode(out);
magDb = 20*log10(mag);  

magnitude = zeros(1,1024);
for i=1:1024
    magnitude(1,i) = mag(:,:,i);
end 
    
 ph = zeros(1,1024);
for i=1:1024
    ph(1,i) = phase(:,:,i);
end 

figure,
semilogx(wout,magnitude);
figure,
semilogx(wout,ph);

x1=pi/(N*Ts);
x2=pi/Ts;
w = linspace(x1,x2,N);
out2=spa(z,M,w,[],Ts);
bode(out);
hold on;
bode(out2);

[mag, phase, wout] = bode(out2);
magDb = 20*log10(mag);  

magnitude2 = zeros(1,1024);
for i=1:1024
    magnitude2(1,i) = mag(:,:,i);
end 
    
 ph2 = zeros(1,1024);
for i=1:1024
    ph2(1,i) = phase(:,:,i);
end

figure,
semilogx(wout,magnitude2);
figure,
semilogx(wout,ph2);
