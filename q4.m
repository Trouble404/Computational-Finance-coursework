clear all

m = [-2.36279683,-0.6701847,0.19656992]'
c = [649.91101967, 71.36468149,171.02586869;
     71.36468149,255.46633092, 108.39729831;
      171.02586869,108.39729831, 240.91165487 ]

%Markowitz portfolio
n=3;
cvx_begin quiet
variable weight(n)
    minimize (weight'*c*weight)
    subject to
        weight'* m == 0.18;   
        weight'* ones(n,1)== 1;
        weight >= 0;
cvx_end



