function [b]=pacorrf(yk,L,PLOT);
%PACORRF
% This program calculates Partial Autocorrelation Function Coefficients 
% for a specified lag L for yk sequence.
% PACF coefficients are normalized wrt coefficient at L=0; 
% 95 % Confidence Intervals are computed, PACF and 95 % CI are displayed.
%
% [b]=pacorrf(yk,L,PLOT);
%
% b - b(:,1) contains lag index, b(:,2) contains PACF coeficients. 
%
%  PLOT - PLOT=0 gives no plots. PLOT=1 gives a plot of PACF coefficients
%  (Default: PLOT=1)  
%
% Last revision: October 15, 2014                     M.S. Zywno


%==========================================================================
%	o Added option for turning plot on/off 
%==========================================================================
if nargin<3
    PLOT=1;
end

% ----------------------------------------------------------------------
% check if yk is a row vector:
% ----------------------------------------------------------------------
yk=vector(yk,'row');
% ----------------------------------------------------------------------
% Compute ACF coefficients: 
% ----------------------------------------------------------------------
sigma=yk*yk';
zz=yk;
n=max(size(yk));
Y=zeros(L,n);
Y(1,:)=zz;
for k=2:L
  Y(k,k:n)=zz(1:(n-k+1));
end
for i=1:L
ACF(i)=Y(1,:)*Y(i,:)'/sigma;
end
LAGS=[0 1:L-1]';
ACF=ACF';
%------------------------------------------------------------------
% compute partial correlation function using Yule-Walker equations
%------------------------------------------------------------------
RL=ACF(2:L);
B=RL(1:L-1);
   for ik=1:L-1
   %home,'Size of R matrix = ',ik 
       for i=1:ik
       for j=(1+i):ik
           R(i,j)=RL(j-i);
       end
           R(i,i)=1;
       end
       for i=2:ik
       for j=1:(i-1)
           R(i,j)=R(j,i);
       end
       end
   end
for i=1:L-1
   B1=B(1:i);
   R1=R(1:i,1:i);
   X=inv(R1)*B1;
   PACF(i)=X(i);
  % home,' PACF calculation for lag = ',i
end
PACF=[0 PACF]';
 b=[LAGS PACF];
[xx,yy]=line_plot(LAGS,PACF);
%------------------------------------------------------------------
% compute 95 % confidence intervals for partial autocorrelation function 
%------------------------------------------------------------------
for i=1:L
  vrp(i)=2/sqrt(n);
end
CI1=vrp;
CI2=-vrp;
nn = max(size(xx));
C1 = zeros(nn,1);
C2 = zeros(nn,1);
C1(2:3:nn) = CI1;
C1(3:3:nn) = CI1;
C2(2:3:nn) = CI2;
C2(3:3:nn) = CI2;
%------------------------------------------------------------------
% plot PACF with 95 % confidence intervals 
%------------------------------------------------------------------
   if PLOT==1
    z1=max(yy);z2=min(yy);
    z3=max(C1);z4=min(C2);
    zz1=max(z1,z3);
    zz2=min(z2,z4);
    plot(xx,yy,xx,C1,'.r',xx,C2,'.r')
    title('Partial Correlation function of yk with 95 % Confidence Limits')
    xlabel(['Number of Lags = ' num2str(L)])
    %axis([-1 L 1.2*z2 1.2*z1]);
    grid
    axis([-L L 1.2*z2 1.2*z1])
    %axis([-L L -1.2 1.2]);
    axis([-1 L -1 1]);
    b=[LAGS PACF];
 end
 end






