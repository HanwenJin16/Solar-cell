function [Vmp,Pm] = getVmp3(Ip,SBH, kT, h, el,T,As,eps_r,Nd,V_bi,Ef_gra)
%eps=permitivity of the substrate?
%v_f=fermi velocity
%n0=doping density of graphene
%I0_cst =  As*T^2 ;%constant in front of I0
V=[0:0.0001:2];
P=V;
k=0;
vf=1e6;
hbar=h/(2*pi);
D0=2/(pi*hbar^2*vf^2);%Given in equation 73 of big review
%fprintf('the value of D0 is %f %n',D0)
tau=4.62e-11;%injection rate of carriers from the contact to graphene. 
for n=0:0.0001:2 
    [ dSBH ] = getdSBH( el,eps_r,Nd,kT,V_bi,n,h,Ef_gra );
    SBH_V=SBH+dSBH;
    [J0]=getJ0( el,SBH_V,D0,tau,kT );%keep in mind it is current density, since unit area, it is equal to I0
    k=k+1;
    J=J0*(exp(el*n/kT)-1)-Ip;
    P(k)=J*n;
end
[a,b]= min(P);
Pm=P(b);
Pm=abs(Pm)*el;
fprintf('The maximum power is: %f watts. %n',Pm)
Vmp=V(b);
fprintf('The maximum voltage is: %f V. %n',Vmp)
end
