%# calculate efficiency of Schottky junction cell following Pulfrey & McOuat paper
%#********************************************************************************

%# specify parameters:
%#*******************
Nd = 3 * 10^17 /10^-6; % defect density; from Srivastava paper in 1/m^3;
eps_sc = 11.8; % dielectric constant; for Si from Srivastava paper
Eg_eV = 1.4; % band gap; for Si from Srivastava paper
X_eV = 4.05; % electron affinity; of Si from Srivastava paper
PhiM_eV = 4.85; % work function of metal; here for graphene
meff = 0.93; % effective mass; correspond to A*=112 A/(cm^2 *K) for n-Si
T = 300; % temperature (in Kelvin)
As=1200000/(1.6*10^-19);
eps_0=8.85e-12;
c2=0.27;%the value of c2 and c3 were taken form Thesis-Anlun
c3=-0.52;
Ef_gra=0.1;%Here i have just chosen a random fermi level.
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

%# calculation start below:
%**************************
[Vbi_eV] = Vbi(X_eV, PhiM_eV, Nd, meff, kT/el) ; % built-in potential
%w = width(Vbi_eV, eps_sc, Nd); % width of depletion region
w = 1;
[Ip, Pin] = Iph(Eg_eV * el, w, h*c); % light induced current
[SBH] = getSBH2 (c2, c3,PhiM_eV);
[Vmp,Pm] = getVmp3(Ip,SBH, kT, h, el,T,As,eps_r,Nd,Vbi_eV,Ef_gra);
eta=Pm/Pin*100;
fprintf('the efficiency of the solar cell is %f percent. \n ',eta)