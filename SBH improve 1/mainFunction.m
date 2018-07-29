function [eta] = mainFunction (Eg_eV,c2,c3,X_eV,PhiM_eV)
%# calculate efficiency of Schottky junction cell following Pulfrey & McOuat paper
%#********************************************************************************

%# specify parameters:
%#*******************
%Nd = 3 * 10^17 /10^-6; # defect density; from Srivastava paper in 1/m^3;
%eps_sc = 11.8; # dielectric constant; for Si from Srivastava paper
%Eg_eV = 1.4; # band gap; for Si from Srivastava paper
%X_eV = 4.05; # electron affinity; of Si from Srivastava paper
%PhiM_eV = 4.85; # work function of metal; here for graphene
meff = 0.93; % effective mass; correspond to A*=112 A/(cm^2 *K) for n-Si
T = 300; % temperature (in Kelvin)
As=1200000/(1.6*10^-19);
%# constants:
%#************
me = 9.1* 10^-31;
h = 6.626 * 10^-34; 
el = 1.6 * 10^-19;
kB = 1.38 * 10^-23;
c = 3*10^8;

%# derived quantities:
%#********************
kT = kB*T; 

%# calculation start below:
%**************************
%Vbi_eV = Vbi(X_eV, PhiM_eV, Nd, meff, kT/el) ; # built-in potential
%w = width(Vbi_eV, eps_sc, Nd); # width of depletion region
w = 1;
[Ip, Pin] = Iph(Eg_eV * el, w, h*c); % light induced current
[SBH_eV]=getSBH2(c2,c3,PhiM_eV);
[Vmp] = getVmp2(Ip, SBH_eV * el, kT, h, el,T,As); % calculate voltage at maximum power

[eta] = geteta(el * Vmp, SBH_eV * el, meff*me, kT, Pin, h,T,As,kB);
eta=eta*100;
end
