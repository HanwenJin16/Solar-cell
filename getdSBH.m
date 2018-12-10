function [dSBH]=getdSBH(Nd,Vbi,V,eps_r)
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

Emax=sqrt(2*e*Nd/eps_0*(Vbi-V-kT/e));
dSBH=sqrt(e*Emax/(4*pi*eps_r));

end