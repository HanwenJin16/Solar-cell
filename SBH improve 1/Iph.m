function [Jph, Pin] = Iph(Eg, w, hc)

  dat = load("am2.dat");  %loads in AM1.5 spectrum
  lambdas = dat(:,1) * 10^-9; % convert from nm to m
  am1p5 = dat(:,4) / 10^-9; % in W/(m^2 nm) -> W/(m^2 m)

  %dat = load("am0.dat"); # loads in AM0 spectrum
  %lambdas = dat(:,1) * 10^-9; # convert from nm to m
  %am1p5 = dat(:,2) / 10^-9; # in W/(m^2 nm) -> W/(m^2 m)

  E_phot = hc ./lambdas; % photon energy = h * c / lambda
  Phi = am1p5 ./ E_phot; % number of photons/(time area wavelength)

  %# FIX: probably should make alphas an input param
  alphas = 10^5 * ones(size(lambdas)); % absorption coefficient (in 1/m)
  lam_max = hc / Eg; % can only absorb when wavelength shorter than gap value
  Jph = trapz(lambdas, Phi .* (lambdas < lam_max) .* (1 - exp(-alphas * w) )); % electron current density
  Pin = trapz(lambdas, am1p5); % incoming power in W/m^2

end
