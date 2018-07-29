function [ J0 ] = getJ0( el,SBH_V,D0,tau,kT )
%el:electron charge,
%SBH_V: the bias dependent SBH
%D0: the density of state of graphene, 
%tau:  injection rate of carriers from the contact to graphene 
%Calculation starts below
J0=((D0/tau)*kT^2*(el*SBH_V/kT+1))*exp(-el*SBH_V/kT);
%fprintf('the valur of J0 is: %f %n',J0)
end

