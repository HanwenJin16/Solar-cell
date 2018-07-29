y=[0:50];
k=(2.4-0.5)/50;
x=[0.5:k:2.4];
for n=1:51;
  xn=x(n);
  yn=mainFunction2(xn,xn);
  y(n)=yn;
end
