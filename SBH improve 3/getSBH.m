function SBH = getSBH(X_eV, PhiM_eV);
  
  SBH = PhiM_eV - X_eV;
  printf("Schottky barrier height (eV): %f \n",SBH);
  
endfunction;
