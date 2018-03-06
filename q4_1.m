% open return.mat
load('returns.mat')
% compute sharp ratio
weight = [1.853652057369482e-09;0.019117192886523;0.980882805259825]
w_naive = [1/3;1/3;1/3]
return_mv = A' * weight;
return_naive = A' * w_naive;
risk_free = 0.02;
rf_1 = (mean(return_mv) - risk_free)/std(return_mv);
rf_2 = (mean(return_naive) - risk_free)/std(return_naive);