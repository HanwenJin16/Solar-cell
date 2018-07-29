function V = Vbi(X_eV, PhiM_eV, Nd, meff,kT)

  %# calculation in atomic units:
  Nc = 2 * (meff * kT/(2*pi) )^(3/2); % Eq 4 from di Bartolomeo 
  %Nd = (0.5291 * 10^-10)^3;
  EF_eV = X_eV - kT * log(Nd/Nc);
  V = PhiM_eV - EF_eV;
  fprintf("X (eV) = %f, PhiM (eV) = %f, EF (eV) = %f \n",X_eV, PhiM_eV, EF_eV);
  fprintf("built-in potential (eV) = %f \n",V);
  
end
