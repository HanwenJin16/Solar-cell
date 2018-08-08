function [Vmp,Pm,J0] = getVmp3(Ip,SBH, kT, h, el,T,As,eps_r,Nd,V_bi,Ef_gra)
%eps=permitivity of the substrate?
%v_f=fermi velocity
%n0=doping density of graphene
%I0_cst =  As*T^2 ;%constant in front of I0
kB=1.38e-23;
V=[0:0.0001:1];
P=V;
k=0;
vf=1e6;
hbar=h/(2*pi);
D0=2/(pi*hbar^2*vf^2);%Given in equation 73 of big review
%fprintf('the value of D0 is %f %n',D0)
tau=4.62e-11;%injection rate of carriers from the contact to graphene. 
[ dSBH ] = getdSBH( el,eps_r,Nd,kT,V_bi,V,h,Ef_gra )
SBH_V=SBH;%+dSBH;
[Astar]=getAstar(el,SBH,D0,tau,kB,kT);
Astar=As
fprintf('A*= %f %n',Astar*el/10000)
J0=Astar*T^2*exp(-el*SBH_V/kT);
P=V.*(J0.*exp(el*V/kT)-Ip);
[a,b]= min(P);
Pm=P(b);
Pm=abs(Pm)*el;
fprintf('P_max= %f watts. %n',Pm)
Vmp=V(b);
fprintf('V_max= %f V. %n',Vmp)
end
