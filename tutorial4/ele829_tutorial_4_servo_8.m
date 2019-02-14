close all;
load ('k200.dat', '-ascii');

Ts=0.002;
t = k200(:,1);
in = k200(:,2);
out = k200(:,3);
figure,
plot(t,out, t, in, '--');

data = iddata(out, in, Ts);
oeModel = oe(data,[3,3,1]);
figure,
compare(data,oeModel,'--');

contOEModel = d2c(oeModel);
present(oeModel);
present(contOEModel);

figure,
resid(oeModel,data);
res = get(resid(oeModel,data), 'y');
figure,
[S, x] = chisq(40, res, in);
axis([ 0 50 -0.5 0.5]);

load ('k200.dat', '-ascii');

data = iddata(out, in,Ts);
oeModel = oe(data,[2,2,1]);
figure,
compare(data,oeModel,'--');

contOEModel = d2c(oeModel);
present(oeModel);
present(contOEModel);

figure,
resid(oeModel,data);
res = get(resid(oeModel,data), 'y');

figure,
[S, x] = chisq(40, res, in);
axis([ 0 50 -0.5 0.5]);

%%
load ('k1.dat', '-ascii');
close all;

Ts=0.002;
t = k1(:,1);
in = k1(:,2);
out = k1(:,3);
mean(out)

load ('k5.dat', '-ascii');

Ts=0.002;
t = k5(:,1);
u = k5(:,2);
y = k5(:,3);
DC= 0.07;
y=y-DC;
y=vector(y,'column');
u=vector(u,'column');
data= iddata(y,u,Ts);
figure,
idplot(data);

M = 200;
N = 2048; 

z = [y u];
out2 = etfe(z,M,N,Ts);
figure,
bode(out2);
[mag, phase, wout] = bode(out2);
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

figure,
semilogx(wout,ph);
axis([ 0 300 -200 0]);

figure,
[wi]= cra(data,20);

figure,
[wi]= cra(data,150);

figure,
sdet = hanktest(wi);

%%
close all;
load ('k200.dat', '-ascii');

Ts=0.002;
t = k200(:,1);
in = k200(:,2);
out = k200(:,3);
DC= 0.07;
out=out-DC;
figure,
plot(t,out, t, in, '--');

data = iddata(out, in,Ts);
oeModel = oe(data,[3,3,1]);
figure,
compare(data,oeModel);

figure,
resid(oeModel,data);
res = get(resid(oeModel,data), 'y');
figure,
[S, x] = chisq(40, res, in);

figure,
b=acorrf(res,40);
axis([ 0 50 -0.2 1.2]);

figure,
b2=pacorrf(res,50,1);
axis([ 0 50 -0.1 0.1]);

Mbj = bj(data,[3 3 3 3 1]);
figure,
compare(data,Mbj,'--');
MBj2= d2c(Mbj);
present(MBj2);
present(Mbj);
figure,
resid(Mbj,data);

residues= resid(Mbj,data);
res=get(residues,'y');

figure,
[S, x]= chisq(40,res);
axis([ 0 40 -0.2 1.2]);

figure,
[S, x]= chisq(40,res,in);
axis([ 0 40 -0.1 0.1]);

data = iddata(out, in,Ts);
oeModel = oe(data,[2,2,1]);
figure,
compare(data,oeModel);

figure,
resid(oeModel,data);
res = get(resid(oeModel,data), 'y');
figure,
[S, x] = chisq(50, res, in);

figure,
b=acorrf(res,50,1);
axis([ 0 50 -0.2 1.2]);

figure,
b2=pacorrf(res,50,1);
axis([ 0 50 -0.4 1]);

Mbj = bj(data,[2 2 2 2 1]);
figure,
compare(data,Mbj);

present(Mbj);
figure,
resid(Mbj,data);

residues= resid(Mbj,data);
res=get(residues,'y');

figure,
[S, x]= chisq(40,res);
axis([ 0 40 -0.2 1.2]);

figure,
[S, x]= chisq(40,res,in);
axis([ 0 40 -0.1 0.1]);



