function price = AmCallLattice(S0,K,r,T,sigma,N)
deltaT = T/N;
u=exp(sigma * sqrt(deltaT));
d=1/u;
p=(exp(r*deltaT) - d)/(u-d);
discount = exp(-r*deltaT);
p_u = discount*p;
p_d = discount*(1-p);
SVals = zeros(2*N+1,1);
SVals(N+1) = S0;

for i=1:N
SVals(N+1+i) = u*SVals(N+i);
SVals(N+1-i) = d*SVals(N+2-i);
end
PVals = zeros(2*N+1,1);
for i=1:2:2*N+1
PVals(i) = max(SVals(i)-K,0);
end

for tau=1:N
    for i= (tau+1):2:(2*N+1-tau)
        hold = p_u*PVals(i+1) + p_d*PVals(i-1);
        PVals(i) = max(hold, SVals(i)-K);
    end
end


price = PVals(N+1);