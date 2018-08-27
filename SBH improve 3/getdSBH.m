function [ng, dSBH ] = getdSBH( e,eps_r,Nd,kT,Vb,V,h )
%This function return the change in schottky barrier height in eV, given the
%varibles:
%eps_r:relative permitivity of material
%Nd=substrate doping level
%Eg:band gap of semiconductor
%kT:kB*T
%Vb:built in potnetial
%V:bias voltage
%n0:density of electrons at gate voltage zerro.
vf=1e6;%fermi velocity of graphene us 1e6 given in Wallace, P. R., 1947, Phys. Rev. 71, 622.
hbar=h/(2*pi*e);
n0=sqrt((2*eps_r*Nd/e)*(Vb-kT/e));
a=(h/(4*sqrt(pi)))*vf*sqrt((eps_r*Nd)/(2*e*n0));
dSBH=-a*(sqrt(Vb-V-kT/e)-sqrt(Vb-kT/e));
ng=-sqrt(2*eps_r*Nd*(Vb-V-kT/e)/e);
%fprintf('the change in schottky barrier height is ')
dSBH=-dSBH/e;
end

