%% Section 3
close all;
load('C:\Users\Hammad\Documents\Hammad Documents\ELE 829 MATLAB Year 4\tutorial3\tut3_data38.mat');

%% Noise 1
figure,
idplot(noise1);

n1=noise1.y;

figure,
[out1noise1] = acorrf(n1,20);

figure,
[out2noise1]=pacorrf(n1,20);

Model1=ar(n1,1);

figure,
resid(Model1,noise1);

res1=resid(Model1,noise1);
res1Seq=res1.y;
chisq(40,res1Seq)

%% Noise 2
figure,
idplot(noise2);

n2=noise2.y;

figure,
[out1noise2] = acorrf(n2,20);

figure,
[out2noise2]=pacorrf(n2,20);

Model2=ar(n2,2);

figure,
resid(Model2,data3);

res2=resid(Model2,data3);
res2Seq=res2.y;
chisq(40,res2Seq)
%% Noise 3
figure,
idplot(noise3);

n3=noise3.y;

figure,
[out1noise3] = acorrf(n3,20);

figure,
[out2noise3]=pacorrf(n3,20);

Model3=armax(n3,[0 1]);

figure,
resid(Model3,noise3);

res3=resid(Model3,noise3);
res3Seq=res3.y;
chisq(40,res3Seq)

%% Noise 4
figure,
idplot(noise4);

n4=noise4.y;

figure,
[out1noise4] = acorrf(n4,20);

figure,
[out2noise4]=pacorrf(n4,20);

Model4=armax(n4,[1 1]);

figure,
resid(Model4,noise4);

res4=resid(Model4,noise4);
res4Seq=res4.y;
chisq(40,res4Seq)

%% Noise 5
figure,
idplot(noise5);

n5=noise5.y;

figure,
[out1noise5] = acorrf(n5,20);

figure,
[out2noise5]=pacorrf(n5,20);

Model5=ar(n5,1);

figure,
resid(Model5,noise5);

res5=resid(Model5,noise5);
res5Seq=res2.y;
chisq(40,res5Seq)
