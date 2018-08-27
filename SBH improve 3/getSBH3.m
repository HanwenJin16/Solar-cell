function [ c2,SBH ] = getSBH3(e,delta,Dss,eps_ox,PhiM_eV,Eg_eV,X_eV,phi_0)
gamma=e*Dss*delta/eps_ox;
c2=1/(1+gamma);
SBH=c2*(PhiM_eV-X_eV)+(1-c2)*(Eg_eV-phi_0);
end

