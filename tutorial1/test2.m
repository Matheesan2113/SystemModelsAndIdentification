%% Section 3
close all;
load('C:\Users\Hammad\AppData\Local\Temp\temp3332649274407500917tmp\tut1_dataset40.mat');

%% Part 1 
% Clean Data

Ts = 0.05;
M = 100;
N = 2048; 

z = [y u];

out = etfe(z,M,N,Ts);
[mag, phase, wout] = bode(out);

magDb = 20*log10(mag);  

mgn(1,:) = mag(:,:, 1:2048);
p(1,:) = phase(:,:, 1:2048);  

x1=pi/(N*Ts);
x2=pi/Ts;
w = linspace(x1,x2,N);
out2=spa(z,M,w,[],Ts);

[mag, phase, wout] = bode(out2);  

mgn2(1,:) = mag(:,:, 1:2048);
p2(1,:) = phase(:,:, 1:2048);  

figure,
semilogx(wout,mgn);
hold on;
semilogx(wout,mgn2, 'linestyle', ':');
hold off;
grid on;

figure,
semilogx(wout,p2);
hold on;
semilogx(wout,p2, 'linestyle', ':');
hold off;
grid on;
xlim ([0.05 10]);
ylim ([-250 50]);

figure,
bode(out);
hold on;
bode(out2);
hold off;

% Noisy Data
zn = [yn u];
out3 = etfe(zn,M,N,Ts);
[mag, phase, wout] = bode(out3);  

mgn3(1,:) = mag(:,:, 1:2048);
p3(1,:) = phase(:,:, 1:2048);

x1=pi/(N*Ts);
x2=pi/Ts;
w = linspace(x1,x2,N);
out4=spa(zn,M,w,[],Ts);

[mag, phase, wout] = bode(out4);

mgn4(1,:) = mag(:,:, 1:2048);
p4(1,:) = phase(:,:, 1:2048);

figure,
semilogx(wout,mgn3);
hold on;
semilogx(wout,mgn4, 'linestyle', ':');
hold off;
grid on;
xlim ([0 55]);
ylim ([-1.5 4]);

figure,
semilogx(wout,p3);
hold on;
semilogx(wout,p4, 'linestyle', ':');
hold off;
grid on;
xlim([0 10]);
ylim([-250 50]);

figure,
bode(out3);
hold on;
bode(out4,'m:');
hold off;

%% Part 2
% Clean Data
DATA= iddata(y,u,Ts);
SYS = oe(DATA,[2 2 1]);
SC = d2c(SYS);
present(SYS);
present(SC);

figure,
compare(DATA,SYS,[]);
figure,
pzplot(SC);
xlim ([-6 6]);
ylim([-6 6]);

% Noisy Data
DATAn= iddata(yn,u,Ts);
SYSn = oe(DATAn,[2 2 1]);
SCn = d2c(SYSn);
present(SYSn);
present(SCn);

figure,
compare(DATAn,SYSn,':');
figure,
pzplot(SCn);
xlim([-2000 12000]);
ylim([-6 6]);

Gs = tf(14.1,[1, 1.569, 15.89]);
simpModel = c2d(Gs,Ts);
sSimple = idpoly(simpModel);
figure,
compare(DATA,sSimple,'', SYSn,'');

%% Part 3

Gs2= tf([14.4], [1, 1.72, 16.7]);

[mag, phase, wout] = bode(Gs2, wout);  

mgn5 (1,:) = mag(:,:,1:2048);
p5 (1,:) = phase(:,:,1:2048);

figure,
semilogx(wout,mgn2);
hold on;
semilogx(wout,mgn5, 'linestyle', ':');
hold off;
grid on;
xlim([0 50]);
ylim([-0.5 3]);

figure,
semilogx(wout,p2);
hold on;
semilogx(wout,p5, 'linestyle', ':');
hold off;
grid on;
xlim([0 50]);
ylim([-250 50]);

oeMod = sys;
conventional = c2d(Gs2,Ts);
conventionalSys = idpoly(conventional);
figure,
compare(DATA,conventional, oeMod);