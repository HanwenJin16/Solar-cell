function [Vmp] = getVmp2(Ip, SBH, kT, h, el,T,As)
  
  I0 =  As*T^2 * exp(-SBH / kT); % from Eqs 30 and 31 from di Bartolomeo

  xs = [-1 : 0.001 : 200]'; % x = eV/kT
  Nx = length(xs);
  f = (1 + xs) .* exp(xs) - (1 + Ip/I0); % solve Eq 3 from Pulfrey paper
  %printf("I0 (in A): %f \n", I0);
  %# find f=0 points:
  [a,b]=min(abs(f));
  xmin=xs(b);
  Vmp = kT/el * xmin;
  
  fprintf("Vmp (in V): %f \n", Vmp);
  
end
