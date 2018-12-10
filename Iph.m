function [Jph, Pin] = Iph(Eg, hc,w,Lp)

  dat = load("am2.dat");  %loads in AM1.5 spectrum
  lambdas = dat(:,1) * 10^-9; % convert from nm to m
  am1p5 = dat(:,4) / 10^-9; % in W/(m^2 nm) -> W/(m^2 m)
  dat2=load('alpha.txt');
  alphas=dat2(:,2);

  %dat = load("am0.dat"); % loads in AM0 spectrum
  %lambdas = dat(:,1) * 10^-9; % convert from nm to m
  %am1p5 = dat(:,2) / 10^-9; % in W/(m^2 nm) -> W/(m^2 m)

  E_phot = hc ./lambdas; % photon energy = h * c / lambda
  Phi = am1p5 ./ E_phot; % number of photons/(time area wavelength)

  %# FIX: probably should make alphas an input param
  
  lam_max = hc / Eg; % can only absorb when wavelength shorter than gap value
  Jph = trapz(lambdas, Phi .* (lambdas < lam_max).*(1-exp(-alphas*w)./(1+alphas*Lp))); % electron current density
  Pin = trapz(lambdas, am1p5); % incoming power in W/m^2

end
