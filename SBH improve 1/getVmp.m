function [Vmp] = getVmp(Ip, SBH, meff, kT, h, el)
  
  I0 =  4*pi*meff/h^3 * kT^2 * exp(-SBH / kT); % from Eqs 30 and 31 from di Bartolomeo

  eVs = [-0.01 : 0.0001 : 0.01]';
  Vmp = kT/2 * Ip/I0 / el;
  printf("Ip/I0:      %f \n", Ip/I0);
  printf("Vmp (in V): %f (linear)\n", Vmp);
  
endfunction;
