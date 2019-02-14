load ('k200.dat', '-ascii');
close all;

Ts=0.002;
t = k200(:,1);
input = k200(:,2);
output = k200(:,3);
figure,
plot(t,output, t, input, '--');

data = iddata(output, input,Ts);
OEModel = oe(data,[3,3,1]);
figure,
compare(data,OEModel,'--');
print -depsc compare3rdOrder

continuousOEModel = d2c(OEModel);
present(OEModel);
present(continuousOEModel);

figure,
resid(OEModel,data);
res = get(resid(OEModel,data), 'y');
print -depsc resid3rdOrder
figure,
[S, x] = chisq(50, res, input);
axis([ 0 50 -0.3 0.3]);
print -depsc chaiCC3rdOrder
S
x

%%
load ('k200.dat', '-ascii');
close all;

Ts=0.002;
t = k200(:,1);
input = k200(:,2);
output = k200(:,3);
data = iddata(output, input,Ts);
OEModel = oe(data,[2,2,1]);
figure,
compare(data,OEModel,'--');
print -depsc compare2ndOrder

continuousOEModel = d2c(OEModel);
present(OEModel);
present(continuousOEModel);

figure,
resid(OEModel,data);
res = get(resid(OEModel,data), 'y');
print -depsc resid2ndOrder

figure,
[S, x] = chisq(50, res, input);
axis([ 0 50 -0.5 0.5]);
print -depsc chaiCC2ndOrder

S
x


%%
close all;
load ('k1.dat', '-ascii');

Ts=0.002;
t = k1(:,1);
input = k1(:,2);
output = k1(:,3);
mean(output)

load ('k5.dat', '-ascii');

Ts=0.002;
t = k5(:,1);
u = k5(:,2);
y = k5(:,3);
DC= 0.0708;
y=y-DC;
y=vector(y,'column');
u=vector(u,'column');
data= iddata(y,u,Ts);
figure,
idplot(data);

M = 200;
N = 2048; 

z = [y u];
outClean = etfe(z,M,N,Ts);
figure,
bode(outClean);
grid on;
[mag, phase, wout] = bode(outClean);
magnitude = zeros(1,2048);
for i=1:2048
    magnitude(1,i) =20*log10( mag(:,:,i));
end 
 ph = zeros(1,2048);
for i=1:2048
    ph(1,i) = phase(:,:,i);
end   
figure,
semilogx(wout,magnitude);
axis([ 0 300 -80 0]);
xlabel('Frequency(rad/s)');
ylabel('Amplitude(dB)');
grid on;
print -depsc bodeTut4

figure,
semilogx(wout,ph);
axis([ 0 300 -200 0]);
xlabel('Frequency(rad/s)');
ylabel('Phase(degrees)');
grid on;
print -depsc bodeTut4Phase

figure,
[wi]= cra(data,30);
print -depsc delayTut4

figure,
[wi]= cra(data,200);
print -depsc impulseTut4


figure,
sdet = hanktest(wi);
print -depsc hankTestTut4


%%
load ('k200.dat', '-ascii');
close all;

Ts=0.002;
t = k200(:,1);
input = k200(:,2);
output = k200(:,3);
DC= 0.0708;
output=output-DC;
figure,
plot(t,output, t, input, '--');

data = iddata(output, input,Ts);
OEModel = oe(data,[3,3,1]);
figure,
compare(data,OEModel);

figure,
resid(OEModel,data);
res = get(resid(OEModel,data), 'y');
figure,
[S, x] = chisq(50, res, input);
S
x

figure,
b=acorrf(res,50);
axis([ 0 50 -0.2 1.2]);
print -depsc autoThird

figure,
b2=pacorrf(res,50,1);
axis([ 0 50 -0.1 0.1]);
print -depsc partialThird

Mbj = bj(data,[3 3 3 3 1]);
figure,
compare(data,Mbj,'--');
print -depsc MBJTut4
MBj2= d2c(Mbj);
present(MBj2);
present(Mbj);
figure,
resid(Mbj,data);
print -depsc BJResid

residues= resid(Mbj,data);
res=get(residues,'y');

figure,
[S, x]= chisq(40,res);
axis([ 0 40 -0.2 1.2]);
print -depsc BJchai1

S
x
figure,
[S, x]= chisq(40,res,input);
axis([ 0 40 -0.1 0.1]);
print -depsc MBJChai2

S
x
%% 2nd order
load ('k200.dat', '-ascii');
close all;

Ts=0.002;
t = k200(:,1);
input = k200(:,2);
output = k200(:,3);
DC= 0.0708;
output=output-DC;
figure,
plot(t,output, t, input, '--');

data = iddata(output, input,Ts);
OEModel = oe(data,[2,2,1]);
figure,
compare(data,OEModel);

figure,
resid(OEModel,data);
res = get(resid(OEModel,data), 'y');
figure,
[S, x] = chisq(50, res, input);
S
x

figure,
b=acorrf(res,50,1);
axis([ 0 50 -0.2 1.2]);
print -depsc auto2nd

figure,
b2=pacorrf(res,50,1);
axis([ 0 50 -0.4 1]);
print -depsc partial2nd


Mbj = bj(data,[2 2 2 2 1]);
figure,
compare(data,Mbj);
print -depsc BJ2nd

present(Mbj);
figure,
resid(Mbj,data);
print -depsc Bj2ndResid

residues= resid(Mbj,data);
res=get(residues,'y');

figure,
[S, x]= chisq(40,res);
axis([ 0 40 -0.2 1.2]);
print -depsc Bj2ndChai1

S
x
figure,
[S, x]= chisq(40,res,input);
axis([ 0 40 -0.1 0.1]);
print -depsc Bj2ndChai2

S
x



