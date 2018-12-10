%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
%Device parameters:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%These are the varibles dependent on fabricaition
Nd=3e23;%Doping density
Dss=5e16;%Density of surface state
delta=1e-9;%Oxide thickness
chi=0.05;
Phi_0=0.3;
Nt=1e13;%In unit of cm^-3, Value taken from Peter Landsberg Recombination in semiconductor pp 142. 
%These are varibles dependedt on the varible above
ni=9.65e15;
Dp=0.0011;
[tau_b]=gettau(Nd,Nt);%Recombination rate at bulk
tau_M=4.62e-11;%Injection rate of charge carriers from contact. 
[tau_d]=gettau(0,Nt);%The majority carrier concentration in the depletion region can assume to be 0
Lp=sqrt(Dp*tau_b);
%These are some material properties of semiconductor junction
eps_ox=eps_0*4;%Dielectric constant of SiO2 is 4
Eg=1.12;%Band gap of Si is 1.12eV
eps_sc=11.8;
eps_r=eps_0*eps_sc;
meff=0.93;%The effective mass of Si
m=meff*me;
X=4.05;%Electron affinity of Si
Ef_gra=4.85;%graphene fermi-level is 4.85
%Here the program starts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Get bias voltage
[Vbi]=getVbi(Ef_gra,X,Nd,m);
%Get depletion width
W=sqrt(2*eps_r/(e*Nd)*Vbi);
%Get photocurrent, and power input
[ Jph,Pin ] = getJph(Eg,W,Lp);
c2=(eps_ox)/(eps_ox+e*Dss*delta);
c3=(1-c2)*(Eg-Phi_0)-c2*X;
SBH=c2*Ef_gra+c3;
V=0:0.001:(Vbi-kT/e);
[dSBH]=getdSBH(Nd,Vbi,V,eps_r);
T_tr=exp(-delta*sqrt(chi)*1e10);
[Jsm,Jms,Jh,Jdep]=getJ(ni,Nd,tau_M,SBH,dSBH,V,c2,Dp,Lp,W,tau_d,T_tr);
Jd=Jsm+Jh+Jdep-Jms;
Jtot=Jph-Jd;
P=V.*Jtot;
Pmax=max(P);
eta=e*Pmax/Pin*100



