function [ Astar ] = getAstar( el,SBH,D0,tau,kB,kT )

Astar=(D0*kB^2)/tau*(el*SBH/kT+1);

end

