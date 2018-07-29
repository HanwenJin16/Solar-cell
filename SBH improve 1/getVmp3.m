function [Vmp,Pm] = getVmp3(Ip,SBH, kT, h, el,T,As,eps_r,Nd,V_bi,Ef_gra)
%eps=permitivity of the substrate?
%v_f=fermi velocity
%n0=doping density of graphene
I0_cst =  As*T^2 ;%constant in front of I0
V=[0:0.0001:2];
P=V;
k=0;
for n=0:0.0001:2 
    [ dSBH ] = getdSBH( el,eps_r,Nd,kT,V_bi,n,h,Ef_gra );
    k=k+1;
    I0=I0_cst*exp(-SBH*el/kT)*exp(-dSBH*el/kT);
    P(k)=n*I0*(exp(el*n/kT)-1)-Ip*n;
end
[a,b]= min(P);
Pm=P(b);
Pm=abs(Pm)*el;
fprintf('The maximum power is: %f watts. %n',Pm)
Vmp=V(b);
fprintf('The maximum voltage is: %f V. %n',Vmp)
end
