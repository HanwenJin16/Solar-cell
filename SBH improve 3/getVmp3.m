function [Vmax,Pmax] = getVmp3(Jsm,Jms,Jh,Jrec,Jph,V)
Jd=-(Jsm-Jms-Jh-Jrec);
J=Jph-Jd;
P=J.*V;
[Pmax,n]=max(P);
Vmax=V(n);
end
