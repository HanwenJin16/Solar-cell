Eg_eV=2.42;
X_eV = 4.05;
y= [0:50];
minimum=4.5;
maximum=5.6;
k=(maximum-minimum)/50;
c2=0.38;
c3=-1.17;
x=[minimum:k:maximum];
for n=1:51;
  xn=x(n);
  yn=mainFunction(Eg_eV,c2,c3,X_eV,xn);
  y(n)=yn;
end

