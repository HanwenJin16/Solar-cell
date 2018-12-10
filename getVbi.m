function [Vbi]=getVbi(Ef_gra,X,Nd,m)
%Universe constants
h=6.63e-34;%Plank constant
e=1.6e-19;%electron charge
c=3e8;%light speed
hbar=h/(2*pi);%Reduced plank constant
kB=1.38e-23;%Boltzman costant
me=9.11e-31;%Electron mass
eps_0=8.85e-12;%vacuum permitivity
T=300;%Temperature, not constant, here it was assumed to be a universe 
%constant, because we will usually work at 300K
kT=kB*T;
%Program starts here
Nc = 2 * (m * kT/(2*pi*hbar^2) )^(3/2);
Ef_s=X-kT/e*log(Nd/Nc);
Vbi=Ef_gra-Ef_s;
end

