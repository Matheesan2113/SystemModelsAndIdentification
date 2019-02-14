%% Section 3
close all;
load('C:\Users\Hammad\Documents\Hammad Documents\ELE 829 MATLAB Year 4\tutorial2\Tutorial2datasets\tut2_dataset35.mat');

%% Part 1 

% Clean Data

Ts = 0.05;
PLOT = 1; 

z = [y u];
zn = [yn u];

[w] = impweigh(u,y,PLOT);

figure,
cra(z,60);

figure,
m = iddata(y, u, Ts);
[wi]= correl(m,60,1);

figure,
recoverImp = decresp(w,u);

figure,
recoverCorrel = decresp(wi,u);
xlim ([0 300]);
ylim ([-25 25]);

figure,
deconv = hanktest(w);
figure,
corr = hanktest(wi);

% Noisy Data

figure,
[wn]= impweigh(u,yn);

figure,
cra(zn,60);

figure,
m2 = iddata(y, u, Ts);
[wni]= correl(m2,60,1);

figure,
deconv = hanktest(wn);
figure,
corr = hanktest(wni);

%% Part 2

% Clean Data
cleanData= iddata(y,u,Ts);
cleanDiscOE = oe(cleanData,[2 2 17]);
cleanContOE = d2c(cleanDiscOE);

figure,
step(cleanContOE);
present(cleanDiscOE);
present(cleanContOE);

figure,
compare(cleanData,cleanDiscOE,'--');
xlim ([0 20]);
ylim ([-25 25]);

figure,
pzplot(cleanDiscOE);

figure,
pzplot(cleanContOE);
xlim ([-2 2]);
ylim ([-6 6]);

% Noisy Data

noisyData = iddata(yn,u,Ts);
noisyDiscOE = oe(noisyData,[2 2 17]);
noisyContOE = d2c(noisyDiscOE);

present(noisyDiscOE);
present(noisyContOE);

figure,
compare(noisyData,noisyDiscOE,'--');
xlim ([0 20]);
ylim ([-25 25]);

figure,
pzplot(noisyDiscOE);

figure,
pzplot(noisyContOE);
xlim ([-2 2]);
ylim ([-6 6]);

%% Part 3
Gs = tf([21 21],[1 1.7 25]);

figure,
[PO,tp,tr19,tr01,ts5,ts2,ess,wd,tring]=stepeval(Gs,10); 


