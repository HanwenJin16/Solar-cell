function w = width(Vbi_eV, eps_sc, Nd);

  %# calculation in atomic units
  Vbi = Vbi_eV / 27.21;
  Nd *= (0.5291 * 10^-10)^3;
  w = sqrt(eps_sc * Vbi /(2*pi*Nd ));
  w *= 0.5291 * 10^-10; % convert from bohr to meter
  printf("width of depletion region (in nm): %f \n",w*10^9);

endfunction;
