function price = AmPutLattice(S0,K,r,T,sigma,N)
deltaT = T/N; %calculate delta t
u=exp(sigma * sqrt(deltaT)); %calculate rising rate
d=1/u;%calculate decrasing rate
p=(exp(r*deltaT) - d)/(u-d);% calculate the probability of rising
discount = exp(-r*deltaT);
p_u = discount*p; % risk-neutral probability of going up
p_d = discount*(1-p);% risk-neutral probability of going up

SVals = zeros(2*N+1,1);
SVals(N+1) = S0;

for i=1:N
SVals(N+1+i) = u*SVals(N+i);
SVals(N+1-i) = d*SVals(N+2-i);
end
PVals = zeros(2*N+1,1);
for i=1:2:2*N+1
PVals(i) = max(K-SVals(i),0);
end

for tau=1:N
    for i= (tau+1):2:(2*N+1-tau)
        hold = p_u*PVals(i+1) + p_d*PVals(i-1);
        PVals(i) = max(hold, K-SVals(i));
    end
end


price = PVals(N+1);

