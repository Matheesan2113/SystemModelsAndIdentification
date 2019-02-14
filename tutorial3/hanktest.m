%HANKTEST
% Hankel Matrix test for the order of parametric model from impulse weights
% Input: wi - sequence of impulse weights
% Output: determinants of Hankel matrices for n=1 to 7
%         if n is the order of the system, then Sdet(n+1) = 0
% i.e. the last non-zero value of determinant suggests order of the system
% Due to numerical roundoffs, watch for a large relative drop in the 
% determinant value as a clue.  
%
%        Sdet=hanktest(wi,LOG);
%
% LOG(optional) - change scale of y-axis to logarithmic and reverse
% direction.
% 
% Last revision: August 31, 2013                     M.S. Zywno


%==========================================================================
% Modifications history:
%==========================================================================
%	o Added option for ploting in reverce logorithmic scale along Yaxis
%                                               Oct. 25 , 2013 Vagif Veliev
%==========================================================================


function Sdet=hanktest(wi,LOG);
if nargin<2
    LOG=0;
end
for k=1:7
c=wi(1:k);
r=wi(k:2*k-1);
S=hankel(c,r);
Sdet(k)=det(S);
a(k)=abs(det(S));
end
format long
disp(' ')
disp('Theoretically, if the order of the system is n, the Hankel matrix of order')
disp('(n+1) will have a zero determinant. Therefore we should watch out for the')
disp('LAST NON-ZERO determinant of Hankel matrices. Due to numerical inaccuracies')
disp('the (n+1) determinant may not be exactly zero, so to identify the likely')
disp('order of the system watch for the LARGE DROP in values of determinants of')
disp('Hankel matrices')
disp(' ')
disp('NOTE: The actual numerical value of the determinant is irrelevant as long')
disp('as it is non-zero.')
disp(' ')
disp(' ')
disp('System Order                         Test Result ')
disp('===============================')

disp(['order n = 1                              '   num2str(Sdet(1))])
disp(['order n = 2                              '   num2str(Sdet(2))])
disp(['order n = 3                              '   num2str(Sdet(3))])
disp(['order n = 4                              '   num2str(Sdet(4))])
disp(['order n = 5                              '   num2str(Sdet(5))])      
disp(['order n = 6                              '   num2str(Sdet(6))])
disp(['order n = 7                              '   num2str(Sdet(7))])

stem([0:7],[0 a])
if LOG==1
set(gca,'YScale','log','YDir','reverse')
end
legend('Results of Hankel Test - look for the largest non-zero determinant')
format short




