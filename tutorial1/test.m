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