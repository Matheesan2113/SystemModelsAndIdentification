close all
%load('tut1_dataset40.mat');
Ts = 0.05;
M = 100;
N = 1024; 

z = [y u];
zn = [yn u];

out = etfe(zn,M,N,Ts);
[mag, phase, wout] = bode(out);
figure,
bode(out);
magDb = 20*log10(mag);  

magnitude = zeros(1,1024);
for i=1:1024
    magnitude(1,i) = mag(:,:,i);
end 
    
 ph = zeros(1,1024);
for i=1:1024
    ph(1,i) = phase(:,:,i);
end   

x1=pi/(N*Ts);
x2=pi/Ts;
w = linspace(x1,x2,N);
out2=spa(zn,M,w,[],Ts);
figure,
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
semilogx(wout,magnitude); %blue
hold  on;
semilogx(wout,magnitude2);
hold off;

figure,
semilogx(wout,ph); %blue
hold on;
semilogx(wout,ph2); 
hold off;
