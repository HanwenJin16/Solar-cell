%# calculate efficiency of Schottky junction cell following Pulfrey & McOuat paper
%#********************************************************************************

%# specify parameters:
%#*******************
Nd = 3 * 10^17 /10^-6; % defect density; from Srivastava paper in 1/m^3;
eps_sc = 11.8; % dielectric constant; for Si from Srivastava paper
Eg_eV = 1.12; % band gap; for Si from Srivastava paper
X_eV = 4.05; % electron affinity; of Si from Srivastava paper
PhiM_eV = 4.85; % work function of metal; here for graphene
T = 300; % temperature (in Kelvin)
As=1200000/(1.6*10^-19);
eps_0=8.85e-12;
c2=0.27;%the value of c2 and c3 were taken form Thesis-Anlun
c3=-0.52;
E_D=4.3;%dirac point of graphene, in range of 4.3-4.7eV
Ef_gra=PhiM_eV-E_D;%Here i have just chosen a random fermi level.
meff = 0.93; % effective mass; correspond to A*=112 A/(cm^2 *K) for n-Si
ni=9.65e15;
%# constants:
%#************
me = 9.1* 10^-31;
h = 6.626 * 10^-34; 
el = 1.6 * 10^-19;
kB = 1.38 * 10^-23;
c = 3*10^8;
eps_r=eps_0*eps_sc;
%# derived quantities:
%#********************
kT = kB*T; 
%***********************************
%Parameters for the surface state
Dss=2.7e17;
delta=5e-9;
eps_ox=eps_0*4;
phi_0=0.30;%from sze's paper. 
Dp=0.11;
tau=3.33e-7;
Lp=sqrt(Dp*tau);
%# calculation start below:
%**************************
[Vbi_eV] = Vbi(X_eV, PhiM_eV, Nd, meff, kT/el) ; % built-in potential
w = width(Vbi_eV, eps_r, Nd); % width of depletion region
[Ip, Pin] = Iph(Eg_eV * el, h*c); % light induced current
%[SBH] = getSBH2 (c2, c3,PhiM_eV);
[c2,SBH]=getSBH3(el,delta,Dss,eps_ox,PhiM_eV,Eg_eV,X_eV,phi_0);
V=0:0.0001:2;
[ng, dSBH ] = getdSBH( el,eps_r,Nd,kT,Vbi_eV,V,h );
[ Jsm,Jms,Jh,Jrec] = getJ( el,h,T,V,ni,c2,SBH,kT,meff*me,Dp,Nd,tau,Lp,ng,dSBH,eps_ox,X_eV,w);
[Vmax,Pmax] = getVmp3(Jsm,Jms,Jh,Jrec,Ip,V);
eta=Pmax*el/Pin
%[Vmp,Pm,J0] = getVmp3(Ip,SBH, kT, h, el,T,As,eps_r,Nd,Vbi_eV,Ef_gra,eta_id);
%eta=Pm/Pin*100;
