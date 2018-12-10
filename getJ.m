function [ Jsm,Jms,Jh,Jrec ] = getJ(ni,Nd,tau_c,SBH,dSBH,V,c2,Dp,Lp,W,tau_d,T_tr)
%Universe constants
h=6.63e-34;%Plank constant
e=1.6e-19;%electron charge
c=3e8;%light speed
hbar=h/(2*pi);%Reduced plank constant
kB=1.38e-23;%Boltzman costant
me=9.11e-31;%Electron mass
eps_0=8.85e-12;%vacuum permitivity
T=300;%Temperature, not constant, here it was assumed to be a universe 
vf=1e6;%Graphene fermi velocity
%constant, because we will usually work at 300K
kT=kB*T;
%Derived quantity from device
Pn0=ni^2/Nd;
D0=2/(pi*hbar^2*vf^2);
A_G=D0*kB^2/tau_c*(e*SBH/kT+1);
SBH_G=SBH+dSBH;
Vs=c2*V;
Vi=(1-c2)*V;
Jsm=A_G*T^2*T_tr*exp(-e*SBH_G/kT).*exp(e*Vs/kT);
Jms=A_G*T^2*T_tr*exp(-e*SBH_G/kT).*exp(-e*Vi/kT);
Jh=Pn0*Dp/Lp*(exp(e*V/kT)-1);
Jr0=ni*W/(2*tau_d);
Jrec=Jr0.*exp(e*V/(2*kT)).*(1-exp(-e*V/kT));

end