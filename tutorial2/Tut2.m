load('C:\Users\Hammad\Documents\Hammad Documents\ELE 829 MATLAB Year 4\tutorial2\Tutorial2datasets\tut2_dataset35.mat');
close all;
Ts= 0.05;

z = [y u];
zn = [yn u];
[w]= impweigh(u,y);

print -depsc impeighClean

figure,
cra(z,60);
print -depsc craClean

figure,
ziddata = iddata(y, u, Ts);
[wi]= correl(ziddata,60,1);
print -depsc correlClean

figure,
recov = decresp(w,u);
figure,
recover = decresp(wi,u);
axis([0 300 -25 25]);
print -depsc stepWeights

figure,
convdet = hanktest(w);
print -depsc hankConvClean
figure,
sdet = hanktest(wi);
print -depsc hankClean

figure,
[wn]= impweigh(u,yn);
print -depsc impweighNoisy

figure,
cra(zn,60);
print -depsc craNoisy
figure,
zniddata = iddata(y, u, Ts);
[wni]= correl(zniddata,60,1);
print -depsc correlNoisy

figure,
convdet = hanktest(wn);
print -depsc hankConvNoisy
figure,
sdet = hanktest(wni);
print -depsc hankNoisy

%% Part 2

dataClean= iddata(y,u,Ts);
OEModelClean = oe(dataClean,[2 2 17]);
continuousOEModelClean = d2c(OEModelClean);

figure,
step(continuousOEModelClean);
present(OEModelClean);
present(continuousOEModelClean);

figure,
compare(dataClean,OEModelClean,'--');
axis([0 20 -25 25]);
print -depsc OEModelClean

figure,
pzplot(OEModelClean);
print -depsc pzPlotCleanDisc

figure,
pzplot(continuousOEModelClean);
axis([-2 2 -6 6]);
print -depsc pzPlotCleanCont



dataNoisy= iddata(yn,u,Ts);
OEModelNoisy = oe(dataNoisy,[2 2 17]);
continuousOEModelNoisy = d2c(OEModelNoisy);
present(OEModelNoisy);
present(continuousOEModelNoisy);

figure,
compare(dataNoisy,OEModelNoisy,'--');
axis([0 20 -25 25]);
print -depsc oeModelNoisy

figure,
pzplot(OEModelNoisy);
print -depsc pzPlotNoisyDisc

figure,
pzplot(continuousOEModelNoisy);
axis([-2 2 -6 6]);
print -depsc pzPlotNoisyCont


%% 
G= tf([21 21],[1 1.7 25]);
step(G);
figure,
stepeval(G,20);
