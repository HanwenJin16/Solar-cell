function [eta] = geteta(eVmp, SBH, meff, kT, Pin, h,T,As,kB)
  eta =  eVmp^2 * As*kT/kB^2 * exp(-SBH/kT) * exp(eVmp/kT); % Eq 2 from Pulfrey
  eta = eta/Pin;
  fprintf("efficiency (in percent): %f \n",eta * 100);
  %eta=e;
end
