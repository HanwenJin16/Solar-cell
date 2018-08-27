function w = width(Vbi_eV, eps_sc, Nd)
e=1.6e-19;
  w = sqrt(2*eps_sc/e * Vbi_eV /Nd);
  fprintf("width of depletion region (in nm): %f \n",w*10^9);

end
