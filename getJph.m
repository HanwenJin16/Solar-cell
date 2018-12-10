function [ Jph,Pin ] = getJph(Eg,w,Lp)
  h=6.63e-34;%Plank constant
  e=1.6e-19;%electron charge
  c=3e8;%light speed
  hbar=h/(2*pi);%Reduced plank constant
  kB=1.38e-23;%Boltzman costant
  me=9.11e-31;%Electron mass
  eps_0=8.85e-12;%vacuum permitivity
  T=300;%Temperature, not constant, here it was assumed to be a universe 
  %Derived quantity
  hc=h*c;
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %code starts here
  dat = load("am2.dat");  %loads in AM1.5 spectrum
  %Load the absorbsion coefficient for Si
  lambdas = dat(:,1); % convert from nm to m
  am1p5 = dat(:,4); % in W/(m^2 nm) -> W/(m^2 m)
  n=size(lambdas);
  alphas=load('alphas.txt');
  lambdas=lambdas*1e-9;
  am1p5 = am1p5/1e-9;
  %The data below are used to calculate AM0
  %dat = load("am0.dat"); % loads in AM0 spectrum
  %lambdas = dat(:,1) * 10^-9; % convert from nm to m
  %am1p5 = dat(:,2) / 10^-9; % in W/(m^2 nm) -> W/(m^2 m)
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %load the absorpsion sepctrum for Si
  Eph = hc ./lambdas;
  Phi = am1p5 ./ Eph;
  lam_max = hc / (Eg*e);
  a=lambdas<lam_max;
  Pin = trapz(lambdas, am1p5);
  Phi=Phi.*a;
  Jph = trapz(lambdas, Phi .*(1-exp(-alphas*w)./(1+alphas*Lp)) );
 
end

