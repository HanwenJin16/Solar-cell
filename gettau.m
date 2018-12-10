function [ tau ] = gettau(Nd,Nt)
B1S=1e-11;%Radiative recombinnation coefficient
B1=1.2e-32;%Auger recombination coefficient
T1S=1.12e-8;%SRH recombination coefficient
Nd=Nd*1e-6;%Convert m^-3 to cm^-3
tau_A=1/(B1*Nd^2);
tau_r=1/(B1S*Nd);
tau_SRH=1/(T1S*Nt);
tau=1/(1/tau_A+1/tau_r+1/tau_SRH);
end
