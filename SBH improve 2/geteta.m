function [eta] = geteta(eVmp, SBH, meff, kT, Pin, h,T,As,kB)
  e =  eVmp^2 * As*kT/kB^2 * exp(-SBH/kT) * exp(eVmp/kT); % Eq 2 from Pulfrey
  e = e/Pin;
  %printf("efficiency (in percent): %f \n",eta * 100);
  eta=e;
end
