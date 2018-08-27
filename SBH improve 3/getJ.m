function [ Jsm,Jms,Jh,Jrec] = getJ( el,h,T,V,ni,c2,SBH,kT,m,Dp,Nd,tau,Lp,ng,dSBH,eps_i,Xi_s,w)
%Pn0 is the minority carrier density in the bulk.
%Ttra is the transmission coefficient 
e=el;
Pn0=ni^2/Nd;
Pn0=853*1e6;
kB=1.38e-23;
vf=1e6;
hbar=h/(2*pi);
D0=2/(pi*hbar^2*vf^2);
tau_gra=4.62e-11;
Delta=-ng/eps_i;
Vs=V*c2;
Vi=V-Vs;
Ttra=exp(-8*pi/(3*h)*sqrt(2*m)./(Delta-Vi).*((Xi_s+Delta-Vi).^1.5-Xi_s^1.5));
[ Astar ] = getAstar( e,SBH,D0,tau_gra,kB,kT )
Jsm=Astar*T^2.*exp(-e*(SBH+dSBH)/kT).*exp(el*Vs/kT);
Jms=Astar*T^2.*exp(-e*(SBH+dSBH)/kT).*exp(-el*Vi/kT);
Jh=Pn0*Dp/Lp*(exp(e*V/kT)-1);
Jro=ni*w/(2*tau)
Jrec=Jro.*exp(e*V/(2*kT)).*(1-exp(-e*V/kT));

end

